module Network.Riak.DSL.Basic
  ( -- * Riak Basic DSL
    ping
  , getClientID
  , setClientID
  , getServerInfo
  , get
  , put
  , put_
  , delete
  ) where

import Network.Riak.DSL (Riak, RiakF(..))

import Control.Monad.Trans.Free         (liftF)
import Data.Sequence                    (Seq)
import Network.Riak.Content             (Content)
import Network.Riak.Types
import Network.Riak.Protocol.ServerInfo (ServerInfo)


--------------------------------------------------------------------------------
-- Riak DSL

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

put :: Maybe BucketType -> Bucket -> Key -> Maybe VClock -> Content -> W -> DW
    -> Riak (Seq Content, VClock)
put a b c d e f g = liftF (Put a b c d e f g id)

put_ :: Maybe BucketType -> Bucket -> Key -> Maybe VClock -> Content -> W -> DW
     -> Riak ()
put_ a b c d e f g = liftF (Put_ a b c d e f g ())

delete :: Maybe BucketType -> Bucket -> Key -> RW -> Riak ()
delete a b c d = liftF (Delete a b c d ())
