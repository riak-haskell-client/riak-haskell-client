{-# LANGUAGE RecordWildCards #-}

module Network.Riak.Pipeline
    (
      pipeline
    , pipelineMaybe
    , pipeline_
    ) where

import Control.Monad
import Network.Riak.Types.Internal
import Network.Riak.Connection.Internal
import Data.Binary.Put (runPut)
import qualified Network.Socket.ByteString.Lazy as L
import Control.Concurrent.Chan
import Control.Concurrent

pipe :: (Request req) => (Connection -> IO resp) -> Connection -> [req]
     -> IO [resp]
pipe recv conn@Connection{..} reqs = do
  ch <- newChan
  let numReqs = length reqs
  _ <- forkIO . replicateM_ numReqs $
       writeChan ch =<< recv conn
  L.sendAll connSock . runPut . mapM_ putRequest $ reqs
  replicateM numReqs $ readChan ch

pipeline :: (Exchange req resp) => Connection -> [req] -> IO [resp]
pipeline = pipe recvResponse

pipelineMaybe :: (Exchange req resp) => Connection -> [req] -> IO [Maybe resp]
pipelineMaybe = pipe recvMaybeResponse

pipeline_ :: (Request req) => Connection -> [req] -> IO ()
pipeline_ conn@Connection{..} reqs = do
  done <- newEmptyMVar
  _ <- forkIO $ do
         forM_ reqs (recvResponse_ conn . expectedResponse)
         putMVar done ()
  L.sendAll connSock . runPut . mapM_ putRequest $ reqs
  takeMVar done
