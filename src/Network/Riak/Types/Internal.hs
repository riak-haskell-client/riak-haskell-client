{-# LANGUAGE DeriveDataTypeable, FunctionalDependencies, MultiParamTypeClasses,
    RecordWildCards, RankNTypes #-}

-- |
-- Module:      Network.Riak.Types.Internal
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
-- Stability:   experimental
-- Portability: portable
--
-- Basic types.

module Network.Riak.Types.Internal
    (
    -- * Client management
      ClientID
    , Client(..)
    -- * Connection management
    , Connection(..)
    -- * Errors
    , RiakException(excModule, excFunction, excMessage)
    , netError
    , typeError
    , unexError
    -- * Data types
    , Bucket
    , Key
    , Index
    , IndexQuery(..)
    , IndexValue(..)
    , Tag
    , VClock(..)
    , Job(..)
    -- * Quorum management
    , Quorum(..)
    , DW
    , R
    , RW
    , W
    , fromQuorum
    , toQuorum
    , fromTag
    , toTag
    -- * Message identification
    , Request(..)
    , Response
    , Exchange
    , MessageTag(..)
    , Tagged(..)
    , BucketType
    ) where

import Control.Exception (Exception, throw)
import Data.ByteString.Lazy (ByteString)
import Data.Digest.Pure.MD5 (md5)
import Data.IORef (IORef)
import Data.Typeable (Typeable)
import Data.Word (Word32)
import Network.Socket (HostName, ServiceName, Socket)
import Text.ProtocolBuffers (ReflectDescriptor, Wire)

-- | A client identifier.  This is used by the Riak cluster when
-- logging vector clock changes, and should be unique for each client.
type ClientID = ByteString

data Client = Client {
      host :: HostName
    -- ^ Name of the server to connect to.
    , port :: ServiceName
    -- ^ Port number to connect to (default is 8087).
    , clientID :: ClientID
    -- ^ Client identifier.
    } deriving (Eq, Show, Typeable)

-- | A connection to a Riak server.
data Connection = Connection {
      connSock :: Socket
    , connClient :: Client
    -- ^ The configuration we connected with.
    , connBuffer :: IORef ByteString
    -- ^ Received data that has not yet been consumed.
    } deriving (Eq)

-- | The main Riak exception type.
data RiakException = NetException {
      excModule :: String
    , excFunction :: String
    , excMessage :: String
    } | TypeException {
      excModule :: String
    , excFunction :: String
    , excMessage :: String
    } | UnexpectedResponse {
      excModule :: String
    , excFunction :: String
    , excMessage :: String
    }deriving (Eq, Typeable)

showRiakException :: RiakException -> String
showRiakException exc@NetException{..} =
    "Riak network error " ++ formatRiakException exc
showRiakException exc@TypeException{..} =
    "Riak type error " ++ formatRiakException exc
showRiakException exc@UnexpectedResponse{..} =
    "Riak server sent unexpected response " ++ formatRiakException exc

formatRiakException :: RiakException -> String
formatRiakException exc =
    "(" ++ excModule exc ++ "." ++ excFunction exc ++ "): " ++ excMessage exc

instance Show RiakException where
    show = showRiakException

instance Exception RiakException

netError :: String -> String -> String -> a
netError modu func msg = throw (NetException modu func msg)

typeError :: String -> String -> String -> a
typeError modu func msg = throw (TypeException modu func msg)

unexError :: String -> String -> String -> a
unexError modu func msg = throw (UnexpectedResponse modu func msg)

instance Show Connection where
    show conn = concat ["Connection ", host c, ":", port c]
        where c = connClient conn

-- | A Bucket is a container and keyspace for data stored in Riak,
-- with a set of common properties for its contents (the number of
-- replicas, for instance).
type Bucket = ByteString

-- | Keys are unique object identifiers in Riak and are scoped within
-- buckets.
type Key = ByteString

-- | Name of a secondary index
type Index = ByteString

-- | Index query. Can be exact or range, int or bin. Index name should
-- not contain the "_bin" or "_int" part, since it's determined from
-- data constructor.
data IndexQuery = IndexQueryExactInt !Index !Int
                | IndexQueryExactBin !Index !ByteString
                | IndexQueryRangeInt !Index !Int !Int
                | IndexQueryRangeBin !Index !ByteString !ByteString
    deriving (Show, Eq)

data IndexValue = IndexInt !Index !Int
                | IndexBin !Index !ByteString
    deriving (Show, Eq)

-- | An application-specific identifier for a link.  See
-- <http://wiki.basho.com/Links.html> for details.
type Tag = ByteString

-- | A specification of a MapReduce
-- job. <http://wiki.basho.com/MapReduce.html>.
data Job = JSON ByteString
         | Erlang ByteString
           deriving (Eq, Show, Typeable)

type BucketType = ByteString

-- | An identifier for an inbound or outbound message.
data MessageTag = ErrorResponse
                | PingRequest
                | PingResponse
                | GetClientIDRequest
                | GetClientIDResponse
                | SetClientIDRequest
                | SetClientIDResponse
                | GetServerInfoRequest
                | GetServerInfoResponse
                | GetRequest
                | GetResponse
                | PutRequest
                | PutResponse
                | DeleteRequest
                | DeleteResponse
                | ListBucketsRequest
                | ListBucketsResponse
                | ListKeysRequest
                | ListKeysResponse
                | GetBucketRequest
                | GetBucketResponse
                | SetBucketRequest
                | SetBucketResponse
                | MapReduceRequest
                | MapReduceResponse
                | IndexRequest
                | IndexResponse
                | RpbIndexReq
                | RpbIndexResp
                | RpbSearchQueryReq
                | RpbSearchQueryResp
                | RpbResetBucketReq
                | RpbResetBucketResp
                | RpbGetBucketTypeReq
                | RpbSetBucketTypeReq
                | RpbCSBucketReq
                | RpbCSUpdateReq
                | RpbCounterUpdateReq
                | RpbCounterUpdateResp
                | RpbCounterGetReq
                | RpbCounterGetResp
                | RpbYokozunaIndexGetReq
                | RpbYokozunaIndexGetResp
                | RpbYokozunaIndexPutReq
                | RpbYokozunaIndexPutResp
                | RpbYokozunaSchemaGetReq
                | RpbYokozunaSchemaGetResp
                | RpbYokozunaSchemaPutReq
                | DtFetchRequest
                | DtFetchResponse
                | DtUpdateRequest
                | DtUpdateResponse
                | RpbAuthReq
                | RpbAuthResp
                | RpbStartTls
                deriving (Eq, Show, Typeable, Data)

toTag :: Word8 -> MessageTag
toTag 0   = ErrorResponse
toTag 1   = PingRequest
toTag 2   = PingResponse
toTag 3   = GetClientIDRequest
toTag 4   = GetClientIDResponse
toTag 5   = SetClientIDRequest
toTag 6   = SetClientIDResponse
toTag 7   = GetServerInfoRequest
toTag 8   = GetServerInfoResponse
toTag 9   = GetRequest
toTag 10  = GetResponse
toTag 11  = PutRequest
toTag 12  = PutResponse
toTag 13  = DeleteRequest
toTag 14  = DeleteResponse
toTag 15  = ListBucketsRequest
toTag 16  = ListBucketsResponse
toTag 17  = ListKeysRequest
toTag 18  = ListKeysResponse
toTag 19  = GetBucketRequest
toTag 20  = GetBucketResponse
toTag 21  = SetBucketRequest
toTag 22  = SetBucketResponse
toTag 23  = MapReduceRequest
toTag 24  = MapReduceResponse
toTag 25  = RpbIndexReq
toTag 26  = RpbIndexResp
toTag 27  = RpbSearchQueryReq
toTag 28  = RpbSearchQueryResp
toTag 29  = RpbResetBucketReq
toTag 30  = RpbResetBucketResp
toTag 31  = RpbGetBucketTypeReq
toTag 32  = RpbSetBucketTypeReq
toTag 40  = RpbCSBucketReq
toTag 41  = RpbCSUpdateReq
toTag 50  = RpbCounterUpdateReq
toTag 51  = RpbCounterUpdateResp
toTag 52  = RpbCounterGetReq
toTag 53  = RpbCounterGetResp
toTag 54  = RpbYokozunaIndexGetReq
toTag 55  = RpbYokozunaIndexGetResp
toTag 56  = RpbYokozunaIndexPutReq
toTag 57  = RpbYokozunaIndexPutResp
toTag 58  = RpbYokozunaSchemaGetReq
toTag 59  = RpbYokozunaSchemaGetResp
toTag 60  = RpbYokozunaSchemaPutReq
toTag 80  = DtFetchRequest
toTag 81  = DtFetchResponse
toTag 82  = DtUpdateRequest
toTag 83  = DtUpdateResponse
toTag 253 = RpbAuthReq
toTag 254 = RpbAuthResp
toTag 255 = RpbStartTls
toTag n = error ("attempted to convert value " ++ show n)

fromTag :: MessageTag -> Word8
fromTag ErrorResponse = 0
fromTag PingRequest = 1
fromTag PingResponse = 2
fromTag GetClientIDRequest = 3
fromTag GetClientIDResponse = 4
fromTag SetClientIDRequest = 5
fromTag SetClientIDResponse = 6
fromTag GetServerInfoRequest = 7
fromTag GetServerInfoResponse = 8
fromTag GetRequest = 9
fromTag GetResponse = 10
fromTag PutRequest = 11
fromTag PutResponse = 12
fromTag DeleteRequest = 13
fromTag DeleteResponse = 14
fromTag ListBucketsRequest = 15
fromTag ListBucketsResponse = 16
fromTag ListKeysRequest = 17
fromTag ListKeysResponse = 18
fromTag GetBucketRequest = 19
fromTag GetBucketResponse = 20
fromTag SetBucketRequest = 21
fromTag SetBucketResponse = 22
fromTag MapReduceRequest = 23
fromTag MapReduceResponse = 24
fromTag RpbIndexReq = 25
fromTag RpbIndexResp = 26
fromTag RpbSearchQueryReq = 27
fromTag RpbSearchQueryResp = 28
fromTag RpbResetBucketReq = 29
fromTag RpbResetBucketResp = 30
fromTag RpbGetBucketTypeReq = 31
fromTag RpbSetBucketTypeReq = 32
fromTag RpbCSBucketReq = 40
fromTag RpbCSUpdateReq = 41
fromTag RpbCounterUpdateReq = 50
fromTag RpbCounterUpdateResp = 51
fromTag RpbCounterGetReq = 52
fromTag RpbCounterGetResp = 53
fromTag RpbYokozunaIndexGetReq = 54
fromTag RpbYokozunaIndexGetResp = 55
fromTag RpbYokozunaIndexPutReq = 56
fromTag RpbYokozunaIndexPutResp = 57
fromTag RpbYokozunaSchemaGetReq = 58
fromTag RpbYokozunaSchemaGetResp = 59
fromTag RpbYokozunaSchemaPutReq = 60
fromTag DtFetchRequest = 80
fromTag DtFetchResponse = 81
fromTag DtUpdateRequest = 82
fromTag DtUpdateResponse = 83
fromTag RpbAuthReq = 253
fromTag RpbAuthResp = 254
fromTag RpbStartTls = 255


-- | Messages are tagged.
class Tagged msg where
    messageTag :: msg -> MessageTag -- ^ Retrieve a message's tag.

instance Tagged MessageTag where
    messageTag m = m
    {-# INLINE messageTag #-}

-- | A message representing a request from client to server.
class (Tagged msg, ReflectDescriptor msg, Show msg, Wire msg) => Request msg
    where expectedResponse :: msg -> MessageTag

-- | A message representing a response from server to client.
class (Tagged msg, ReflectDescriptor msg, Show msg, Wire msg) => Response msg

class (Request req, Response resp) => Exchange req resp
    | req -> resp, resp -> req

instance (Tagged a, Tagged b) => Tagged (Either a b) where
    messageTag (Left l)  = messageTag l
    messageTag (Right r) = messageTag r
    {-# INLINE messageTag #-}

-- | A wrapper that keeps Riak vector clocks opaque.
newtype VClock = VClock {
      fromVClock :: ByteString
    -- ^ Unwrap the 'ByteString'.  (This is really only useful for
    -- printing the raw vclock string.)
    } deriving (Eq, Typeable)

instance Show VClock where
    show (VClock s) = "VClock " ++ show (md5 s)

-- | A read/write quorum.  The quantity of replicas that must respond
-- to a read or write request before it is considered successful. This
-- is defined as a bucket property or as one of the relevant
-- parameters to a single request ('R','W','DW','RW').
data Quorum = Default   -- ^ Use the default quorum settings for the bucket.
            | One       -- ^ Success after one server has responded.
            | Quorum    -- ^ Success after a quorum of servers has responded.
            | All       -- ^ Success after all servers have responded.
              deriving (Bounded, Eq, Enum, Ord, Show, Typeable)

-- | Read/write quorum.  How many replicas need to collaborate when
-- deleting a value.
type RW = Quorum

-- | Read quorum.  How many replicas need to agree when retrieving a
-- value.
type R  = Quorum

-- | Write quorum.  How many replicas to write to before returning a
-- successful response.
type W  = Quorum

-- | Durable write quorum.  How many replicas to commit to durable
-- storage before returning a successful response.
type DW = Quorum

fromQuorum :: Quorum -> Maybe Word32
fromQuorum Default = Just 4294967291
fromQuorum One     = Just 4294967294
fromQuorum Quorum  = Just 4294967293
fromQuorum All     = Just 4294967292
{-# INLINE fromQuorum #-}

toQuorum :: Word32 -> Maybe Quorum
toQuorum 4294967294 = Just One
toQuorum 4294967293 = Just Quorum
toQuorum 4294967292 = Just All
toQuorum 4294967291 = Just Default
toQuorum v          = error $ "invalid quorum value " ++ show v
{-# INLINE toQuorum #-}
