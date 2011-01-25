{-# LANGUAGE OverloadedStrings, RecordWildCards, ScopedTypeVariables #-}

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
    , exchange
    , exchangeMaybe
    , exchange_
    -- ** Pipelining many requests
    , pipeline
    , pipelineMaybe
    , pipeline_
    -- * Low-level protocol operations
    -- ** Sending and receiving
    , sendRequest
    , recvResponse
    , recvMaybeResponse
    , recvResponse_
    ) where

import Control.Concurrent
import Control.Exception (IOException)
import Control.Monad (forM_, replicateM, replicateM_, unless, when)
import Data.Binary.Put (Put, putWord32be, runPut)
import Data.IORef (modifyIORef, newIORef, readIORef, writeIORef)
import Data.Int (Int64)
import Network.Riak.Debug (debug)
import Network.Riak.Protocol.SetClientIDRequest
import Network.Riak.Tag (getTag, putTag)
import Network.Riak.Types.Internal hiding (MessageTag(..))
import Network.Socket as Socket
import Numeric (showHex)
import System.Random (randomIO)
import Text.ProtocolBuffers (messageGetM, messagePutM, messageSize)
import Text.ProtocolBuffers.Get (Get, Result(..), getWord32be, runGet)
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy.Char8 as L
import qualified Network.Riak.Types.Internal as T
import qualified Network.Socket.ByteString as B
import qualified Network.Socket.ByteString.Lazy as L

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
  let hints = defaultHints {
                addrFlags = [AI_ADDRCONFIG]
              , addrSocketType = Stream
              }
  debug "connect" $ "server " ++ host ++ ":" ++ port ++ ", client ID " ++
                    L.unpack clientID
  ais <- getAddrInfo (Just hints) (Just host) (Just port)
  let ai = case ais of
             (a:_) -> a
             _     -> moduleError "connect" $
                      "could not look up server " ++ host ++ ":" ++ port
  onIOException "connect" $ do
    sock <- socket (addrFamily ai) (addrSocketType ai) (addrProtocol ai)
    Socket.connect sock (addrAddress ai)
    buf <- newIORef L.empty
    let conn = Connection sock client buf
    setClientID conn clientID
    return conn

disconnect :: Connection -> IO ()
disconnect Connection{..} = onIOException "disconnect" $ do
  debug "disconnect" $ "server " ++ host connClient ++ ":" ++ port connClient ++
                       ", client ID " ++ L.unpack (clientID connClient)
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
  let tag = show (messageTag req)
  debug "exchange" $ "sending " ++ tag
  onIOException ("exchange " ++ tag) $ do
    sendRequest conn req
    recvResponse conn

exchangeMaybe :: Exchange req resp => Connection -> req -> IO (Maybe resp)
exchangeMaybe conn@Connection{..} req = do
  let tag = show (messageTag req)
  debug "exchangeMaybe" $ "sending " ++ tag
  onIOException ("exchangeMaybe " ++ tag) $ do
    sendRequest conn req
    recvMaybeResponse conn

exchange_ :: Request req => Connection -> req -> IO ()
exchange_ conn req = do
  let tag = show (messageTag req)
  debug "exchange_" $ "sending " ++ tag
  onIOException ("exchange_ " ++ tag) $ do
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

pipe :: (Request req) => (Connection -> IO resp) -> Connection -> [req]
     -> IO [resp]
pipe receive conn@Connection{..} reqs = do
  ch <- newChan
  let numReqs = length reqs
  _ <- forkIO . replicateM_ numReqs $ writeChan ch =<< receive conn
  let tag = show (messageTag (head reqs))
  debug "pipe" $ "sending " ++ show numReqs ++ " " ++ tag
  onIOException ("pipe " ++ tag) .
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

onIOException :: String -> IO a -> IO a
onIOException func act =
    act `catch` \(e::IOException) -> do
      let s = show e
      debug func $ "caught IO exception: " ++ s
      moduleError func s

moduleError :: String -> String -> a
moduleError = riakError "Network.Riak.Connection.Internal"
