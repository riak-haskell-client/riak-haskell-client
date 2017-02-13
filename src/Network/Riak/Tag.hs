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

import Data.Binary.Put (Put, putWord8)
import Data.Word (Word8)
import qualified Data.HashMap.Strict as HM
#if __GLASGOW_HASKELL__ <= 708
import Control.Applicative
#endif
import Data.Tuple (swap)
import Network.Riak.Protocol.DeleteRequest
import Network.Riak.Protocol.ErrorResponse
import Network.Riak.Protocol.GetBucketRequest
import Network.Riak.Protocol.GetBucketTypeRequest
import Network.Riak.Protocol.GetBucketResponse
import Network.Riak.Protocol.GetClientIDRequest
import Network.Riak.Protocol.GetClientIDResponse
import Network.Riak.Protocol.GetRequest
import Network.Riak.Protocol.GetResponse
import Network.Riak.Protocol.IndexRequest
import Network.Riak.Protocol.IndexResponse
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
import Network.Riak.Protocol.SetClientIDRequest
import Network.Riak.Protocol.DtFetchRequest
import Network.Riak.Protocol.DtFetchResponse
import Network.Riak.Protocol.DtUpdateRequest
import Network.Riak.Protocol.DtUpdateResponse
import Network.Riak.Protocol.SearchQueryRequest
import Network.Riak.Protocol.SearchQueryResponse
import Network.Riak.Protocol.YzIndexGetRequest
import Network.Riak.Protocol.YzIndexGetResponse
import Network.Riak.Protocol.YzIndexPutRequest
import Network.Riak.Protocol.YzIndexDeleteRequest
import Network.Riak.Types.Internal as Types
import Text.ProtocolBuffers.Get (Get, getWord8)

