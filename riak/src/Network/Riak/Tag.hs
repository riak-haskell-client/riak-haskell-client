{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

-- |
-- Module:      Network.Riak.Content
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
-- Stability:   experimental
-- Portability: portable
--
-- im in ur msg system taggin ur msg types

module Network.Riak.Tag
    (
      putTag
    , getTag
    ) where

import Data.Binary.Get (Get, getWord8)
import Data.Binary.Put (Put, putWord8)
import Data.Word (Word8)
import qualified Data.HashMap.Strict as HM
#if __GLASGOW_HASKELL__ <= 708
import Control.Applicative
#endif
import Data.Riak.Proto
import Data.Tuple (swap)
import Network.Riak.Types.Internal as Types

instance Tagged RpbErrorResp where
    messageTag _ = Types.ErrorResponse
    {-# INLINE messageTag #-}

instance Response RpbErrorResp

instance Tagged RpbPingReq where
    messageTag _ = Types.PingRequest
    {-# INLINE messageTag #-}

instance Request RpbPingReq where
    expectedResponse _ = Types.PingResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbGetClientIdReq where
    messageTag _ = Types.GetClientIDRequest
    {-# INLINE messageTag #-}

instance Request RpbGetClientIdReq where
    expectedResponse _ = Types.GetClientIDResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbGetClientIdResp where
    messageTag _ = Types.GetClientIDResponse
    {-# INLINE messageTag #-}

instance Response RpbGetClientIdResp

instance Exchange RpbGetClientIdReq RpbGetClientIdResp

instance Tagged RpbSetClientIdReq where
    messageTag _ = Types.SetClientIDRequest
    {-# INLINE messageTag #-}

instance Request RpbSetClientIdReq where
    expectedResponse _ = Types.SetClientIDResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbGetServerInfoReq where
    messageTag _ = Types.GetServerInfoRequest
    {-# INLINE messageTag #-}

instance Request RpbGetServerInfoReq where
    expectedResponse _ = Types.GetServerInfoResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbGetServerInfoResp where
    messageTag _ = Types.GetServerInfoResponse
    {-# INLINE messageTag #-}

instance Response RpbGetServerInfoResp

instance Exchange RpbGetServerInfoReq RpbGetServerInfoResp

instance Tagged RpbGetReq where
    messageTag _ = Types.GetRequest
    {-# INLINE messageTag #-}

instance Tagged RpbIndexReq where
    messageTag _ = Types.IndexRequest
    {-# INLINE messageTag #-}

instance Request RpbGetReq where
    expectedResponse _ = Types.GetResponse
    {-# INLINE expectedResponse #-}

instance Request RpbIndexReq where
    expectedResponse _ = Types.IndexResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbGetResp where
    messageTag _ = Types.GetResponse
    {-# INLINE messageTag #-}

instance Tagged RpbIndexResp where
    messageTag _ = Types.IndexResponse
    {-# INLINE messageTag #-}

instance Response RpbGetResp

instance Response RpbIndexResp

instance Exchange RpbGetReq RpbGetResp

instance Exchange RpbIndexReq RpbIndexResp

instance Tagged RpbPutReq where
    messageTag _ = Types.PutRequest
    {-# INLINE messageTag #-}

instance Request RpbPutReq where
    expectedResponse _ = Types.PutResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbPutResp where
    messageTag _ = Types.PutResponse
    {-# INLINE messageTag #-}

instance Response RpbPutResp

instance Exchange RpbPutReq RpbPutResp

instance Tagged RpbDelReq where
    messageTag _ = Types.DeleteRequest
    {-# INLINE messageTag #-}

instance Request RpbDelReq where
    expectedResponse _ = Types.DeleteResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbListBucketsReq where
    messageTag _ = Types.ListBucketsRequest
    {-# INLINE messageTag #-}

instance Request RpbListBucketsReq where
    expectedResponse _ = Types.ListBucketsResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbListBucketsResp where
    messageTag _ = Types.ListBucketsResponse
    {-# INLINE messageTag #-}

instance Response RpbListBucketsResp

instance Exchange RpbListBucketsReq RpbListBucketsResp

instance Tagged RpbListKeysReq where
    messageTag _ = Types.ListKeysRequest
    {-# INLINE messageTag #-}

instance Request RpbListKeysReq where
    expectedResponse _ = Types.ListKeysResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbListKeysResp where
    messageTag _ = Types.ListKeysResponse
    {-# INLINE messageTag #-}

instance Response RpbListKeysResp

instance Tagged RpbGetBucketReq where
    messageTag _ = Types.GetBucketRequest
    {-# INLINE messageTag #-}

instance Request RpbGetBucketReq where
    expectedResponse _ = Types.GetBucketResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbGetBucketResp where
    messageTag _ = Types.GetBucketResponse
    {-# INLINE messageTag #-}

instance Response RpbGetBucketResp

instance Exchange RpbGetBucketReq RpbGetBucketResp

instance Tagged RpbSetBucketReq where
    messageTag _ = Types.SetBucketRequest
    {-# INLINE messageTag #-}

instance Request RpbSetBucketReq where
    expectedResponse _ = Types.SetBucketResponse
    {-# INLINE expectedResponse #-}

instance Request RpbGetBucketTypeReq where
    expectedResponse _ = Types.GetBucketResponse

instance Tagged RpbGetBucketTypeReq where
    messageTag _ = Types.GetBucketTypeRequest

instance Exchange RpbGetBucketTypeReq RpbGetBucketResp

instance Tagged RpbMapRedReq where
    messageTag _ = Types.MapReduceRequest
    {-# INLINE messageTag #-}

instance Request RpbMapRedReq where
    expectedResponse _ = Types.MapReduceResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbMapRedResp where
    messageTag _ = Types.MapReduceResponse
    {-# INLINE messageTag #-}


instance Response RpbMapRedResp

instance Exchange RpbMapRedReq RpbMapRedResp

instance Tagged DtFetchReq where
    messageTag _ = Types.DtFetchRequest
    {-# INLINE messageTag #-}

instance Tagged DtFetchResp where
    messageTag _ = Types.DtFetchResponse
    {-# INLINE messageTag #-}

instance Request DtFetchReq where
    expectedResponse _ = Types.DtFetchResponse
    {-# INLINE expectedResponse #-}

instance Response DtFetchResp

instance Exchange DtFetchReq DtFetchResp

instance Tagged DtUpdateReq where
    messageTag _ = Types.DtUpdateRequest
    {-# INLINE messageTag #-}

instance Tagged DtUpdateResp where
    messageTag _ = Types.DtUpdateResponse
    {-# INLINE messageTag #-}

instance Request DtUpdateReq where
    expectedResponse _ = Types.DtUpdateResponse
    {-# INLINE expectedResponse #-}

instance Response DtUpdateResp

instance Exchange DtUpdateReq DtUpdateResp

instance Tagged RpbSearchQueryReq where
    messageTag _ = Types.SearchQueryRequest
    {-# INLINE messageTag #-}

instance Request RpbSearchQueryReq where
    expectedResponse _ = Types.SearchQueryResponse
    {-# INLINE expectedResponse #-}

instance Tagged RpbSearchQueryResp where
    messageTag _ = Types.SearchQueryResponse
    {-# INLINE messageTag #-}

instance Response RpbSearchQueryResp

instance Exchange RpbSearchQueryReq RpbSearchQueryResp

instance Tagged RpbYokozunaIndexGetReq where
    messageTag _ = Types.YokozunaIndexGetRequest

instance Request RpbYokozunaIndexGetReq where
    expectedResponse _ = Types.YokozunaIndexGetResponse

instance Tagged RpbYokozunaIndexGetResp where
    messageTag _ = Types.YokozunaIndexGetResponse

instance Response RpbYokozunaIndexGetResp

instance Exchange RpbYokozunaIndexGetReq RpbYokozunaIndexGetResp

instance Request RpbYokozunaIndexPutReq where
  expectedResponse _ = Types.YokozunaIndexPutRequest

instance Tagged RpbYokozunaIndexPutReq where
  messageTag _ = Types.YokozunaIndexPutRequest

instance Exchange RpbYokozunaIndexPutReq RpbPutResp

instance Tagged RpbYokozunaIndexDeleteReq where
    messageTag _ = Types.YokozunaIndexDeleteRequest

instance Request RpbYokozunaIndexDeleteReq where
    expectedResponse _ = Types.DeleteResponse

putTag :: MessageTag -> Put
putTag m = putWord8 $ message2code HM.! m
{-# INLINE putTag #-}

getTag :: Get MessageTag
getTag = do
  n <- getWord8
  maybe (err n) pure $ HM.lookup n code2message
      where
        err n = moduleError "getTag" $ "invalid riak message code: " ++ show n
{-# INLINE getTag #-}

moduleError :: String -> String -> a
moduleError = netError "Network.Riak.Tag"


code2message :: HM.HashMap Word8 MessageTag
code2message = HM.fromList messageCodes

message2code :: HM.HashMap MessageTag Word8
message2code = HM.fromList . map swap $ messageCodes

messageCodes :: [(Word8, MessageTag)]
messageCodes = [
 -- From riak-2.1.3/deps/riak_pb/src/riak_pb_messages.csv
 --
 -- This is a list of all known riak messages (with appropriate
 -- message codes).  Most of them are described at
 -- http://docs.basho.com/riak/2.1.3/dev/references/protocol-buffers/
 --
 -- Commented ones are messages we don't use/support yet.
 (0, Types.ErrorResponse),
 (1, Types.PingRequest),
 (2, Types.PingResponse),
 (3, Types.GetClientIDResponse),
 (4, Types.GetClientIDResponse),
 (5, Types.SetClientIDRequest),
 (6, Types.SetClientIDResponse),
 (7, Types.GetServerInfoRequest),
 (8, Types.GetServerInfoResponse),
 (9, Types.GetRequest),
 (10, Types.GetResponse),
 (11, Types.PutRequest),
 (12, Types.PutResponse),
 (13, Types.DeleteRequest),
 (14, Types.DeleteResponse),
 (15, Types.ListBucketsRequest),
 (16, Types.ListBucketsResponse),
 (17, Types.ListKeysRequest),
 (18, Types.ListKeysResponse),
 (19, Types.GetBucketRequest),
 (20, Types.GetBucketResponse),
 (21, Types.SetBucketRequest),
 (22, Types.SetBucketResponse),
 (23, Types.MapReduceRequest),
 (24, Types.MapReduceResponse),
 (25, Types.IndexRequest),
 (26, Types.IndexResponse),
 (27, Types.SearchQueryRequest),
 (28, Types.SearchQueryResponse),
 -- (29,ResetBucketRequest),
 -- (30,ResetBucketResp),
 (31, Types.GetBucketTypeRequest),
 -- (32,SetBucketTypeReq),
 -- (33,GetBucketKeyPreflistReq),
 -- (34,GetBucketKeyPreflistResp),
 -- (40,CSBucketReq),
 -- (41,CSBucketResp),
 -- (50,CounterUpdateReq),
 -- (51,CounterUpdateResp),
 -- (52,CounterGetReq),
 -- (53,CounterGetResp),
 (54, Types.YokozunaIndexGetRequest),
 (55, Types.YokozunaIndexGetResponse),
 (56, Types.YokozunaIndexPutRequest),
 (57, Types.YokozunaIndexDeleteRequest),
 -- (58,YokozunaSchemaGetReq),
 -- (59,YokozunaSchemaGetResp),
 -- (60,YokozunaSchemaPutReq),
 (80, Types.DtFetchRequest),
 (81, Types.DtFetchResponse),
 (82, Types.DtUpdateRequest),
 (83, Types.DtUpdateResponse)
 -- (253,RpbAuthReq),
 -- (254,RpbAuthResp),
 -- (255,RpbStartTls)
 ]
