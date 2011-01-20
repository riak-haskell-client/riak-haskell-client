module Network.Riak.Message.Tag
    (
      Tagged(..)
    , MessageTag
    , putTag
    , getTag
    ) where

import Data.Typeable
import Control.Monad (liftM)
import Data.Word (Word8)
import Data.Binary.Put
import Network.Riakclient.RpbSetClientIdReq
import Network.Riakextra.RpbPingResp
import Network.Riakclient.RpbGetReq
import Network.Riakclient.RpbGetResp
import Network.Riakclient.RpbPutReq
import Network.Riakclient.RpbPutResp
import Network.Riakclient.RpbDelReq
import Network.Riakclient.RpbListKeysResp
import Network.Riakclient.RpbGetClientIdResp
import Network.Riakclient.RpbGetServerInfoResp
import Network.Riakextra.RpbSetClientIdResp
import Network.Riakextra.RpbGetServerInfoReq
import Network.Riakclient.RpbListKeysReq
import Network.Riakclient.RpbGetBucketReq
import Network.Riakclient.RpbGetBucketResp
import Network.Riakclient.RpbSetBucketReq
import Network.Riakclient.RpbListBucketsResp
import Network.Riakclient.RpbMapRedReq
import Network.Riakclient.RpbMapRedResp
import Network.Riakextra.RpbPingReq
import Network.Riakextra.RpbGetClientIdReq
import Network.Riakextra.RpbListBucketsReq
import Text.ProtocolBuffers
import Text.ProtocolBuffers.Get
import Network.Riak.Types.Internal as Types

instance Tagged RpbPingReq where
    messageTag _ = PingReq
    {-# INLINE messageTag #-}

instance Request RpbPingReq

instance Tagged RpbPingResp where
    messageTag _ = PingResp
    {-# INLINE messageTag #-}

instance Response RpbPingResp

instance Tagged RpbGetClientIdReq where
    messageTag _ = GetClientIdReq
    {-# INLINE messageTag #-}

instance Request RpbGetClientIdReq

instance Tagged RpbGetClientIdResp where
    messageTag _ = GetClientIdResp
    {-# INLINE messageTag #-}

instance Response RpbGetClientIdResp

instance Tagged RpbSetClientIdReq where
    messageTag _ = SetClientIdReq
    {-# INLINE messageTag #-}

instance Request RpbSetClientIdReq

instance Tagged RpbGetServerInfoReq where
    messageTag _ = GetServerInfoReq
    {-# INLINE messageTag #-}

instance Request RpbGetServerInfoReq

instance Tagged RpbGetServerInfoResp where
    messageTag _ = GetServerInfoResp
    {-# INLINE messageTag #-}

instance Response RpbGetServerInfoResp

instance Tagged RpbGetReq where
    messageTag _ = GetReq
    {-# INLINE messageTag #-}

instance Request RpbGetReq

instance Tagged RpbGetResp where
    messageTag _ = GetResp
    {-# INLINE messageTag #-}

instance Response RpbGetResp

instance Tagged RpbPutReq where
    messageTag _ = PutReq
    {-# INLINE messageTag #-}

instance Request RpbPutReq

instance Tagged RpbPutResp where
    messageTag _ = PutResp
    {-# INLINE messageTag #-}

instance Response RpbPutResp

instance Tagged RpbDelReq where
    messageTag _ = DelReq
    {-# INLINE messageTag #-}

instance Request RpbDelReq

instance Tagged RpbListBucketsReq where
    messageTag _ = ListBucketsReq
    {-# INLINE messageTag #-}

instance Request RpbListBucketsReq

instance Tagged RpbListBucketsResp where
    messageTag _ = ListBucketsResp
    {-# INLINE messageTag #-}

instance Response RpbListBucketsResp

instance Tagged RpbListKeysReq where
    messageTag _ = ListKeysReq
    {-# INLINE messageTag #-}

instance Request RpbListKeysReq

instance Tagged RpbListKeysResp where
    messageTag _ = ListKeysResp
    {-# INLINE messageTag #-}

instance Response RpbListKeysResp

instance Tagged RpbGetBucketReq where
    messageTag _ = GetBucketReq
    {-# INLINE messageTag #-}

instance Request RpbGetBucketReq

instance Tagged RpbGetBucketResp where
    messageTag _ = GetBucketResp
    {-# INLINE messageTag #-}

instance Response RpbGetBucketResp

instance Tagged RpbSetBucketReq where
    messageTag _ = SetBucketReq
    {-# INLINE messageTag #-}

instance Request RpbSetBucketReq

instance Tagged RpbMapRedReq where
    messageTag _ = MapRedReq
    {-# INLINE messageTag #-}

instance Request RpbMapRedReq

instance Tagged RpbMapRedResp where
    messageTag _ = MapRedResp
    {-# INLINE messageTag #-}

instance Response RpbMapRedResp

putTag :: MessageTag -> Put
putTag = putWord8 . fromIntegral . fromEnum
{-# INLINE putTag #-}

getTag :: Get MessageTag
getTag = do
  n <- getWord8
  if n > 24
    then fail $ "invalid riak message code: " ++ show n
    else return .  toEnum . fromIntegral $ n
{-# INLINE getTag #-}
