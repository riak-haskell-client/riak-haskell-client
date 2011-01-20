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
    , getClientID
    , setClientID
    , getServerInfo
    , get
    , Network.Riak.put
    ) where

import qualified Data.ByteString.Char8 as B
import Control.Applicative
import Data.Binary hiding (get)
import Data.Binary.Put
import Control.Monad
import Network.Socket.ByteString.Lazy as L
import Network.Socket as Socket
import Network.Riakclient.RpbContent
import Network.Riakclient.RpbPutReq
import Network.Riakclient.RpbPutResp
import Network.Riakclient.RpbGetServerInfoResp
import Network.Riakextra.RpbPingReq
import Network.Riakextra.RpbGetClientIdReq
import Network.Riakextra.RpbGetServerInfoReq
import qualified Data.ByteString.Lazy.Char8 as L
import Numeric (showHex)
import System.Random
import Network.Riakclient.RpbGetReq as GetReq
import Network.Riakclient.RpbGetResp
import Network.Riakclient.RpbSetClientIdReq
import Network.Riakclient.RpbGetClientIdResp as GetClientIdResp
import Network.Riak.Message
import Network.Riak.Types as T
import Network.Riak.Types.Internal
import Text.ProtocolBuffers
import Data.IORef

defaultClient :: Client
defaultClient = Client {
                  host = "127.0.0.1"
                , port = "8087"
                , prefix = "riak"
                , mapReducePrefix = "mapred"
                , clientID = L.empty
                }

makeClientID :: IO ClientID
makeClientID = do
  r <- randomIO :: IO Int
  return . L.append "hs_" . L.pack . showHex (abs r) $ ""

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

ping :: Connection -> IO ()
ping conn@Connection{..} = do
  sendRequest conn RpbPingReq
  recvResponse_ conn PingResp

getClientID :: Connection -> ClientID -> IO ClientID
getClientID conn id = do
  sendRequest conn RpbGetClientIdReq
  GetClientIdResp.client_id <$> recvResponse conn

setClientID :: Connection -> ClientID -> IO ()
setClientID conn id = do
  sendRequest conn $ RpbSetClientIdReq id
  recvResponse_ conn SetClientIdResp

getServerInfo :: Connection -> IO ServerInfo
getServerInfo conn = do
  sendRequest conn RpbGetServerInfoReq
  recvResponse conn

get :: Connection -> T.Bucket -> T.Key -> Maybe R
    -> IO (Maybe (Seq Content, Maybe VClock))
get conn@Connection{..} bucket key r = do
  sendRequest conn RpbGetReq { bucket = bucket
                             , key = key
                             , r = fromQuorum <$> r }
  maybe Nothing cast <$> recvMaybeResponse conn
 where cast RpbGetResp{..} = Just (content, VClock <$> vclock)

put :: Connection -> T.Bucket -> T.Key -> Maybe T.VClock
    -> Content -> Maybe W -> Maybe DW -> Bool
    -> IO (Seq Content, Maybe VClock)
put conn@Connection{..} bucket key vclock content w dw returnBody = do
  sendRequest conn $ RpbPutReq bucket key (fromVClock <$> vclock) content
                     (fromQuorum <$> w) (fromQuorum <$> dw) (Just returnBody)
  RpbPutResp{..} <- recvResponse conn
  return (content, VClock <$> vclock)
