module Network.Riak.Message.Code
    (
      Coded(..)
    , MessageCode
    , messageNumber
    , getCode
    , putCode
    , errorResp
    , pingReq
    , pingResp
    , getClientIdReq
    , getClientIdResp
    , setClientIdReq
    , setClientIdResp
    , getServerInfoReq
    , getServerInfoResp
    , getReq 
    , getResp
    , putReq 
    , putResp
    , delReq 
    , delResp
    , listBucketsReq
    , listBucketsResp
    , listKeysReq
    , listKeysResp
    , getBucketReq
    , getBucketResp
    , setBucketReq
    , setBucketResp
    , mapRedReq
    , mapRedResp
    ) where

import Control.Monad (liftM)
import Data.Word (Word8)
import Data.Binary.Put
import Network.Riakclient.RpbSetClientIdReq
import Network.Riakclient.RpbGetReq
import Text.ProtocolBuffers
import Text.ProtocolBuffers.Get

newtype MessageCode = M Word8
    deriving (Eq)

messageNumber :: MessageCode -> Int
messageNumber (M m) = fromIntegral m
{-# INLINE messageNumber #-}

class (Wire msg) => Coded msg where
    messageCode :: msg -> MessageCode

instance Coded RpbSetClientIdReq where
    messageCode _ = setClientIdReq
    {-# INLINE messageCode #-}

instance Coded RpbGetReq where
    messageCode _ = getReq
    {-# INLINE messageCode #-}

putCode :: MessageCode -> Put
putCode (M m) = putWord8 m
{-# INLINE putCode #-}

getCode :: Get MessageCode
getCode = do
  n <- getWord8
  if n > 24
    then fail $ "invalid riak message code: " ++ show n
    else return (M n)
{-# INLINE getCode #-}

instance Show MessageCode where
    show (M 0) = "errorResp"
    show (M 1) = "pingReq"
    show (M 2) = "pingResp"
    show (M 3) = "getClientIdReq"
    show (M 4) = "getClientIdResp"
    show (M 5) = "setClientIdReq"
    show (M 6) = "setClientIdResp"
    show (M 7) = "getServerInfoReq"
    show (M 8) = "getServerInfoResp"
    show (M 9) = "getReq"
    show (M 10) = "getResp"
    show (M 11) = "putReq"
    show (M 12) = "putResp"
    show (M 13) = "delReq"
    show (M 14) = "delResp"
    show (M 15) = "listBucketsReq"
    show (M 16) = "listBucketsResp"
    show (M 17) = "listKeysReq"
    show (M 18) = "listKeysResp"
    show (M 19) = "getBucketReq"
    show (M 20) = "getBucketResp"
    show (M 21) = "setBucketReq"
    show (M 22) = "setBucketResp"
    show (M 23) = "mapRedReq"
    show (M 24) = "mapRedResp"

errorResp :: MessageCode
errorResp = M 0
{-# INLINE errorResp #-}

pingReq :: MessageCode
pingReq = M 1
{-# INLINE pingReq #-}

pingResp :: MessageCode
pingResp = M 2
{-# INLINE pingResp #-}

getClientIdReq :: MessageCode
getClientIdReq = M 3
{-# INLINE getClientIdReq #-}

getClientIdResp :: MessageCode
getClientIdResp = M 4
{-# INLINE getClientIdResp #-}

setClientIdReq :: MessageCode
setClientIdReq = M 5
{-# INLINE setClientIdReq #-}

setClientIdResp :: MessageCode
setClientIdResp = M 6
{-# INLINE setClientIdResp #-}

getServerInfoReq :: MessageCode
getServerInfoReq = M 7
{-# INLINE getServerInfoReq #-}

getServerInfoResp :: MessageCode
getServerInfoResp = M 8
{-# INLINE getServerInfoResp #-}

getReq  :: MessageCode
getReq  = M 9
{-# INLINE getReq  #-}

getResp :: MessageCode
getResp = M 10
{-# INLINE getResp #-}

putReq  :: MessageCode
putReq  = M 11
{-# INLINE putReq  #-}

putResp :: MessageCode
putResp = M 12
{-# INLINE putResp #-}

delReq  :: MessageCode
delReq  = M 13
{-# INLINE delReq  #-}

delResp :: MessageCode
delResp = M 14
{-# INLINE delResp #-}

listBucketsReq :: MessageCode
listBucketsReq = M 15
{-# INLINE listBucketsReq #-}

listBucketsResp :: MessageCode
listBucketsResp = M 16
{-# INLINE listBucketsResp #-}

listKeysReq :: MessageCode
listKeysReq = M 17
{-# INLINE listKeysReq #-}

listKeysResp :: MessageCode
listKeysResp = M 18
{-# INLINE listKeysResp #-}

getBucketReq :: MessageCode
getBucketReq = M 19
{-# INLINE getBucketReq #-}

getBucketResp :: MessageCode
getBucketResp = M 20
{-# INLINE getBucketResp #-}

setBucketReq :: MessageCode
setBucketReq = M 21
{-# INLINE setBucketReq #-}

setBucketResp :: MessageCode
setBucketResp = M 22
{-# INLINE setBucketResp #-}

mapRedReq :: MessageCode
mapRedReq = M 23
{-# INLINE mapRedReq #-}

mapRedResp :: MessageCode
mapRedResp = M 24
{-# INLINE mapRedResp #-}
