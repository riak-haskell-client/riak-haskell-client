{-# LANGUAGE ConstraintKinds  #-}
{-# LANGUAGE DeriveFunctor    #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase       #-}
{-# LANGUAGE TypeOperators    #-}

module Network.Riak.DSL.Basic
  ( -- * Riak Basic DSL
    RiakF(..)
  , ping
  , getClientID
  , setClientID
  , getServerInfo
  , get
  , put
  , put_
  , delete
    -- * Riak Basic interpreters
  , executeAlg
  , rollbackAlg
  ) where

import Data.Alacarte

import Control.Exception                (finally)
import Control.Monad.Trans.Free
import Data.Sequence                    (Seq)
import Network.Riak.Content             (Content)
import Network.Riak.Types
import Network.Riak.Protocol.ServerInfo (ServerInfo)

import qualified Network.Riak.Basic as Basic

--------------------------------------------------------------------------------
-- Riak Basic DSL

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

type C f m = (RiakF :<: f, Monad m)

ping :: C f m => FreeT f m ()
ping = liftF (inj (Ping ()))

getClientID :: C f m => FreeT f m ClientID
getClientID = liftF (inj (GetClientID id))

setClientID :: C f m => ClientID -> FreeT f m ()
setClientID a = liftF (inj (SetClientID a ()))

getServerInfo :: C f m => FreeT f m ServerInfo
getServerInfo = liftF (inj (GetServerInfo id))

get :: C f m
    => Maybe BucketType -> Bucket -> Key -> R
    -> FreeT f m (Maybe (Seq Content, VClock))
get a b c d = liftF (inj (Get a b c d id))

put :: C f m
    => Maybe BucketType -> Bucket -> Key -> Maybe VClock -> Content -> W -> DW
    -> FreeT f m (Seq Content, VClock)
put a b c d e f g = liftF (inj (Put a b c d e f g id))

put_ :: C f m
     => Maybe BucketType -> Bucket -> Key -> Maybe VClock -> Content -> W -> DW
     -> FreeT f m ()
put_ a b c d e f g = liftF (inj (Put_ a b c d e f g ()))

delete :: C f m => Maybe BucketType -> Bucket -> Key -> RW -> FreeT f m ()
delete a b c d = liftF (inj (Delete a b c d ()))


--------------------------------------------------------------------------------
-- Interpreters

executeAlg :: Connection -> RiakF (IO a) -> IO a
executeAlg conn = \case
  Ping k               -> Basic.ping conn               >>  k
  GetClientID k        -> Basic.getClientID conn        >>= k
  SetClientID a k      -> Basic.setClientID conn a      >>  k
  GetServerInfo k      -> Basic.getServerInfo conn      >>= k
  Get a b c d k        -> Basic.get conn a b c d        >>= k
  Put a b c d e f g k  -> Basic.put conn a b c d e f g  >>= k
  Put_ a b c d e f g k -> Basic.put_ conn a b c d e f g >>  k
  Delete a b c d k     -> Basic.delete conn a b c d     >>  k

rollbackAlg :: Connection -> RiakF (IO a) -> IO a
rollbackAlg conn = \case
  act@(Put a b c _ _ _ _ _) ->
    executeAlg conn act
      `finally` Basic.delete conn a b c All

  act@(Put_ a b c _ _ _ _ _)->
    executeAlg conn act
      `finally` Basic.delete conn a b c All

  act -> executeAlg conn act
