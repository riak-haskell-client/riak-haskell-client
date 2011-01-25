{-# LANGUAGE DeriveDataTypeable, FunctionalDependencies, MultiParamTypeClasses,
    RecordWildCards #-}

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
    -- * Data types
    , Bucket
    , Key
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
    -- * Message identification
    , Request(..)
    , Response
    , Exchange
    , MessageTag(..)
    , Tagged(..)
    ) where

import Control.Exception
import Data.Typeable (Typeable)
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

data RiakException = NetException {
      excModule :: String
    , excFunction :: String
    , excMessage :: String
    } | TypeException {
      excModule :: String
    , excFunction :: String
    , excMessage :: String
    } deriving (Typeable)

showRiakException :: RiakException -> String
showRiakException exc@NetException{..} =
    "Riak network error " ++ formatRiakException exc
showRiakException exc@TypeException{..} =
    "Riak type error " ++ formatRiakException exc

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

instance Show Connection where
    show conn = show "Connection " ++ host c ++ ":" ++ port c
        where c = connClient conn

type Bucket = ByteString

type Key = ByteString

type Tag = ByteString

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

class (Tagged msg, ReflectDescriptor msg, Wire msg) => Request msg where
    expectedResponse :: msg -> MessageTag

class (Tagged msg, ReflectDescriptor msg, Wire msg) => Response msg

class (Request req, Response resp) => Exchange req resp
    | req -> resp, resp -> req

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
            | One
            | Quorum
            | All
              deriving (Bounded, Eq, Enum, Ord, Show)

type RW = Quorum
type R  = Quorum
type W  = Quorum
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
