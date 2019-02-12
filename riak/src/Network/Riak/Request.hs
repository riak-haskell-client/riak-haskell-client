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
      Proto.RpbPingReq
    , ping
    , Proto.RpbGetClientIdReq
    , getClientID
    , Proto.RpbGetServerInfoReq
    , getServerInfo
    -- * Data management
    , Proto.RpbGetReq
    , get
    , getByIndex
    , Proto.RpbIndexReq
    , Proto.RpbPutReq
    , put
    , Proto.RpbDelReq
    , delete
    -- * Metadata
    , Proto.RpbLink
    , link
    , Proto.RpbListBucketsReq
    , listBuckets
    , Proto.RpbListKeysReq
    , listKeys
    , Proto.RpbGetBucketReq
    , getBucket
    , Proto.RpbSetBucketReq
    , setBucket
    , getBucketType
    -- * Map/reduce
    , Proto.RpbMapRedReq
    , mapReduce
    -- * Search
    , search
    , getIndex
    , putIndex
    , deleteIndex
    ) where

#if __GLASGOW_HASKELL__ < 710
import Control.Applicative ((<$>))
#endif
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as B8
#if __GLASGOW_HASKELL__ < 804
import Data.Monoid
#endif
import qualified Data.Riak.Proto as Proto
import Network.Riak.Escape (escape)
import Network.Riak.Lens
import Network.Riak.Types.Internal hiding (MessageTag(..))

