{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE LambdaCase    #-}

module Network.Riak.Basic.DSL
  ( -- * Riak DSL
    Riak
  , RiakF(..)
  , ping
  , getClientID
  , setClientID
  , getServerInfo
  , get
  , put
  , put_
  , delete
    -- * Interpreters
  , execute
  , rollback
  ) where

import Control.Exception                (finally)
import Control.Monad.Trans.Free
import Data.Sequence                    (Seq)
import Network.Riak.Content             (Content)
import Network.Riak.Types
import Network.Riak.Protocol.ServerInfo (ServerInfo)

import qualified Network.Riak.Basic as Riak


--------------------------------------------------------------------------------
-- Riak DSL

data RiakF a
  = Ping a
  | GetClientID (ClientID -> a)
  | SetClientID ClientID a
  | GetServerInfo (ServerInfo -> a)
  | Get (Maybe BucketType) Bucket Key R (Maybe (Seq Content, VClock) -> a)
  | Put (Maybe BucketType) Bucket Key (Maybe VClock) Content W DW ((Seq Content, VClock) -> a)
  | Put_ (Maybe BucketType) Bucket Key (Maybe VClock) Content W DW a
  | Delete (Maybe BucketType) Bucket Key RW a
  deriving Functor

type Riak a = FreeT RiakF IO a

ping :: Riak ()
ping = liftF (Ping ())

getClientID :: Riak ClientID
getClientID = liftF (GetClientID id)

setClientID :: ClientID -> Riak ()
setClientID a = liftF (SetClientID a ())

getServerInfo :: Riak ServerInfo
getServerInfo = liftF (GetServerInfo id)

get :: Maybe BucketType -> Bucket -> Key -> R -> Riak (Maybe (Seq Content, VClock))
get a b c d = liftF (Get a b c d id)

put :: Maybe BucketType -> Bucket -> Key -> Maybe VClock -> Content -> W -> DW -> Riak (Seq Content, VClock)
put a b c d e f g = liftF (Put a b c d e f g id)

put_ :: Maybe BucketType -> Bucket -> Key -> Maybe VClock -> Content -> W -> DW -> Riak ()
put_ a b c d e f g = liftF (Put_ a b c d e f g ())

delete :: Maybe BucketType -> Bucket -> Key -> RW -> Riak ()
delete a b c d = liftF (Delete a b c d ())


--------------------------------------------------------------------------------
-- Interpreters

-- | Interpret a 'Riak' expression in 'IO'.
execute :: Connection -> Riak a -> IO a
execute conn = iterT (executeAlg conn)

executeAlg :: Connection -> RiakF (IO a) -> IO a
executeAlg conn = \case
  Ping k               -> Riak.ping conn               >>  k
  GetClientID k        -> Riak.getClientID conn        >>= k
  SetClientID a k      -> Riak.setClientID conn a      >>  k
  GetServerInfo k      -> Riak.getServerInfo conn      >>= k
  Get a b c d k        -> Riak.get conn a b c d        >>= k
  Put a b c d e f g k  -> Riak.put conn a b c d e f g  >>= k
  Put_ a b c d e f g k -> Riak.put_ conn a b c d e f g >>  k
  Delete a b c d k     -> Riak.delete conn a b c d     >>  k

-- Interpret a 'Riak' expression in 'IO', and attempt to roll back the cluster
-- to the state it was in prior to execution.
rollback :: Connection -> Riak a -> IO a
rollback conn = iterT phi
  where
    phi :: RiakF (IO a) -> IO a
    phi = \case
      act@(Put a b c _ _ _ _ _) ->
        executeAlg conn act
          `finally` Riak.delete conn a b c All

      act@(Put_ a b c _ _ _ _ _)->
        executeAlg conn act
          `finally` Riak.delete conn a b c All

      act -> executeAlg conn act
