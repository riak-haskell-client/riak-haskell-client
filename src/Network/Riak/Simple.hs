{-# LANGUAGE OverloadedStrings, RecordWildCards #-}

module Network.Riak.Simple
    (
    -- * Connection management
      ping
    , getClientID
    , setClientID
    , getServerInfo
    -- * Data management
    , get
    , put
    , put_
    , delete
    -- * Metadata
    , listBuckets
    , foldKeys
    , getBucket
    , setBucket
    -- * Map/reduce
    , mapReduce
    ) where

import Control.Applicative ((<$>))
import qualified Data.Foldable as F
import qualified Data.Sequence as Seq
import Network.Riak.Connection.Internal
import Network.Riak.Protocol.BucketProps
import Network.Riak.Protocol.Content
import Network.Riak.Protocol.ListKeysResponse
import Network.Riak.Protocol.MapReduce
import Network.Riak.Protocol.ServerInfo
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Network.Riak.Types.Internal as T
import qualified Network.Riak.Request as Req
import qualified Network.Riak.Response as Resp

ping :: Connection -> IO ()
ping conn = exchange_ conn Req.ping

getClientID :: Connection -> IO ClientID
getClientID conn = Resp.getClientID <$> exchange conn Req.getClientID

getServerInfo :: Connection -> IO ServerInfo
getServerInfo conn = exchange conn Req.getServerInfo

get :: Connection -> T.Bucket -> T.Key -> R
    -> IO (Seq.Seq Content, Maybe VClock)
get conn bucket key r =
  Resp.get <$> exchangeMaybe conn (Req.get bucket key r)

put :: Connection -> T.Bucket -> T.Key -> Maybe T.VClock
    -> Content -> W -> DW
    -> IO (Seq.Seq Content, Maybe VClock)
put conn bucket key mvclock cont w dw =
  Resp.put <$> exchange conn (Req.put bucket key mvclock cont w dw True)

put_ :: Connection -> T.Bucket -> T.Key -> Maybe T.VClock
     -> Content -> W -> DW
     -> IO ()
put_ conn bucket key mvclock cont w dw =
  exchange_ conn (Req.put bucket key mvclock cont w dw False)

delete :: Connection -> T.Bucket -> T.Key -> RW -> IO ()
delete conn bucket key rw = exchange_ conn $ Req.delete bucket key rw

listBuckets :: Connection -> IO (Seq.Seq T.Bucket)
listBuckets conn = Resp.listBuckets <$> exchange conn Req.listBuckets

foldKeys :: Connection -> T.Bucket -> (a -> Key -> IO a) -> a -> IO a
foldKeys conn bucket f z0 = do
  sendRequest conn $ Req.listKeys bucket
  let loop z = do
        ListKeysResponse{..} <- recvResponse conn
        z1 <- F.foldlM f z keys
        if maybe False id done
          then return z1
          else loop z1
  loop z0

getBucket :: Connection -> T.Bucket -> IO BucketProps
getBucket conn bucket = Resp.getBucket <$> exchange conn (Req.getBucket bucket)

setBucket :: Connection -> T.Bucket -> BucketProps -> IO ()
setBucket conn bucket props = exchange_ conn $ Req.setBucket bucket props

mapReduce :: Connection -> Job -> IO MapReduce
mapReduce conn = exchange conn . Req.mapReduce
