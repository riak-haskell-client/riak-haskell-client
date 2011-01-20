{-# LANGUAGE RecordWildCards #-}

module Network.Riak.Socket
    (
      recvExactly
    , recvGet
    , recvGetN
    ) where

import Control.Monad
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString as B
import Network.Socket
import Network.Socket.ByteString as B
import Network.Socket.ByteString.Lazy as L
import Data.Int
import Text.ProtocolBuffers.Get
import Network.Riak.Types
import Data.IORef

recvWith :: (L.ByteString -> IO L.ByteString) -> Connection -> Int64
         -> IO L.ByteString
recvWith onError Connection{..} n0
    | n0 <= 0 = return L.empty
    | otherwise = do
  bs <- readIORef connBuffer
  let (h,t) = L.splitAt n0 bs
      len = L.length h
  if len == n0
    then writeIORef connBuffer t >> return h
    else if len == 0
         then go [] n0
         else go (reverse (L.toChunks t)) (n0-len)
  where
    maxInt = fromIntegral (maxBound :: Int)
    go acc n
        | n <= 0 = return (L.fromChunks (reverse acc))
        | otherwise = do
      let n' = min n maxInt
      bs <- B.recv connSock (fromIntegral n')
      let len = B.length bs
      if len == 0
        then onError (L.fromChunks (reverse acc))
        else go (bs:acc) (n' - fromIntegral len)

recvExactly :: Connection -> Int64 -> IO L.ByteString
recvExactly = recvWith (const (fail "short read from network"))

recvGet :: Connection -> Get a -> IO a
recvGet Connection{..} get = do
  let refill = do
        bs <- L.recv connSock 16384
        if L.null bs
          then shutdown connSock ShutdownReceive >> return Nothing
          else return (Just bs)
      step (Failed _ err)    = fail err
      step (Finished bs _ r) = writeIORef connBuffer bs >> return r
      step (Partial k)       = (step . k) =<< refill
  mbs <- do
    buf <- readIORef connBuffer
    if L.null buf
      then refill
      else return (Just buf)
  case mbs of
    Just bs -> step $ runGet get bs
    Nothing -> fail "socket closed"
  
recvGetN :: Connection -> Int64 -> Get a -> IO a
recvGetN conn n get = do
  bs <- recvExactly conn n
  let finish bs' r = do
        unless (L.null bs') $ modifyIORef (connBuffer conn) (`L.append` bs')
        return r
  case runGet get bs of
    Finished bs' _ r -> finish bs' r
    Partial k    -> case k Nothing of
                      Finished bs' _ r -> finish bs' r
                      Failed _ err -> fail err
                      Partial _    -> fail "parser wants more input!?"
    Failed _ err -> fail err
