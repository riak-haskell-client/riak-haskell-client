{-# LANGUAGE OverloadedStrings, RecordWildCards #-}

module Network.Riak.Connection.Internal
    (
    -- * Connection management
      Network.Riak.Connection.Internal.connect
    , disconnect
    , setClientID
    -- * Client configuration
    , defaultClient
    , makeClientID
    -- * Requests and responses
    -- ** Sending and receiving requests and responses
    , sendRequest
    , recvResponse
    , recvMaybeResponse
    , recvResponse_
    , exchange
    , exchangeMaybe
    , exchange_
    -- ** Composing and parsing requests and responses
    , putRequest
    , getResponse
    -- * ByteString receive operations
    , recvExactly
    , recvGet
    , recvGetN
    ) where

import Control.Monad (unless, when)
import Data.Binary.Put (Put, putWord32be, runPut)
import Data.IORef (modifyIORef, newIORef, readIORef, writeIORef)
import Data.Int (Int64)
import Network.Riak.Protocol.SetClientIDRequest
import Network.Riak.Tag (getTag, putTag)
import Network.Riak.Types.Internal hiding (MessageTag(..))
import Network.Socket as Socket
import qualified Network.Socket.ByteString as B
import qualified Network.Socket.ByteString.Lazy as L
import Numeric (showHex)
import System.Random (randomIO)
import Text.ProtocolBuffers (messageGetM, messagePutM, messageSize)
import Text.ProtocolBuffers.Get (Get, Result(..), getWord32be, runGet)
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy.Char8 as L
import qualified Network.Riak.Types.Internal as T

defaultClient :: Client
defaultClient = Client {
                  host = "127.0.0.1"
                , port = "8087"
                , prefix = "riak"
                , mapReducePrefix = "mapred"
                , clientID = L.empty
                }

-- | Tell the server our client ID.
setClientID :: Connection -> ClientID -> IO ()
setClientID conn i = do
  sendRequest conn $ SetClientIDRequest i
  recvResponse_ conn T.SetClientIDResponse

-- | Generate a random client ID.
makeClientID :: IO ClientID
makeClientID = do
  r <- randomIO :: IO Int
  return . L.append "hs_" . L.pack . showHex (abs r) $ ""

-- | Add a random 'ClientID' to a 'Client' if the 'Client' doesn't
-- already have one.
addClientID :: Client -> IO Client
addClientID client
  | L.null (clientID client) = do
    i <- makeClientID
    return client { clientID = i }
  | otherwise = return client

connect :: Client -> IO Connection
connect cli0 = do
  client@Client{..} <- addClientID cli0
  let hints = defaultHints
  (ai:_) <- getAddrInfo (Just hints) (Just host) (Just port)
  sock <- socket (addrFamily ai) (addrSocketType ai) (addrProtocol ai)
  Socket.connect sock (addrAddress ai)
  buf <- newIORef L.empty
  let conn = Connection sock client buf
  setClientID conn clientID
  return conn

disconnect :: Connection -> IO ()
disconnect Connection{..} = do
  sClose connSock
  writeIORef connBuffer L.empty

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
recvExactly = recvWith $ \_ ->
              moduleError "recvExactly" "short read from network"

recvGet :: Connection -> Get a -> IO a
recvGet Connection{..} get = do
  let refill = do
        bs <- L.recv connSock 16384
        if L.null bs
          then shutdown connSock ShutdownReceive >> return Nothing
          else return (Just bs)
      step (Failed _ err)    = moduleError "recvGet" err
      step (Finished bs _ r) = writeIORef connBuffer bs >> return r
      step (Partial k)       = (step . k) =<< refill
  mbs <- do
    buf <- readIORef connBuffer
    if L.null buf
      then refill
      else return (Just buf)
  case mbs of
    Just bs -> step $ runGet get bs
    Nothing -> moduleError "recvGet" "socket closed"
  
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
                      Failed _ err -> moduleError "recvGetN" err
                      Partial _    -> moduleError "recvGetN"
                                      "parser wants more input!?"
    Failed _ err -> moduleError "recvGetN" err

putRequest :: (Request req) => req -> Put
putRequest req = do
  putWord32be (fromIntegral (1 + messageSize req))
  putTag (messageTag req)
  messagePutM req

getResponse :: (Response a) => T.MessageTag -> Get (Either String a)
getResponse expected = do
  tag <- getTag
  if tag == expected
    then Right `fmap` messageGetM
    else return . Left $ "received unexpected response: expected " ++
                         show expected ++ ", received " ++ show tag

exchange :: Exchange req resp => Connection -> req -> IO resp
exchange conn@Connection{..} req = do
  sendRequest conn req
  recvResponse conn

exchangeMaybe :: Exchange req resp => Connection -> req -> IO (Maybe resp)
exchangeMaybe conn@Connection{..} req = do
  sendRequest conn req
  recvMaybeResponse conn

exchange_ :: Request req => Connection -> req -> IO ()
exchange_ conn req = do
  sendRequest conn req
  recvResponse_ conn (expectedResponse req)

sendRequest :: (Request req) => Connection -> req -> IO ()
sendRequest Connection{..} = L.sendAll connSock . runPut . putRequest

recvResponse :: (Response a) => Connection -> IO a
recvResponse conn = go undefined where
  go :: Response b => b -> IO b
  go dummy = do
    len <- fromIntegral `fmap` recvGet conn getWord32be
    r <- recvGetN conn len (getResponse (messageTag dummy))
    case r of
      Left err  -> moduleError "recvResponse" err
      Right ret -> return ret

recvResponse_ :: Connection -> T.MessageTag -> IO ()
recvResponse_ conn expected = do
  len <- fromIntegral `fmap` recvGet conn getWord32be
  tag <- recvGet conn getTag
  when (tag /= expected) .
    moduleError "recvResponse_" $ "received unexpected response: expected " ++
                                  show expected ++ ", received " ++ show tag
  recvExactly conn (len-1) >> return ()

recvMaybeResponse :: (Response a) => Connection -> IO (Maybe a)
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
          Left err  -> moduleError "recvMaybeResponse" err
          Right ret -> return (Just ret)

moduleError :: String -> String -> a
moduleError = riakError "Network.Riak.Connection.Internal"
