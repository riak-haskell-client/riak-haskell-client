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

import Control.Applicative ((<$>))
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Data.Sequence as Seq
import Network.Riak.Protocol.Content
import Network.Riak.Protocol.GetResponse
import Network.Riak.Protocol.PutResponse
import Network.Riak.Protocol.GetClientIDResponse
import Network.Riak.Protocol.ListBucketsResponse
import Network.Riak.Protocol.GetBucketResponse
import Network.Riak.Protocol.BucketProps

getClientID :: GetClientIDResponse -> ClientID
getClientID = client_id
{-# INLINE getClientID #-}

get :: Maybe GetResponse -> (Seq.Seq Content, Maybe VClock)
get (Just GetResponse{..}) = (content, VClock <$> vclock)
get _                      = (Seq.empty, Nothing)
{-# INLINE get #-}

put :: PutResponse -> (Seq.Seq Content, Maybe VClock)
put PutResponse{..} = (content, VClock <$> vclock)
{-# INLINE put #-}

listBuckets :: ListBucketsResponse -> (Seq.Seq Bucket)
listBuckets = buckets
{-# INLINE listBuckets #-}

getBucket :: GetBucketResponse -> BucketProps
getBucket = props
{-# INLINE getBucket #-}
