{-# LANGUAGE OverloadedStrings, RecordWildCards #-}

module Network.Riak
    (
      ClientID
    , Client(..)
    , Connection(connClient)
    , Network.Riak.connect
    , defaultClient
    , makeClientID
    , ping
    , getClientID
    , setClientID
    , getServerInfo
    , get
    , Network.Riak.put
    , delete
    , listBuckets
    , listKeys
    , getBucket
    , setBucket
    , mapReduce
    ) where

import qualified Data.ByteString.Char8 as B
import Control.Applicative
import Data.Binary hiding (get)
import Data.Binary.Put
import Control.Monad
import Network.Socket.ByteString.Lazy as L
import Network.Socket as Socket
import Network.Riak.Protocol.Content
import Network.Riak.Protocol.PutRequest
import Network.Riak.Protocol.BucketProps
import Network.Riak.Protocol.PutResponse
import Network.Riak.Protocol.DeleteRequest
import Network.Riak.Protocol.ServerInfo
import Network.Riak.Protocol.ListBucketsResponse
import Network.Riak.Protocol.ListKeysRequest
import Network.Riak.Protocol.SetBucketRequest
import Network.Riak.Protocol.ListKeysResponse
import Network.Riak.Protocol.PingRequest
import Network.Riak.Protocol.GetClientIDRequest
import Network.Riak.Protocol.GetServerInfoRequest
import Network.Riak.Protocol.ListBucketsRequest
import qualified Data.ByteString.Lazy.Char8 as L
import Numeric (showHex)
import System.Random
import Network.Riak.Protocol.GetRequest as GetRequest
import Network.Riak.Protocol.GetResponse
import Network.Riak.Protocol.GetBucketRequest
import Network.Riak.Protocol.MapReduceRequest
import Network.Riak.Protocol.MapReduce
import Network.Riak.Protocol.GetBucketResponse as GetBucketResponse
import Network.Riak.Protocol.SetClientIDRequest
import Network.Riak.Protocol.GetClientIDResponse as GetClientIDResponse
import Network.Riak.Message
import Network.Riak.Types as T
import qualified Network.Riak.Types.Internal as T
import Network.Riak.Types.Internal (VClock(..), Quorum(..))
import Text.ProtocolBuffers
import Data.IORef

defaultClient :: Client
defaultClient = Client {
                  host = "127.0.0.1"
                , port = "8087"
                , prefix = "riak"
                , mapReducePrefix = "mapred"
                , clientID = L.empty
                }

makeClientID :: IO ClientID
makeClientID = do
  r <- randomIO :: IO Int
  return . L.append "hs_" . L.pack . showHex (abs r) $ ""

addClientID :: Client -> IO Client
addClientID client
  | L.null (clientID client) = do
    i <- makeClientID
    return client { clientID = i }
  | otherwise = return client

connect :: Client -> IO Connection
connect cli0 = do
  client@Client{..} <- addClientID cli0
  let hints = defaultHints
  (ai:_) <- getAddrInfo (Just hints) (Just host) (Just port)
  sock <- socket (addrFamily ai) (addrSocketType ai) (addrProtocol ai)
  Socket.connect sock (addrAddress ai)
  buf <- newIORef L.empty
  let conn = Connection sock client buf
  setClientID conn clientID
  return conn

ping :: Connection -> IO ()
ping conn@Connection{..} = do
  sendRequest conn PingRequest
  recvResponse_ conn T.PingResponse

getClientID :: Connection -> ClientID -> IO ClientID
getClientID conn id = do
  sendRequest conn GetClientIDRequest
  GetClientIDResponse.client_id <$> recvResponse conn

setClientID :: Connection -> ClientID -> IO ()
setClientID conn id = do
  sendRequest conn $ SetClientIDRequest id
  recvResponse_ conn T.SetClientIDResponse

getServerInfo :: Connection -> IO ServerInfo
getServerInfo conn = do
  sendRequest conn GetServerInfoRequest
  recvResponse conn

get :: Connection -> T.Bucket -> T.Key -> Maybe R
    -> IO (Maybe (Seq Content, Maybe VClock))
get conn@Connection{..} bucket key r = do
  sendRequest conn GetRequest { bucket = bucket
                              , key = key
                              , r = fromQuorum <$> r }
  maybe Nothing cast <$> recvMaybeResponse conn
 where cast GetResponse{..} = Just (content, VClock <$> vclock)

put :: Connection -> T.Bucket -> T.Key -> Maybe T.VClock
    -> Content -> Maybe W -> Maybe DW -> Bool
    -> IO (Seq Content, Maybe VClock)
put conn@Connection{..} bucket key vclock content w dw returnBody = do
  sendRequest conn $ PutRequest bucket key (fromVClock <$> vclock) content
                     (fromQuorum <$> w) (fromQuorum <$> dw) (Just returnBody)
  PutResponse{..} <- recvResponse conn
  return (content, VClock <$> vclock)

delete :: Connection -> T.Bucket -> T.Key -> Maybe RW -> IO ()
delete conn bucket key rw = do
  sendRequest conn $ DeleteRequest bucket key (fromQuorum <$> rw)
  recvResponse_ conn T.DeleteResponse

listBuckets :: Connection -> IO (Seq T.Bucket)
listBuckets conn = do
  sendRequest conn $ ListBucketsRequest
  buckets <$> recvResponse conn

listKeys :: Connection -> T.Bucket -> IO (Seq T.Key, Maybe Bool)
listKeys conn bucket = do
  sendRequest conn $ ListKeysRequest bucket
  ListKeysResponse{..} <- recvResponse conn
  return (keys, done)

getBucket :: Connection -> T.Bucket -> IO BucketProps
getBucket conn bucket = do
  sendRequest conn $ GetBucketRequest bucket
  GetBucketResponse.props <$> recvResponse conn

setBucket :: Connection -> T.Bucket -> BucketProps -> IO ()
setBucket conn bucket props = do
  sendRequest conn $ SetBucketRequest bucket props
  recvResponse_ conn T.SetBucketResponse

mapReduce :: Connection -> Job -> IO MapReduce
mapReduce conn job = do
  sendRequest conn $ case job of
                       JSON bs -> MapReduceRequest bs "application/json"
                       Erlang bs -> MapReduceRequest bs "application/x-erlang-binary"
  recvResponse conn
