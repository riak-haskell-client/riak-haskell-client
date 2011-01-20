{-# LANGUAGE ExistentialQuantification, RecordWildCards #-}

module Network.Riak.Message
    (
      getResponse
    , putPingReq
    , recvResponse_
    , recvResponse
    , recvMaybeResponse
    , sendRequest
    ) where

import Control.Monad
import Data.Binary hiding (Get)
import Data.Binary.Put
import Data.ByteString.Lazy as L
import Data.IntMap as Map
import Network.Socket
import Network.Riak.Socket
import Network.Riak.Types
import Network.Riak.Types.Internal
import Network.Riak.Message.Tag
import Text.ProtocolBuffers as PB
import Text.ProtocolBuffers.Get
import Network.Riakclient.RpbGetResp
import Network.Riakclient.RpbPutResp
import Network.Riakclient.RpbGetClientIdResp
import Network.Socket.ByteString.Lazy as L

putPingReq :: Put
putPingReq = putWord32be 1 >> putTag PingReq

putRequest :: (Request req) => req -> Put
putRequest req = do
  putWord32be (fromIntegral (1 + messageSize req))
  putTag (messageTag req)
  messagePutM req

sendRequest :: (Request req) => Connection -> req -> IO ()
sendRequest Connection{..} req = L.sendAll connSock . runPut . putRequest $ req

getResponse :: Response a => MessageTag -> Get (Either String a)
getResponse expected = do
  tag <- getTag
  if tag == expected
    then Right `fmap` messageGetM
    else return . Left $ "received unexpected response: expected " ++
                         show expected ++ ", received " ++ show tag

recvResponse :: Response a => Connection -> IO a
recvResponse conn = go undefined where
  go :: Response b => b -> IO b
  go dummy = do
    len <- fromIntegral `fmap` recvGet conn getWord32be
    r <- recvGetN conn len (getResponse (messageTag dummy))
    case r of
      Left err -> fail err
      Right ret -> return ret

recvResponse_ :: Connection -> MessageTag -> IO ()
recvResponse_ conn expected = do
  len <- fromIntegral `fmap` recvGet conn getWord32be
  tag <- recvGet conn getTag
  when (tag /= expected) .
    fail $ "received unexpected response: expected " ++
           show expected ++ ", received " ++ show tag
  recvExactly conn (len-1) >> return ()

recvMaybeResponse :: Response a => Connection -> IO (Maybe a)
recvMaybeResponse conn =  go undefined where
  go :: Response b => b -> IO (Maybe b)
  go dummy = do
    len <- fromIntegral `fmap` recvGet conn getWord32be
    print len
    if len == 1
      then return Nothing
      else do
        r <- recvGetN conn len (getResponse (messageTag dummy))
        case r of
          Left err -> fail err
          Right ret -> return (Just ret)
