{-# LANGUAGE RecordWildCards #-}

module Network.Riak.Pipeline
    (
      pipeline
    , pipeline_
    ) where

import Control.Monad
import Network.Riak.Types.Internal
import Network.Riak.Connection.Internal
import Data.Binary.Put (runPut)
import qualified Network.Socket.ByteString.Lazy as L
import Control.Concurrent.Chan
import Control.Concurrent

pipeline :: (Request req, Response resp) => Connection -> [req] -> IO [resp]
pipeline conn@Connection{..} reqs = do
  ch <- newChan
  let numReqs = length reqs
  _ <- forkIO . replicateM_ numReqs $
       writeChan ch =<< recvResponse conn
  L.sendAll connSock . runPut . mapM_ putRequest $ reqs
  replicateM numReqs $ readChan ch

pipeline_ :: (Request req) => Connection -> [req] -> IO ()
pipeline_ conn@Connection{..} reqs = do
  done <- newEmptyMVar
  _ <- forkIO $ do
         forM_ reqs (recvResponse_ conn . expectedResponse)
         putMVar done ()
  L.sendAll connSock . runPut . mapM_ putRequest $ reqs
  takeMVar done
