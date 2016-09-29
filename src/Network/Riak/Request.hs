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
    , getBucketType
    -- * Map/reduce
    , MapReduceRequest
    , mapReduce
    -- * Search
    , search
    , getIndex
    , putIndex
    ) where

#if __GLASGOW_HASKELL__ < 710
import Control.Applicative ((<$>))
#endif
import qualified Data.ByteString.Char8 as B8
import Data.Monoid
import Network.Riak.Protocol.BucketProps (BucketProps)
import Network.Riak.Protocol.Content
import Network.Riak.Protocol.GetClientIDRequest
import Network.Riak.Protocol.GetServerInfoRequest
import Network.Riak.Protocol.ListBucketsRequest
import Network.Riak.Protocol.MapReduceRequest
import Network.Riak.Protocol.PingRequest
import Network.Riak.Types.Internal hiding (MessageTag(..),bucket,key)
import Network.Riak.Escape (escape)
import qualified Network.Riak.Protocol.DeleteRequest as Del
import qualified Network.Riak.Protocol.Link as Link
import qualified Network.Riak.Protocol.GetBucketRequest as GetBucket
import qualified Network.Riak.Protocol.GetRequest as Get
import qualified Network.Riak.Protocol.IndexRequest as Index
import qualified Network.Riak.Protocol.IndexRequest.IndexQueryType as IndexQueryType
import qualified Network.Riak.Protocol.ListKeysRequest as Keys
import qualified Network.Riak.Protocol.PutRequest as Put
import qualified Network.Riak.Protocol.SetBucketRequest as SetBucket
import qualified Network.Riak.Protocol.GetBucketTypeRequest as GetBucketType
import qualified Network.Riak.Protocol.SearchQueryRequest as SearchQueryRequest
import qualified Network.Riak.Protocol.YzIndexGetRequest as YzIndex
import qualified Network.Riak.Protocol.YzIndexPutRequest as YzIndex

