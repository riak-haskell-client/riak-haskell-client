{-# LANGUAGE OverloadedStrings, CPP #-}

-- |
-- Module:      Network.Riak.Request
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
-- Stability:   experimental
-- Portability: portable
--
-- Smart constructors for Riak types.  These functions correctly
-- URL-escape bucket, key, and link names.  You should thus use them
-- in preference to the raw data constructors.

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
    , getByIndex
    , Index.IndexRequest
    , Put.PutRequest
    , put
    , Del.DeleteRequest
    , delete
    -- * Metadata
    , Link.Link
    , link
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
    , FetchDt.DtFetchRequest
    , fetchCounter
    , incrementCounter
    , fetchSet
    , addToSet
    , removeFromSet
    , fetchMap
    , updateMap
    ) where

#if __GLASGOW_HASKELL__ < 710
import           Control.Applicative ((<$>))
#endif
import qualified Data.ByteString.Char8 as B8
import           Data.Monoid
import           Network.Riak.Protocol.BucketProps hiding (r,rw)
import           Network.Riak.Protocol.Content
import           Network.Riak.Protocol.GetClientIDRequest
import           Network.Riak.Protocol.GetServerInfoRequest
import           Network.Riak.Protocol.ListBucketsRequest
import           Network.Riak.Protocol.MapReduceRequest
import           Network.Riak.Protocol.PingRequest
import           Network.Riak.Types.Internal hiding (MessageTag(..))
import           Network.Riak.Escape (escape)
import qualified Network.Riak.Protocol.DeleteRequest as Del
import qualified Network.Riak.Protocol.Link as Link
import qualified Network.Riak.Protocol.GetBucketRequest as GetBucket
import qualified Network.Riak.Protocol.GetRequest as Get
import qualified Network.Riak.Protocol.IndexRequest as Index
import qualified Network.Riak.Protocol.IndexRequest.IndexQueryType as IndexQueryType
import qualified Network.Riak.Protocol.ListKeysRequest as Keys
import qualified Network.Riak.Protocol.PutRequest as Put
import qualified Network.Riak.Protocol.SetBucketRequest as SetBucket

