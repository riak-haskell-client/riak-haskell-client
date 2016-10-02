{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE LambdaCase                #-}

module Network.Riak.DSL
  ( -- * Riak DSL
    Riak
  , RiakF(..)
    -- * Interpreters
  , execute
  , rollback
  ) where

import Control.Exception                (finally)
import Control.Monad.Trans.Free
import Data.Aeson                       (FromJSON, ToJSON)
import Data.Sequence                    (Seq)
import Network.Riak.Content             (Content)
import Network.Riak.Types
import Network.Riak.Protocol.ServerInfo (ServerInfo)

import qualified Network.Riak.Basic as Basic
import qualified Network.Riak.JSON  as JSON
import qualified Network.Riak.Value as Value


--------------------------------------------------------------------------------
-- Riak DSL

data RiakF a
  -- Connection management
  = Ping a
  | GetClientID (ClientID -> a)
  | SetClientID ClientID a
  | GetServerInfo (ServerInfo -> a)
  -- Basic API
  | Get (Maybe BucketType) Bucket Key R (Maybe (Seq Content, VClock) -> a)
  | Put (Maybe BucketType) Bucket Key (Maybe VClock) Content W DW ((Seq Content, VClock) -> a)
  | Put_ (Maybe BucketType) Bucket Key (Maybe VClock) Content W DW a
  | Delete (Maybe BucketType) Bucket Key RW a
  -- JSON API
  | forall c. (FromJSON c, ToJSON c) =>
    PutIndexedJSON (Maybe BucketType) Bucket Key [IndexValue] (Maybe VClock) c W DW (([c], VClock) -> a)
  -- Value API
  | GetByIndexValue Bucket IndexQuery ([Key] -> a)

instance Functor RiakF where
  fmap f = \case
    Ping k -> Ping (f k)
    GetClientID k -> GetClientID (f . k)
    SetClientID a k -> SetClientID a (f k)
    GetServerInfo k -> GetServerInfo (f . k)
    Get a b c d k -> Get a b c d (f . k)
    Put a b c d e g h k -> Put a b c d e g h (f . k)
    Put_ a b c d e g h k -> Put_ a b c d e g h (f k)
    Delete a b c d k -> Delete a b c d (f k)
    PutIndexedJSON a b c d e g h i k -> PutIndexedJSON a b c d e g h i (f . k)
    GetByIndexValue a b k -> GetByIndexValue a b (f . k)

type Riak a = FreeT RiakF IO a


--------------------------------------------------------------------------------
-- Interpreters

-- | Interpret a 'Riak' expression in 'IO'.
execute :: Connection -> Riak a -> IO a
execute conn = iterT (executeAlg conn)

executeAlg :: Connection -> RiakF (IO a) -> IO a
executeAlg conn = \case
  Ping k                           -> Basic.ping conn                      >>  k
  GetClientID k                    -> Basic.getClientID conn               >>= k
  SetClientID a k                  -> Basic.setClientID conn a             >>  k
  GetServerInfo k                  -> Basic.getServerInfo conn             >>= k
  Get a b c d k                    -> Basic.get conn a b c d               >>= k
  Put a b c d e f g k              -> Basic.put conn a b c d e f g         >>= k
  Put_ a b c d e f g k             -> Basic.put_ conn a b c d e f g        >>  k
  Delete a b c d k                 -> Basic.delete conn a b c d            >>  k
  PutIndexedJSON a b c d e f g h k -> JSON.putIndexed conn a b c d e f g h >>= k
  GetByIndexValue a b k            -> Value.getByIndex conn a b            >>= k

-- Interpret a 'Riak' expression in 'IO', and attempt to roll back the cluster
-- to the state it was in prior to execution.
rollback :: Connection -> Riak a -> IO a
rollback conn = iterT phi
  where
    phi :: RiakF (IO a) -> IO a
    phi = \case
      act@(Put a b c _ _ _ _ _) ->
        executeAlg conn act
          `finally` Basic.delete conn a b c All

      act@(Put_ a b c _ _ _ _ _)->
        executeAlg conn act
          `finally` Basic.delete conn a b c All

      act@(PutIndexedJSON a b c _ _ _ _ _ _) ->
        executeAlg conn act
          `finally` Basic.delete conn a b c All

      act -> executeAlg conn act
