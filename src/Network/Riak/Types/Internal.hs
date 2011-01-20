module Network.Riak.Types.Internal
    (
      MessageTag(..)
    , Tagged(..)
    , Request(..)
    , Response(..)
    , VClock(..)
    , Q(..)
    , RW(..)
    , R(..)
    , W(..)
    , DW(..)
    , fromQuorum
    , toQuorum
    ) where

import qualified Data.ByteString.Lazy as L
import Data.Digest.Pure.MD5 (md5)
import Data.Word
import Text.ProtocolBuffers

data MessageTag = ErrorResp
                | PingReq
                | PingResp
                | GetClientIdReq
                | GetClientIdResp
                | SetClientIdReq
                | SetClientIdResp
                | GetServerInfoReq
                | GetServerInfoResp
                | GetReq
                | GetResp
                | PutReq
                | PutResp
                | DelReq
                | DelResp
                | ListBucketsReq
                | ListBucketsResp
                | ListKeysReq
                | ListKeysResp
                | GetBucketReq
                | GetBucketResp
                | SetBucketReq
                | SetBucketResp
                | MapRedReq
                | MapRedResp
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
      fromVClock :: L.ByteString
    } deriving (Eq)

instance Show VClock where
    show (VClock s) = "VClock " ++ show (md5 s)

data Q = Default
       | All
       | Quorum
       | One
         deriving (Eq, Enum, Show)

newtype RW = RW Q deriving (Eq, Show)
newtype R  = R Q deriving (Eq, Show)
newtype W  = W Q deriving (Eq, Show)
newtype DW = DW Q deriving (Eq, Show)

fromQ :: Q -> Word32
fromQ Default = 4294967291
fromQ All     = 4294967292
fromQ Quorum  = 4294967293
fromQ One     = 4294967294
{-# INLINE fromQ #-}

toQ :: Word32 -> Maybe Q
toQ 4294967291 = Just Default
toQ 4294967292 = Just All
toQ 4294967293 = Just Quorum
toQ 4294967294 = Just One
toQ _          = Nothing
{-# INLINE toQ #-}

class Quorum q where
    fromQuorum :: q -> Word32
    toQuorum :: Word32 -> Maybe q

instance Quorum Q where
    fromQuorum = fromQ
    {-# INLINE fromQuorum #-}

    toQuorum = toQ
    {-# INLINE toQuorum #-}

instance Quorum R where
    fromQuorum (R q) = fromQ q
    {-# INLINE fromQuorum #-}

    toQuorum = fmap R . toQ
    {-# INLINE toQuorum #-}

instance Quorum W where
    fromQuorum (W q) = fromQ q
    {-# INLINE fromQuorum #-}

    toQuorum = fmap W . toQ
    {-# INLINE toQuorum #-}

instance Quorum RW where
    fromQuorum (RW q) = fromQ q
    {-# INLINE fromQuorum #-}

    toQuorum = fmap RW . toQ
    {-# INLINE toQuorum #-}

instance Quorum DW where
    fromQuorum (DW q) = fromQ q
    {-# INLINE fromQuorum #-}

    toQuorum = fmap DW . toQ
    {-# INLINE toQuorum #-}