-- | Create a ping request.
ping :: PingRequest
ping = PingRequest
{-# INLINE ping #-}
{-
-- | Create a dtUpdate request.
dtUpdate :: DtUpdate.DtUpdateRequest
dtUpdate = DtUpdate.DtUpdateRequest
{-# INLINE dtUpdate #-}
-}

-- | Create a client-ID request.
getClientID :: GetClientIDRequest
getClientID = GetClientIDRequest
{-# INLINE getClientID #-}

-- | Create a server-info request.
getServerInfo :: GetServerInfoRequest
getServerInfo = GetServerInfoRequest
{-# INLINE getServerInfo #-}

-- | Create a get request.  The bucket and key names are URL-escaped.
get :: Maybe BucketType -> Bucket -> Key -> R -> Get.GetRequest
get btype bucket key r = Get.GetRequest {
                                    Get.bucket = escape bucket
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
                                  , Get.type' = btype -- no escaping intentional
                                                      -- TODO don't escape anything
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
                         , Index.timeout = Nothing
                         , Index.type' = Nothing
                         , Index.term_regex = Nothing
                         , Index.pagination_sort = Nothing
                         }

-- | Create a put request.  The bucket and key names are URL-escaped.
-- Any 'Link' values inside the 'Content' are assumed to have been
-- constructed with the 'link' function, and hence /not/ escaped.
put :: Maybe BucketType -> Bucket -> Key -> Maybe VClock -> Content -> W -> DW -> Bool
    -> Put.PutRequest
put btype bucket key mvclock cont mw mdw returnBody =
    Put.PutRequest { Put.bucket = escape bucket,
                     Put.key = Just $ escape key,
                     Put.vclock = fromVClock <$> mvclock,
                     Put.content = cont,
                     Put.w = fromQuorum mw,
                     Put.dw = fromQuorum mdw,
                     Put.return_body = Just returnBody,
                     Put.pw = Nothing,
                     Put.if_not_modified = Nothing,
                     Put.if_none_match = Nothing,
                     Put.return_head = Nothing,
                     Put.timeout = Nothing,
                     Put.asis = Nothing,
                     Put.sloppy_quorum = Nothing,
                     Put.n_val = Nothing,
                     Put.type' = btype -- same as get
                   }
{-# INLINE put #-}

-- | Create a link.  The bucket and key names are URL-escaped.
link :: Bucket -> Key -> Tag -> Link.Link
link bucket key = Link.Link (Just (escape bucket)) (Just (escape key)) . Just
{-# INLINE link #-}

-- | Create a delete request.  The bucket and key names are URL-escaped.
delete :: Maybe BucketType -> Bucket -> Key -> RW -> Del.DeleteRequest
delete btype bucket key rw = Del.DeleteRequest {
                               Del.bucket = escape bucket,
                               Del.key = escape key,
                               Del.rw = fromQuorum rw,
                               Del.vclock = Nothing,
                               Del.r = Nothing,
                               Del.w = Nothing,
                               Del.pr = Nothing,
                               Del.pw = Nothing,
                               Del.dw = Nothing,
                               Del.timeout = Nothing,
                               Del.sloppy_quorum = Nothing,
                               Del.n_val = Nothing,
                               Del.type' = btype -- same as get
                             }
{-# INLINE delete #-}

-- | Create a list-buckets request.
listBuckets :: Maybe BucketType -> ListBucketsRequest
listBuckets = ListBucketsRequest Nothing Nothing
{-# INLINE listBuckets #-}

-- | Create a list-keys request.  The bucket type and name are URL-escaped.
listKeys :: Maybe BucketType -> Bucket -> Keys.ListKeysRequest
listKeys t b = Keys.ListKeysRequest (escape b) Nothing (escape <$> t)
{-# INLINE listKeys #-}

-- | Create a get-bucket request.  The bucket type and name are URL-escaped.
getBucket :: Maybe BucketType -> Bucket -> GetBucket.GetBucketRequest
getBucket t b = GetBucket.GetBucketRequest (escape b) (escape <$> t)
{-# INLINE getBucket #-}

-- | Create a set-bucket request.  The bucket type and name are URL-escaped.
setBucket :: Maybe BucketType -> Bucket -> BucketProps -> SetBucket.SetBucketRequest
setBucket t b ps = SetBucket.SetBucketRequest (escape b) ps (escape <$> t)
{-# INLINE setBucket #-}

-- | Create a get-bucket-type request.  The bucket type is URL-escaped.
getBucketType :: BucketType -> GetBucketType.GetBucketTypeRequest
getBucketType t = GetBucketType.GetBucketTypeRequest (escape t)

-- | Create a map-reduce request.
mapReduce :: Job -> MapReduceRequest
mapReduce (JSON bs)   = MapReduceRequest bs "application/json"
mapReduce (Erlang bs) = MapReduceRequest bs "application/x-erlang-binary"

-- | Create a search request
search :: SearchQuery -> Index -> SearchQueryRequest.SearchQueryRequest
search q ix = SearchQueryRequest.SearchQueryRequest {
                SearchQueryRequest.q = q,
                SearchQueryRequest.index = escape ix,
                SearchQueryRequest.rows = Nothing,
                SearchQueryRequest.start = Nothing,
                SearchQueryRequest.sort = Nothing,
                SearchQueryRequest.filter = Nothing,
                SearchQueryRequest.df = Nothing,
                SearchQueryRequest.op = Nothing,
                SearchQueryRequest.fl = mempty,
                SearchQueryRequest.presort = Nothing
              }

getIndex :: Maybe Index -> YzIndex.YzIndexGetRequest
getIndex = YzIndex.YzIndexGetRequest

putIndex :: IndexInfo -> Maybe Timeout -> YzIndex.YzIndexPutRequest
putIndex = YzIndex.YzIndexPutRequest
