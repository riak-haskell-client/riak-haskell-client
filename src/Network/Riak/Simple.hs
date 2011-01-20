{-# LANGUAGE OverloadedStrings, RecordWildCards #-}

module Network.Riak.Simple
    (
    -- * Connection management
      ping
    , getClientID
    , setClientID
    , getServerInfo
    -- * Data management
    , get
    , put
    , delete
    -- * Metadata
    , listBuckets
    , listKeys
    , getBucket
    , setBucket
    -- * Map/reduce
    , mapReduce
    ) where

import Control.Applicative ((<$>))
import Data.Sequence (Seq)
import Network.Riak.Connection.Internal
import Network.Riak.Protocol.BucketProps
import Network.Riak.Protocol.Content
import Network.Riak.Protocol.DeleteRequest
import Network.Riak.Protocol.GetBucketRequest
import Network.Riak.Protocol.GetBucketResponse as GetBucketResponse
import Network.Riak.Protocol.GetClientIDRequest
import Network.Riak.Protocol.GetClientIDResponse as GetClientIDResponse
import Network.Riak.Protocol.GetRequest as GetRequest
import Network.Riak.Protocol.GetResponse
import Network.Riak.Protocol.GetServerInfoRequest
import Network.Riak.Protocol.ListBucketsRequest
import Network.Riak.Protocol.ListBucketsResponse
import Network.Riak.Protocol.ListKeysRequest
import Network.Riak.Protocol.ListKeysResponse
import Network.Riak.Protocol.MapReduce
import Network.Riak.Protocol.MapReduceRequest
import Network.Riak.Protocol.PingRequest
import Network.Riak.Protocol.PutRequest
import Network.Riak.Protocol.PutResponse
import Network.Riak.Protocol.ServerInfo
import Network.Riak.Protocol.SetBucketRequest
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Network.Riak.Types.Internal as T

ping :: Connection -> IO ()
ping conn@Connection{..} = do
  sendRequest conn PingRequest
  recvResponse_ conn T.PingResponse

getClientID :: Connection -> IO ClientID
getClientID conn = do
  sendRequest conn GetClientIDRequest
  GetClientIDResponse.client_id <$> recvResponse conn

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
put conn@Connection{..} bucket key mvclock cont mw mdw returnBody = do
  sendRequest conn $ PutRequest bucket key (fromVClock <$> mvclock) cont
                     (fromQuorum <$> mw) (fromQuorum <$> mdw) (Just returnBody)
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
