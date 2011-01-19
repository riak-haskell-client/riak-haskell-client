{-# LANGUAGE OverloadedStrings, RecordWildCards #-}

module Network.Riak
    (
      ClientID
    , Client(..)
    , Connection(connClient)
    , Network.Riak.connect
    , defaultClient
    , makeClientID
    , ping
    , get
    ) where

import qualified Data.ByteString.Char8 as B
import Data.Binary hiding (get)
import Data.Binary.Put
import Network.Socket.ByteString.Lazy as L
import Network.Socket as Socket
import qualified Data.ByteString.Lazy.Char8 as L
import Numeric (showHex)
import System.Random
import qualified Network.Riak.Message.Code as Code
import Network.Riakclient.RpbGetReq as GetReq
import Network.Riakclient.RpbGetResp
import Network.Riakclient.RpbSetClientIdReq
import Network.Riak.Message
import Network.Riak.Types as T
import Text.ProtocolBuffers
import Data.IORef

defaultClient :: Client
defaultClient = Client {
                  riakHost = "127.0.0.1"
                , riakPort = "8087"
                , riakPrefix = "riak"
                , riakMapReducePrefix = "mapred"
                , riakClientID = L.empty
                }

makeClientID :: IO ClientID
makeClientID = do
  r <- randomIO :: IO Int
  return . L.append "hs_" . L.pack . showHex (abs r) $ ""

addClientID :: Client -> IO Client
addClientID client
  | L.null (riakClientID client) = do
    i <- makeClientID
    return client { riakClientID = i }
  | otherwise = return client

connect :: Client -> IO Connection
connect cli0 = do
  client@Client{..} <- addClientID cli0
  let hints = defaultHints
  (ai:_) <- getAddrInfo (Just hints) (Just riakHost) (Just riakPort)
  sock <- socket (addrFamily ai) (addrSocketType ai) (addrProtocol ai)
  Socket.connect sock (addrAddress ai)
  buf <- newIORef L.empty
  let conn = Connection sock client buf
  setClientID conn riakClientID
  return conn

ping :: Connection -> IO ()
ping conn@Connection{..} = do
  L.sendAll connSock $ runPut putPingReq
  _ <- recvResponse conn
  return ()

get :: Connection -> T.Bucket -> T.Key -> Maybe Int -> IO (Maybe RpbGetResp)
get conn@Connection{..} bucket key r = do
  let req = RpbGetReq { bucket = bucket, key = key, r = fromIntegral `fmap` r }
  sendRequest conn req
  resp <- recvResponse conn
  case resp of
    Left msg | msg == Code.getResp -> return Nothing
    Right (GetResponse r) -> return (Just r)
    _             -> fail $  "get: invalid response" ++ show r

setClientID :: Connection -> ClientID -> IO ()
setClientID conn id = do
  let req = RpbSetClientIdReq { client_id = id }
  sendRequest conn req
  _ <- recvResponse conn
  return ()
