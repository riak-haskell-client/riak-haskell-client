-- |   module:    Network.Riak.CRDT.Riak
--     copyright: (c) 2016 Sentenai
--     author:    Antonio Nikishaev <me@lelf.lu>
--     license:   Apache
-- 
-- CRDT operations
module Network.Riak.CRDT.Riak where

import qualified Network.Riak.Connection as Conn
import Network.Riak.Types
import Network.Riak.Protocol.DtOp as PB
import Network.Riak.Protocol.CounterOp as PB
import qualified Network.Riak.CRDT.Types as CRDT
import Data.Int
import Control.Applicative

import qualified Network.Riak.CRDT.Request as Req
import qualified Network.Riak.CRDT.Response as Resp


counterSendUpdate :: Connection -> BucketType -> Bucket -> Key
                  -> [CRDT.CounterOp] -> IO ()
counterSendUpdate conn t b k ops = Conn.exchange_ conn (Req.counterUpdate ops t b k)


setSendUpdate :: Connection -> BucketType -> Bucket -> Key
              -> [CRDT.SetOp] -> IO ()
setSendUpdate conn t b k ops = Conn.exchange_ conn (Req.setUpdate ops t b k)


mapSendUpdate :: Connection -> BucketType -> Bucket -> Key
              -> [CRDT.MapOp] -> IO ()
mapSendUpdate conn t b k ops = Conn.exchange_ conn (Req.mapUpdate ops t b k)


get :: Connection -> BucketType -> Bucket -> Key
    -> IO (Maybe CRDT.DataType)
get conn t b k = Resp.get <$> Conn.exchange conn (Req.get t b k)