instance Tagged ErrorResponse where
    messageTag _ = Types.ErrorResponse
    {-# INLINE messageTag #-}

instance Response ErrorResponse

instance Tagged PingRequest where
    messageTag _ = Types.PingRequest
    {-# INLINE messageTag #-}

instance Request PingRequest where
    expectedResponse _ = Types.PingResponse
    {-# INLINE expectedResponse #-}

instance Tagged GetClientIDRequest where
    messageTag _ = Types.GetClientIDRequest
    {-# INLINE messageTag #-}

instance Request GetClientIDRequest where
    expectedResponse _ = Types.GetClientIDResponse
    {-# INLINE expectedResponse #-}

instance Tagged GetClientIDResponse where
    messageTag _ = Types.GetClientIDResponse
    {-# INLINE messageTag #-}

instance Response GetClientIDResponse

instance Exchange GetClientIDRequest GetClientIDResponse

instance Tagged SetClientIDRequest where
    messageTag _ = Types.SetClientIDRequest
    {-# INLINE messageTag #-}

instance Request SetClientIDRequest where
    expectedResponse _ = Types.SetClientIDResponse
    {-# INLINE expectedResponse #-}

instance Tagged GetServerInfoRequest where
    messageTag _ = Types.GetServerInfoRequest
    {-# INLINE messageTag #-}

instance Request GetServerInfoRequest where
    expectedResponse _ = Types.GetServerInfoResponse
    {-# INLINE expectedResponse #-}

instance Tagged ServerInfo where
    messageTag _ = Types.GetServerInfoResponse
    {-# INLINE messageTag #-}

instance Response ServerInfo

instance Exchange GetServerInfoRequest ServerInfo

instance Tagged GetRequest where
    messageTag _ = Types.GetRequest
    {-# INLINE messageTag #-}

instance Tagged IndexRequest where
    messageTag _ = Types.IndexRequest
    {-# INLINE messageTag #-}

instance Request GetRequest where
    expectedResponse _ = Types.GetResponse
    {-# INLINE expectedResponse #-}

instance Request IndexRequest where
    expectedResponse _ = Types.IndexResponse
    {-# INLINE expectedResponse #-}

instance Tagged GetResponse where
    messageTag _ = Types.GetResponse
    {-# INLINE messageTag #-}

instance Tagged IndexResponse where
    messageTag _ = Types.IndexResponse
    {-# INLINE messageTag #-}

instance Response GetResponse

instance Response IndexResponse

instance Exchange GetRequest GetResponse

instance Exchange IndexRequest IndexResponse

instance Tagged PutRequest where
    messageTag _ = Types.PutRequest
    {-# INLINE messageTag #-}

instance Request PutRequest where
    expectedResponse _ = Types.PutResponse
    {-# INLINE expectedResponse #-}

instance Tagged PutResponse where
    messageTag _ = Types.PutResponse
    {-# INLINE messageTag #-}

instance Response PutResponse

instance Exchange PutRequest PutResponse

instance Tagged DeleteRequest where
    messageTag _ = Types.DeleteRequest
    {-# INLINE messageTag #-}

instance Request DeleteRequest where
    expectedResponse _ = Types.DeleteResponse
    {-# INLINE expectedResponse #-}

instance Tagged ListBucketsRequest where
    messageTag _ = Types.ListBucketsRequest
    {-# INLINE messageTag #-}

instance Request ListBucketsRequest where
    expectedResponse _ = Types.ListBucketsResponse
    {-# INLINE expectedResponse #-}

instance Tagged ListBucketsResponse where
    messageTag _ = Types.ListBucketsResponse
    {-# INLINE messageTag #-}

instance Response ListBucketsResponse

instance Exchange ListBucketsRequest ListBucketsResponse

instance Tagged ListKeysRequest where
    messageTag _ = Types.ListKeysRequest
    {-# INLINE messageTag #-}

instance Request ListKeysRequest where
    expectedResponse _ = Types.ListKeysResponse
    {-# INLINE expectedResponse #-}

instance Tagged ListKeysResponse where
    messageTag _ = Types.ListKeysResponse
    {-# INLINE messageTag #-}

instance Response ListKeysResponse

instance Tagged GetBucketRequest where
    messageTag _ = Types.GetBucketRequest
    {-# INLINE messageTag #-}

instance Request GetBucketRequest where
    expectedResponse _ = Types.GetBucketResponse
    {-# INLINE expectedResponse #-}

instance Tagged GetBucketResponse where
    messageTag _ = Types.GetBucketResponse
    {-# INLINE messageTag #-}

instance Response GetBucketResponse

instance Exchange GetBucketRequest GetBucketResponse

instance Tagged SetBucketRequest where
    messageTag _ = Types.SetBucketRequest
    {-# INLINE messageTag #-}

instance Request SetBucketRequest where
    expectedResponse _ = Types.SetBucketResponse
    {-# INLINE expectedResponse #-}

instance Request GetBucketTypeRequest where
    expectedResponse _ = Types.GetBucketResponse

instance Tagged GetBucketTypeRequest where
    messageTag _ = Types.GetBucketTypeRequest

instance Exchange GetBucketTypeRequest GetBucketResponse

instance Tagged MapReduceRequest where
    messageTag _ = Types.MapReduceRequest
    {-# INLINE messageTag #-}

instance Request MapReduceRequest where
    expectedResponse _ = Types.MapReduceResponse
    {-# INLINE expectedResponse #-}

instance Tagged MapReduce where
    messageTag _ = Types.MapReduceResponse
    {-# INLINE messageTag #-}


instance Response MapReduce

instance Exchange MapReduceRequest MapReduce

instance Tagged DtFetchRequest where
    messageTag _ = Types.DtFetchRequest
    {-# INLINE messageTag #-}

instance Tagged DtFetchResponse where
    messageTag _ = Types.DtFetchResponse
    {-# INLINE messageTag #-}

instance Request DtFetchRequest where
    expectedResponse _ = Types.DtFetchResponse
    {-# INLINE expectedResponse #-}

instance Response DtFetchResponse

instance Exchange DtFetchRequest DtFetchResponse

instance Tagged DtUpdateRequest where
    messageTag _ = Types.DtUpdateRequest
    {-# INLINE messageTag #-}

instance Tagged DtUpdateResponse where
    messageTag _ = Types.DtUpdateResponse
    {-# INLINE messageTag #-}

instance Request DtUpdateRequest where
    expectedResponse _ = Types.DtUpdateResponse
    {-# INLINE expectedResponse #-}

instance Response DtUpdateResponse

instance Exchange DtUpdateRequest DtUpdateResponse

instance Tagged SearchQueryRequest where
    messageTag _ = Types.SearchQueryRequest
    {-# INLINE messageTag #-}

instance Request SearchQueryRequest where
    expectedResponse _ = Types.SearchQueryResponse
    {-# INLINE expectedResponse #-}

instance Tagged SearchQueryResponse where
    messageTag _ = Types.SearchQueryResponse
    {-# INLINE messageTag #-}

instance Response SearchQueryResponse

instance Exchange SearchQueryRequest SearchQueryResponse

instance Tagged YzIndexGetRequest where
    messageTag _ = Types.YokozunaIndexGetRequest

instance Request YzIndexGetRequest where
    expectedResponse _ = Types.YokozunaIndexGetResponse

instance Tagged YzIndexGetResponse where
    messageTag _ = Types.YokozunaIndexGetResponse

instance Response YzIndexGetResponse

instance Exchange YzIndexGetRequest YzIndexGetResponse

instance Request YzIndexPutRequest where
  expectedResponse _ = Types.YokozunaIndexPutRequest

instance Tagged YzIndexPutRequest where
  messageTag _ = Types.YokozunaIndexPutRequest

instance Exchange YzIndexPutRequest PutResponse

instance Tagged YzIndexDeleteRequest where
    messageTag _ = Types.YokozunaIndexDeleteRequest

instance Request YzIndexDeleteRequest where
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
