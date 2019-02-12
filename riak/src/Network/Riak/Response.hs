{-# LANGUAGE NamedFieldPuns, RecordWildCards, CPP, OverloadedStrings #-}

-- |
-- Module:      Network.Riak.Request
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
-- Stability:   experimental
-- Portability: portable
--
-- Smart deconstructors for Riak types.  These functions correctly
-- URL-unescape bucket, key, and link names.  You should thus use them
-- in preference to direct pattern matching against raw data
-- constructors.

module Network.Riak.Response
    (
    -- * Connection management
      getClientID
    -- * Data management
    , get
    , put
    -- * Metadata
    , listBuckets
    , getBucket
    , unescapeLinks
    , search
    , getIndex
    ) where

#if __GLASGOW_HASKELL__ < 710
import Control.Applicative ((<$>))
import Data.Semigroup
import Control.Arrow ((&&&))
import Control.Monad (join)
#endif
import qualified Data.Riak.Proto as Proto
import Network.Riak.Escape (unescape)
import Network.Riak.Lens
import Network.Riak.Types.Internal hiding (MessageTag(..))

import Data.ByteString (ByteString)
import Data.Foldable (toList)

getClientID :: Proto.RpbGetClientIdResp -> ClientID
getClientID = (^. Proto.clientId)
{-# INLINE getClientID #-}

-- | Construct a get response.  Bucket and key names in links are
-- URL-unescaped.
get :: Maybe Proto.RpbGetResp -> Maybe ([Proto.RpbContent], VClock)
get mresponse = do
  response <- mresponse
  let content = response ^. Proto.content
  vclock <- response ^. Proto.maybe'vclock
  Just (unescapeLinks <$> content, VClock vclock)
{-# INLINE get #-}

-- | Construct a put response.  Bucket and key names in links are
-- URL-unescaped.
put :: Proto.RpbPutResp -> ([Proto.RpbContent], VClock)
put response =
  ( unescapeLinks <$> (response ^. Proto.content)
  , VClock (response ^. Proto.vclock)
  )
{-# INLINE put #-}

-- | Construct a list-buckets response.  Bucket names are unescaped.
listBuckets :: Proto.RpbListBucketsResp -> [Bucket]
listBuckets = fmap unescape . (^. Proto.buckets)
{-# INLINE listBuckets #-}

getBucket :: Proto.RpbGetBucketResp -> Proto.RpbBucketProps
getBucket = (^. Proto.props)
{-# INLINE getBucket #-}

-- | URL-unescape the names of keys and buckets in the links of a
-- 'Content' value.
unescapeLinks :: Proto.RpbContent -> Proto.RpbContent
unescapeLinks = Proto.links . mapped %~ go
  where go :: Proto.RpbLink -> Proto.RpbLink
        go l = l & Proto.bucket %~ unescape
                 & Proto.key %~ unescape

search :: Proto.RpbSearchQueryResp -> SearchResult
search resp =
  SearchResult
    { docs     = fmap (fmap unpair . (^. Proto.fields)) (resp ^. Proto.docs)
    , maxScore = resp ^. Proto.maybe'maxScore
    , numFound = resp ^. Proto.maybe'numFound
    }
  where
    unpair :: Proto.RpbPair -> (ByteString, Maybe ByteString)
    unpair pair = (pair ^. Proto.key, pair ^. Proto.maybe'value)

getIndex :: Proto.RpbYokozunaIndexGetResp -> [IndexInfo]
getIndex = toList . (^. Proto.index)
