{-# LANGUAGE RecordWildCards #-}

module Network.Riak.Message
    (
      Response(..)
    , getResponse
    , putPingReq
    , recvResponse_
    , recvResponse
    , sendRequest
    ) where

import Data.Binary hiding (Get)
import Data.Binary.Put
import Data.ByteString.Lazy as L
import Data.IntMap as Map
import Network.Socket
import Network.Riak.Socket
import Network.Riak.Types
import Network.Riak.Message.Code
import Text.ProtocolBuffers as PB
import Text.ProtocolBuffers.Get
import Network.Riakclient.RpbGetResp
import Network.Riakclient.RpbPutResp
import Network.Socket.ByteString.Lazy as L


data Response = ErrorResponse
              | PingResponse
              | SetClientIDResponse
              | GetResponse RpbGetResp
              | PutResponse RpbPutResp
                deriving (Eq, Show)

putPingReq :: Put
putPingReq = putWord32be 1 >> putCode pingReq

putRequest :: (Coded req, ReflectDescriptor req, Wire req) => req -> Put
putRequest req = do
  putWord32be (fromIntegral (1 + messageSize req))
  putCode (messageCode req)
  messagePutM req

sendRequest :: (Coded req, ReflectDescriptor req, Wire req) =>
               Connection -> req -> IO ()
sendRequest Connection{..} req = L.sendAll connSock . runPut . putRequest $ req

getterMap :: Map.IntMap (Get Response)
getterMap = Map.fromList [
              errorResp -:> return ErrorResponse
            , pingResp -:> return PingResponse
            , getResp -:> (GetResponse `fmap` messageGetM)
            , putResp -:> (PutResponse `fmap` messageGetM)
            , setClientIdResp -:> return SetClientIDResponse
            ]
  where a -:> b = (messageNumber a, b)

getResponse :: Get Response
getResponse = do
  code <- getCode
  Map.findWithDefault (fail $ "invalid response: " ++ show code)
         (messageNumber code) getterMap

recvResponse_ :: Connection -> IO Response
recvResponse_ conn = do
  len <- fromIntegral `fmap` recvGet conn getWord32be
  recvGetN conn len getResponse

recvResponse :: Connection -> IO (Either MessageCode Response)
recvResponse conn = do
  len <- fromIntegral `fmap` recvGet conn getWord32be
  print len
  if len == 1
    then Left `fmap` recvGet conn getCode
    else Right `fmap` recvGetN conn len getResponse
