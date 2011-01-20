module Network.Riak.Tag
    (
      Tagged(..)
    , MessageTag
    , putTag
    , getTag
    ) where

import Data.Binary.Put (Put, putWord8)
import Network.Riak.Protocol.DeleteRequest
import Network.Riak.Protocol.GetBucketRequest
import Network.Riak.Protocol.GetBucketResponse
import Network.Riak.Protocol.GetClientIDRequest
import Network.Riak.Protocol.GetClientIDResponse
import Network.Riak.Protocol.GetRequest
import Network.Riak.Protocol.GetResponse
import Network.Riak.Protocol.GetServerInfoRequest
import Network.Riak.Protocol.ListBucketsRequest
import Network.Riak.Protocol.ListBucketsResponse
import Network.Riak.Protocol.ListKeysRequest
import Network.Riak.Protocol.ListKeysResponse
import Network.Riak.Protocol.MapReduce
import Network.Riak.Protocol.MapReduceRequest
import Network.Riak.Protocol.PingRequest
import Network.Riak.Protocol.PingResponse
import Network.Riak.Protocol.PutRequest
import Network.Riak.Protocol.PutResponse
import Network.Riak.Protocol.ServerInfo
import Network.Riak.Protocol.SetBucketRequest
import Network.Riak.Protocol.SetClientIDRequest
import Network.Riak.Protocol.SetClientIDResponse
import Network.Riak.Types.Internal as Types
import Text.ProtocolBuffers.Get (Get, getWord8)

instance Tagged PingRequest where
    messageTag _ = Types.PingRequest
    {-# INLINE messageTag #-}

instance Request PingRequest

instance Tagged PingResponse where
    messageTag _ = Types.PingResponse
    {-# INLINE messageTag #-}

instance Response PingResponse

instance Tagged GetClientIDRequest where
    messageTag _ = Types.GetClientIDRequest
    {-# INLINE messageTag #-}

instance Request GetClientIDRequest

instance Tagged GetClientIDResponse where
    messageTag _ = Types.GetClientIDResponse
    {-# INLINE messageTag #-}

instance Response GetClientIDResponse

instance Tagged SetClientIDRequest where
    messageTag _ = Types.SetClientIDRequest
    {-# INLINE messageTag #-}

instance Request SetClientIDRequest

instance Tagged SetClientIDResponse where
    messageTag _ = Types.SetClientIDResponse
    {-# INLINE messageTag #-}

instance Request SetClientIDResponse

instance Tagged GetServerInfoRequest where
    messageTag _ = Types.GetServerInfoRequest
    {-# INLINE messageTag #-}

instance Request GetServerInfoRequest

instance Tagged ServerInfo where
    messageTag _ = Types.GetServerInfoResponse
    {-# INLINE messageTag #-}

instance Response ServerInfo

instance Tagged GetRequest where
    messageTag _ = Types.GetRequest
    {-# INLINE messageTag #-}

instance Request GetRequest

instance Tagged GetResponse where
    messageTag _ = Types.GetResponse
    {-# INLINE messageTag #-}

instance Response GetResponse

instance Tagged PutRequest where
    messageTag _ = Types.PutRequest
    {-# INLINE messageTag #-}

instance Request PutRequest

instance Tagged PutResponse where
    messageTag _ = Types.PutResponse
    {-# INLINE messageTag #-}

instance Response PutResponse

instance Tagged DeleteRequest where
    messageTag _ = Types.DeleteRequest
    {-# INLINE messageTag #-}

instance Request DeleteRequest

instance Tagged ListBucketsRequest where
    messageTag _ = Types.ListBucketsRequest
    {-# INLINE messageTag #-}

instance Request ListBucketsRequest

instance Tagged ListBucketsResponse where
    messageTag _ = Types.ListBucketsResponse
    {-# INLINE messageTag #-}

instance Response ListBucketsResponse

instance Tagged ListKeysRequest where
    messageTag _ = Types.ListKeysRequest
    {-# INLINE messageTag #-}

instance Request ListKeysRequest

instance Tagged ListKeysResponse where
    messageTag _ = Types.ListKeysResponse
    {-# INLINE messageTag #-}

instance Response ListKeysResponse

instance Tagged GetBucketRequest where
    messageTag _ = Types.GetBucketRequest
    {-# INLINE messageTag #-}

instance Request GetBucketRequest

instance Tagged GetBucketResponse where
    messageTag _ = Types.GetBucketResponse
    {-# INLINE messageTag #-}

instance Response GetBucketResponse

instance Tagged SetBucketRequest where
    messageTag _ = Types.SetBucketRequest
    {-# INLINE messageTag #-}

instance Request SetBucketRequest

instance Tagged MapReduceRequest where
    messageTag _ = Types.MapReduceRequest
    {-# INLINE messageTag #-}

instance Request MapReduceRequest

instance Tagged MapReduce where
    messageTag _ = Types.MapReduceResponse
    {-# INLINE messageTag #-}

instance Response MapReduce

putTag :: MessageTag -> Put
putTag = putWord8 . fromIntegral . fromEnum
{-# INLINE putTag #-}

getTag :: Get MessageTag
getTag = do
  n <- getWord8
  if n > 24
    then fail $ "invalid riak message code: " ++ show n
    else return .  toEnum . fromIntegral $ n
{-# INLINE getTag #-}
