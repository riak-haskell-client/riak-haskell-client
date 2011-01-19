module Network.Riak.Types
    (
      ClientID
    , Client(..)
    , Connection(..)
    , Bucket
    , Key
    ) where

import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as L
import Data.IORef (IORef)
import Network.Socket
    
type ClientID = L.ByteString

data Client = Client {
      riakHost :: HostName
    , riakPort :: ServiceName
    , riakPrefix :: B.ByteString
    , riakMapReducePrefix :: B.ByteString
    , riakClientID :: ClientID
    } deriving (Eq, Show)

data Connection = Connection {
      connSock :: Socket
    , connClient :: Client
    , connBuffer :: IORef L.ByteString
    } deriving (Eq)

instance Show Connection where
    show conn = show "Connection " ++ riakHost c ++ ":" ++ riakPort c
        where c = connClient conn

type Bucket = L.ByteString

type Key = L.ByteString
