{-# LANGUAGE OverloadedStrings #-}

module Network.Riak.Request
    (
    -- * Connection management
      PingRequest
    , ping
    , GetClientIDRequest
    , getClientID
    , GetServerInfoRequest
    , getServerInfo
    -- * Data management
    , Get.GetRequest
    , get
    , Put.PutRequest
    , put
    , Del.DeleteRequest
    , delete
    -- * Metadata
    , ListBucketsRequest
    , listBuckets
    , Keys.ListKeysRequest
    , listKeys
    , GetBucket.GetBucketRequest
    , getBucket
    , SetBucket.SetBucketRequest
    , setBucket
    -- * Map/reduce
    , MapReduceRequest
    , mapReduce
    ) where

import Control.Applicative ((<$>))
import Network.Riak.Protocol.PingRequest
import qualified Network.Riak.Protocol.DeleteRequest as Del
import Network.Riak.Protocol.GetClientIDRequest
import Network.Riak.Protocol.GetServerInfoRequest
import Network.Riak.Protocol.ListBucketsRequest
import qualified Network.Riak.Protocol.ListKeysRequest as Keys
import qualified Network.Riak.Protocol.PutRequest as Put
import Network.Riak.Protocol.Content
import qualified Network.Riak.Protocol.GetRequest as Get
import qualified Network.Riak.Protocol.GetBucketRequest as GetBucket
import qualified Network.Riak.Protocol.SetBucketRequest as SetBucket
import Network.Riak.Protocol.MapReduceRequest
import Network.Riak.Protocol.BucketProps
import Network.Riak.Types.Internal hiding (MessageTag(..))

ping :: PingRequest
ping = PingRequest
{-# INLINE ping #-}

getClientID :: GetClientIDRequest
getClientID = GetClientIDRequest
{-# INLINE getClientID #-}

getServerInfo :: GetServerInfoRequest
getServerInfo = GetServerInfoRequest
{-# INLINE getServerInfo #-}

get :: Bucket -> Key -> R -> Get.GetRequest
get bucket key r = Get.GetRequest { Get.bucket = bucket
                                  , Get.key = key
                                  , Get.r = fromQuorum r }
{-# INLINE get #-}

put :: Bucket -> Key -> Maybe VClock -> Content -> W -> DW -> Bool
    -> Put.PutRequest
put bucket key mvclock cont mw mdw returnBody =
    Put.PutRequest bucket key (fromVClock <$> mvclock) cont
                   (fromQuorum mw) (fromQuorum mdw) (Just returnBody)
{-# INLINE put #-}

delete :: Bucket -> Key -> RW -> Del.DeleteRequest
delete bucket key rw = Del.DeleteRequest bucket key (fromQuorum rw)
{-# INLINE delete #-}

listBuckets :: ListBucketsRequest
listBuckets = ListBucketsRequest
{-# INLINE listBuckets #-}

listKeys :: Bucket -> Keys.ListKeysRequest
listKeys = Keys.ListKeysRequest
{-# INLINE listKeys #-}

getBucket :: Bucket -> GetBucket.GetBucketRequest
getBucket bucket = GetBucket.GetBucketRequest bucket
{-# INLINE getBucket #-}

setBucket :: Bucket -> BucketProps -> SetBucket.SetBucketRequest
setBucket bucket props = SetBucket.SetBucketRequest bucket props
{-# INLINE setBucket #-}

mapReduce :: Job -> MapReduceRequest
mapReduce (JSON bs)   = MapReduceRequest bs "application/json"
mapReduce (Erlang bs) = MapReduceRequest bs "application/x-erlang-binary"
