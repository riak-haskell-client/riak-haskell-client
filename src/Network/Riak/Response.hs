{-# LANGUAGE RecordWildCards #-}

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
    ) where

import Network.Riak.Protocol.BucketProps
import Network.Riak.Protocol.Content
import Network.Riak.Protocol.GetBucketResponse
import Network.Riak.Protocol.GetClientIDResponse
import Network.Riak.Protocol.GetResponse
import Network.Riak.Protocol.ListBucketsResponse
import Network.Riak.Protocol.PutResponse
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Data.ByteString.Lazy as L
import qualified Data.Sequence as Seq

getClientID :: GetClientIDResponse -> ClientID
getClientID = client_id
{-# INLINE getClientID #-}

get :: Maybe GetResponse -> Maybe (Seq.Seq Content, VClock)
get (Just (GetResponse content (Just vclock)))
      = Just (content, VClock vclock)
get _ = Nothing
{-# INLINE get #-}

put :: PutResponse -> (Seq.Seq Content, VClock)
put PutResponse{..} = (content, VClock (maybe L.empty id vclock))
{-# INLINE put #-}

listBuckets :: ListBucketsResponse -> (Seq.Seq Bucket)
listBuckets = buckets
{-# INLINE listBuckets #-}

getBucket :: GetBucketResponse -> BucketProps
getBucket = props
{-# INLINE getBucket #-}
