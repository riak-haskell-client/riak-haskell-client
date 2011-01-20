module Network.Riak.Types
    (
      ClientID
    , Client(..)
    , Job(..)
    , Connection(..)
    , Bucket
    , Key
    , Q(..)
    , RW(..)
    , R(..)
    , W(..)
    , DW(..)
    , VClock
    ) where

import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as L
import Data.IORef (IORef)
import Network.Socket
import Network.Riak.Protocol.Content
import Network.Riak.Protocol.ServerInfo
import Network.Riak.Protocol.BucketProps
import Network.Riak.Protocol.MapReduce
import Network.Riak.Types.Internal
    
type ClientID = L.ByteString

data Client = Client {
      host :: HostName
    , port :: ServiceName
    , prefix :: B.ByteString
    , mapReducePrefix :: B.ByteString
    , clientID :: ClientID
    } deriving (Eq, Show)

data Connection = Connection {
      connSock :: Socket
    , connClient :: Client
    , connBuffer :: IORef L.ByteString
    } deriving (Eq)

instance Show Connection where
    show conn = show "Connection " ++ host c ++ ":" ++ port c
        where c = connClient conn

type Bucket = L.ByteString

type Key = L.ByteString

data Job = JSON L.ByteString
         | Erlang L.ByteString
           deriving (Eq, Show)