-- | Create a ping request.
ping :: Proto.RpbPingReq
ping = Proto.defMessage
{-# INLINE ping #-}
{-
-- | Create a dtUpdate request.
dtUpdate :: DtUpdate.DtUpdateRequest
dtUpdate = DtUpdate.DtUpdateRequest
{-# INLINE dtUpdate #-}
-}

-- | Create a client-ID request.
getClientID :: Proto.RpbGetClientIdReq
getClientID = Proto.defMessage
{-# INLINE getClientID #-}

-- | Create a server-info request.
getServerInfo :: Proto.RpbGetServerInfoReq
getServerInfo = Proto.defMessage
{-# INLINE getServerInfo #-}

-- | Create a get request.  The bucket and key names are URL-escaped.
get :: Maybe BucketType -> Bucket -> Key -> R -> Proto.RpbGetReq
get btype bucket key r = Proto.defMessage
                           & Proto.bucket .~ escape bucket
                           & Proto.key .~ escape key
                           & Proto.maybe'r .~ fromQuorum r
                           & Proto.maybe'type' .~ btype -- no escaping intentional
                                                  -- TODO don't escape anything
{-# INLINE get #-}

-- | Create a secondary index request. Bucket, key and index names and
-- values are URL-escaped.
getByIndex :: Bucket -> IndexQuery
           -> Proto.RpbIndexReq
getByIndex bucket q =
    case q of
      IndexQueryExactInt index key ->
          req (index <> "_int") (showIntKey key)
              Proto.RpbIndexReq'eq Nothing Nothing
      IndexQueryExactBin index key ->
          req (index <> "_bin") (showBsKey $ key)
              Proto.RpbIndexReq'eq Nothing Nothing
      IndexQueryRangeInt index from to ->
          req (index <> "_int") Nothing
              Proto.RpbIndexReq'range (showIntKey from) (showIntKey to)
      IndexQueryRangeBin index from to ->
          req (index <> "_bin") Nothing
              Proto.RpbIndexReq'range (showBsKey from) (showBsKey to)
  where
    showIntKey = Just . escape . B8.pack . show
    showBsKey = Just . escape
    req :: ByteString -> Maybe ByteString -> Proto.RpbIndexReq'IndexQueryType
        -> Maybe ByteString -> Maybe ByteString -> Proto.RpbIndexReq
    req i k qt rmin rmax =
      Proto.defMessage
        & Proto.bucket .~ escape bucket
        & Proto.index .~ escape i
        & Proto.qtype .~ qt
        & Proto.maybe'key .~ k
        & Proto.maybe'rangeMin .~ rmin
        & Proto.maybe'rangeMax .~ rmax

-- | Create a put request.  The bucket and key names are URL-escaped.
-- Any 'Link' values inside the 'Content' are assumed to have been
-- constructed with the 'link' function, and hence /not/ escaped.
put :: Maybe BucketType -> Bucket -> Key -> Maybe VClock -> Proto.RpbContent -> W -> DW -> Bool
    -> Proto.RpbPutReq
put btype bucket key mvclock cont mw mdw returnBody =
    Proto.defMessage
      & Proto.bucket .~ escape bucket
      & Proto.key .~ escape key
      & Proto.maybe'vclock .~ (fromVClock <$> mvclock)
      & Proto.content .~ cont
      & Proto.maybe'w .~ fromQuorum mw
      & Proto.maybe'dw .~ fromQuorum mdw
      & Proto.returnBody .~ returnBody
      & Proto.maybe'type' .~ btype -- same as get
{-# INLINE put #-}

-- | Create a link.  The bucket and key names are URL-escaped.
link :: Bucket -> Key -> Tag -> Proto.RpbLink
link bucket key tag =
  Proto.defMessage
    & Proto.bucket .~ escape bucket
    & Proto.key .~ escape key
    & Proto.tag .~ tag
{-# INLINE link #-}

-- | Create a delete request.  The bucket and key names are URL-escaped.
delete :: Maybe BucketType -> Bucket -> Key -> RW -> Proto.RpbDelReq
delete btype bucket key rw = Proto.defMessage
                               & Proto.bucket .~ escape bucket
                               & Proto.key .~ escape key
                               & Proto.maybe'rw .~ fromQuorum rw
                               & Proto.maybe'type' .~ btype -- same as get
{-# INLINE delete #-}

-- | Create a list-buckets request.
listBuckets :: Maybe BucketType -> Proto.RpbListBucketsReq
listBuckets btype = Proto.defMessage & Proto.maybe'type' .~ btype
{-# INLINE listBuckets #-}

-- | Create a list-keys request.  The bucket type and name are URL-escaped.
listKeys :: Maybe BucketType -> Bucket -> Proto.RpbListKeysReq
listKeys t b = Proto.defMessage & Proto.maybe'type' .~ (escape <$> t)
                                & Proto.bucket .~ escape b
{-# INLINE listKeys #-}

-- | Create a get-bucket request.  The bucket type and name are URL-escaped.
getBucket :: Maybe BucketType -> Bucket -> Proto.RpbGetBucketReq
getBucket t b = Proto.defMessage & Proto.maybe'type' .~ (escape <$> t)
                                 & Proto.bucket .~ escape b
{-# INLINE getBucket #-}

-- | Create a set-bucket request.  The bucket type and name are URL-escaped.
setBucket :: Maybe BucketType -> Bucket -> Proto.RpbBucketProps -> Proto.RpbSetBucketReq
setBucket t b ps = Proto.defMessage & Proto.bucket .~ escape b
                                    & Proto.maybe'type' .~ (escape <$> t)
                                    & Proto.props .~ ps
{-# INLINE setBucket #-}

-- | Create a get-bucket-type request.  The bucket type is URL-escaped.
getBucketType :: BucketType -> Proto.RpbGetBucketTypeReq
getBucketType t = Proto.defMessage & Proto.type' .~ escape t

-- | Create a map-reduce request.
mapReduce :: Job -> Proto.RpbMapRedReq
mapReduce (JSON bs)   = Proto.defMessage & Proto.request .~ bs
                                         & Proto.contentType .~ "application/json"
mapReduce (Erlang bs) = Proto.defMessage & Proto.request .~ bs
                                         & Proto.contentType .~ "application/x-erlang-binary"

-- | Create a search request
search :: SearchQuery -> Index -> Proto.RpbSearchQueryReq
search q ix = Proto.defMessage
                & Proto.q .~ q
                & Proto.index .~ escape ix

getIndex :: Maybe Index -> Proto.RpbYokozunaIndexGetReq
getIndex ix = Proto.defMessage & Proto.maybe'name .~ ix

putIndex :: IndexInfo -> Maybe Timeout -> Proto.RpbYokozunaIndexPutReq
putIndex info timeout = Proto.defMessage
                          & Proto.index .~ info
                          & Proto.maybe'timeout .~ timeout

deleteIndex :: Index -> Proto.RpbYokozunaIndexDeleteReq
deleteIndex ix = Proto.defMessage & Proto.name .~ ix