-- | Create a ping request.
ping :: PingRequest
ping = PingRequest
{-# INLINE ping #-}

-- | Create a client-ID request.
getClientID :: GetClientIDRequest
getClientID = GetClientIDRequest
{-# INLINE getClientID #-}

-- | Create a server-info request.
getServerInfo :: GetServerInfoRequest
getServerInfo = GetServerInfoRequest
{-# INLINE getServerInfo #-}

-- | Create a get request.  The bucket and key names are URL-escaped.
get :: Bucket -> Key -> R -> Get.GetRequest
get bucket key r = Get.GetRequest { Get.bucket = escape bucket
                                  , Get.key = escape key
                                  , Get.r = fromQuorum r
                                  , Get.pr = Nothing
                                  , Get.basic_quorum = Nothing
                                  , Get.notfound_ok = Nothing
                                  , Get.if_modified = Nothing
                                  , Get.head        = Nothing
                                  , Get.deletedvclock = Nothing
                                  , Get.timeout = Nothing
                                  , Get.sloppy_quorum = Nothing
                                  , Get.n_val = Nothing
                                  }
{-# INLINE get #-}

-- | Create a secondary index request. Bucket, key and index names and
-- values are URL-escaped.
getByIndex :: Bucket -> IndexQuery
           -> Index.IndexRequest
getByIndex bucket q =
    case q of
      IndexQueryExactInt index key ->
          req (index <> "_int") (showIntKey key)
              IndexQueryType.Eq Nothing Nothing
      IndexQueryExactBin index key ->
          req (index <> "_bin") (showBsKey $ key)
              IndexQueryType.Eq Nothing Nothing
      IndexQueryRangeInt index from to ->
          req (index <> "_int") Nothing
              IndexQueryType.Range (showIntKey from) (showIntKey to)
      IndexQueryRangeBin index from to ->
          req (index <> "_bin") Nothing
              IndexQueryType.Range (showBsKey from) (showBsKey to)
  where
    showIntKey = Just . escape . B8.pack . show
    showBsKey = Just . escape
    req i k qt rmin rmax =
      Index.IndexRequest { Index.bucket = escape bucket
                         , Index.index = escape i
                         , Index.qtype = qt
                         , Index.key = k
                         , Index.range_min = rmin
                         , Index.range_max = rmax
                         , Index.return_terms = Nothing
                         , Index.stream = Nothing
                         , Index.max_results = Nothing
                         , Index.continuation = Nothing
                         , Index.timeout = Nothing }

-- | Create a put request.  The bucket and key names are URL-escaped.
-- Any 'Link' values inside the 'Content' are assumed to have been
-- constructed with the 'link' function, and hence /not/ escaped.
put :: Bucket -> Key -> Maybe VClock -> Content -> W -> DW -> Bool
    -> Put.PutRequest
put bucket key mvclock cont mw mdw returnBody =
    Put.PutRequest (escape bucket) (Just $ escape key) (fromVClock <$> mvclock)
                   cont (fromQuorum mw) (fromQuorum mdw) (Just returnBody)
                   Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing
{-# INLINE put #-}

-- | Create a link.  The bucket and key names are URL-escaped.
link :: Bucket -> Key -> Tag -> Link.Link
link bucket key = Link.Link (Just (escape bucket)) (Just (escape key)) . Just
{-# INLINE link #-}

-- | Create a delete request.  The bucket and key names are URL-escaped.
delete :: Bucket -> Key -> RW -> Del.DeleteRequest
delete bucket key rw = Del.DeleteRequest (escape bucket) (escape key)
                                         (fromQuorum rw) Nothing Nothing Nothing
                                         Nothing Nothing Nothing Nothing Nothing Nothing
{-# INLINE delete #-}

-- | Create a list-buckets request.
listBuckets :: ListBucketsRequest
listBuckets = ListBucketsRequest Nothing Nothing
{-# INLINE listBuckets #-}

-- | Create a list-keys request.  The bucket name is URL-escaped.
listKeys :: Bucket -> Keys.ListKeysRequest
listKeys b = Keys.ListKeysRequest (escape b) Nothing
{-# INLINE listKeys #-}

-- | Create a get-bucket request.  The bucket name is URL-escaped.
getBucket :: Bucket -> GetBucket.GetBucketRequest
getBucket = GetBucket.GetBucketRequest . escape
{-# INLINE getBucket #-}

-- | Create a set-bucket request.  The bucket name is URL-escaped.
setBucket :: Bucket -> BucketProps -> SetBucket.SetBucketRequest
setBucket = SetBucket.SetBucketRequest . escape
{-# INLINE setBucket #-}

-- | Create a map-reduce request.
mapReduce :: Job -> MapReduceRequest
mapReduce (JSON bs)   = MapReduceRequest bs "application/json"
mapReduce (Erlang bs) = MapReduceRequest bs "application/x-erlang-binary"

fetchCounter :: Bucket -> Key -> BucketType -> R -> FetchDt.DtFetchRequest
fetchCounter buck k typ r = FetchDt.DtFetchRequest (escape buck) (escape k) (escape typ) (fromQuorum r) Nothing Nothing Nothing Nothing Nothing Nothing Nothing

updateRequest :: O.DtOp -> Bucket -> Key -> BucketType -> W -> DW -> U.DtUpdateRequest
updateRequest u b k typ w dw = U.DtUpdateRequest { U.bucket = escape b
                                                   , U.key = Just k
                                                   , U.type' = escape typ
                                                   , U.context = Nothing
                                                   , U.op = u
                                                   , U.w = fromQuorum w
                                                   , U.dw = fromQuorum dw
                                                   , U.pw = Nothing
                                                   , U.return_body = Just True
                                                   , U.timeout = Nothing
                                                   , U.sloppy_quorum = Nothing
                                                   , U.n_val = Nothing
                                                   , U.include_context = Nothing
                                                   }


incrementCounter :: Bucket -> Key -> BucketType -> Int64 -> W -> DW -> U.DtUpdateRequest
incrementCounter b k t val w dw = updateRequest (defaultValue { O.counter_op = Just (CO.CounterOp (Just val))}) b k t w dw

fetchSet :: Bucket -> Key -> BucketType -> R -> FetchDt.DtFetchRequest
fetchSet buck k typ r = FetchDt.DtFetchRequest (escape buck) k (escape typ) (fromQuorum r) Nothing Nothing Nothing Nothing Nothing Nothing Nothing

addToSet :: Bucket -> Key -> BucketType -> Seq Content -> W -> DW -> U.DtUpdateRequest
addToSet b k t set w dw = updateRequest (defaultValue { O.set_op = Just (SO.SetOp (fmap value set) mempty) }) b k t w dw

removeFromSet :: Bucket -> Key -> BucketType -> Seq Content -> W -> DW -> U.DtUpdateRequest
removeFromSet b k t set w dw = updateRequest (defaultValue { O.set_op = Just (SO.SetOp mempty (fmap value set)) }) b k t w dw

fetchMap :: Bucket -> Key -> BucketType -> R -> FetchDt.DtFetchRequest
fetchMap buck k typ r = FetchDt.DtFetchRequest (escape buck) k (escape typ) (fromQuorum r) Nothing Nothing Nothing Nothing Nothing Nothing Nothing

updateMap :: Bucket -> Key -> BucketType -> MapOp -> W -> DW -> U.DtUpdateRequest
updateMap buck k typ op w dw = updateRequest (defaultValue { O.map_op = Just op }) buck k typ w dw
