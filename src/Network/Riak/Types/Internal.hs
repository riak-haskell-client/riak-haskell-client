module Network.Riak.Types.Internal
    (
    -- * Client management
      ClientID
    , Client(..)
    -- * Connection management
    , Connection(..)
    -- * Data types
    , Bucket
    , Key
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
    -- * Message identification
    , Request
    , Response
    , MessageTag(..)
    , Tagged(..)
    ) where

import Data.ByteString.Lazy (ByteString)
import Data.Digest.Pure.MD5 (md5)
import Data.IORef (IORef)
import Data.Word (Word32)
import Network.Socket (HostName, ServiceName, Socket)
import Text.ProtocolBuffers (ReflectDescriptor, Wire)
    
type ClientID = ByteString

data Client = Client {
      host :: HostName
    , port :: ServiceName
    , prefix :: ByteString
    , mapReducePrefix :: ByteString
    , clientID :: ClientID
    } deriving (Eq, Show)

data Connection = Connection {
      connSock :: Socket
    , connClient :: Client
    , connBuffer :: IORef ByteString
    } deriving (Eq)

instance Show Connection where
    show conn = show "Connection " ++ host c ++ ":" ++ port c
        where c = connClient conn

type Bucket = ByteString

type Key = ByteString

data Job = JSON ByteString
         | Erlang ByteString
           deriving (Eq, Show)

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
                  deriving (Eq, Show, Enum)

class Tagged msg where
    messageTag :: msg -> MessageTag

instance Tagged MessageTag where
    messageTag m = m
    {-# INLINE messageTag #-}

class (Tagged msg, ReflectDescriptor msg, Wire msg) => Request msg

class (Tagged msg, ReflectDescriptor msg, Wire msg) => Response msg

instance (Tagged a, Tagged b) => Tagged (Either a b) where
    messageTag (Left l)  = messageTag l
    messageTag (Right r) = messageTag r
    {-# INLINE messageTag #-}

newtype VClock = VClock {
      fromVClock :: ByteString
    } deriving (Eq)

instance Show VClock where
    show (VClock s) = "VClock " ++ show (md5 s)

data Quorum = Default
            | All
            | Quorum
            | One
              deriving (Eq, Enum, Show)

type RW = Quorum
type R  = Quorum
type W  = Quorum
type DW = Quorum

fromQuorum :: Quorum -> Word32
fromQuorum Default = 4294967291
fromQuorum All     = 4294967292
fromQuorum Quorum  = 4294967293
fromQuorum One     = 4294967294
{-# INLINE fromQuorum #-}

toQuorum :: Word32 -> Maybe Quorum
toQuorum 4294967291 = Just Default
toQuorum 4294967292 = Just All
toQuorum 4294967293 = Just Quorum
toQuorum 4294967294 = Just One
toQuorum _          = Nothing
{-# INLINE toQuorum #-}
