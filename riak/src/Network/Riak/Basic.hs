{-# LANGUAGE BangPatterns      #-}
{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

-- |
-- Module:      Network.Riak.Basic
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
-- Stability:   experimental
-- Portability: portable
--
-- Basic support for the Riak decentralized data store.
--
-- When storing and retrieving data, the functions in this module do
-- not perform any encoding or decoding of data, nor do they resolve
-- conflicts.

module Network.Riak.Basic
    (
    -- * Client configuration and identification
      ClientID
    , Client(..)
    , defaultClient
    -- * Connection management
    , Connection(..)
    , connect
    , disconnect
    , ping
    , getClientID
    , setClientID
    , getServerInfo
    -- * Data management
    , Quorum(..)
    , get
    , put
    , put_
    , delete
    -- * Metadata
    , listBuckets
    , foldKeys
    , getBucket
    , setBucket
    , getBucketType
    -- * Map/reduce
    , mapReduce
    ) where

#if __GLASGOW_HASKELL__ < 710
import           Control.Applicative                    ((<$>))
#endif
import           Control.Monad.IO.Class
import           Network.Riak.Connection.Internal
import           Network.Riak.Escape (unescape)
import           Network.Riak.Lens
import           Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Data.Foldable as F
import qualified Data.Riak.Proto as Proto
import qualified Network.Riak.Request as Req
import qualified Network.Riak.Response as Resp
import qualified Network.Riak.Types.Internal as T

-- | Check to see if the connection to the server is alive.
ping :: Connection -> IO ()
ping conn = exchange_ conn Req.ping

-- | Find out from the server what client ID this connection is using.
getClientID :: Connection -> IO ClientID
getClientID conn = Resp.getClientID <$> exchange conn Req.getClientID

-- | Retrieve information about the server.
getServerInfo :: Connection -> IO Proto.RpbGetServerInfoResp
getServerInfo conn = exchange conn Req.getServerInfo

-- | Retrieve a value.  This may return multiple conflicting siblings.
-- Choosing among them is your responsibility.
get :: Connection -> Maybe T.BucketType -> T.Bucket -> T.Key -> R
    -> IO (Maybe ([Proto.RpbContent], VClock))
get conn btype bucket key r = Resp.get <$> exchangeMaybe conn (Req.get btype bucket key r)

-- | Store a single value.  This may return multiple conflicting
-- siblings.  Choosing among them, and storing a new value, is your
-- responsibility.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored.
put :: Connection -> Maybe T.BucketType -> T.Bucket -> T.Key -> Maybe T.VClock
    -> Proto.RpbContent -> W -> DW
    -> IO ([Proto.RpbContent], VClock)
put conn btype bucket key mvclock cont w dw =
  Resp.put <$> exchange conn (Req.put btype bucket key mvclock cont w dw True)

-- | Store a single value, without the possibility of conflict
-- resolution.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored, and you will not be notified.
put_ :: Connection -> Maybe T.BucketType -> T.Bucket -> T.Key -> Maybe T.VClock
     -> Proto.RpbContent -> W -> DW
     -> IO ()
put_ conn btype bucket key mvclock cont w dw =
  exchange_ conn (Req.put btype bucket key mvclock cont w dw False)

-- | Delete a value.
delete :: Connection -> Maybe T.BucketType -> T.Bucket -> T.Key -> RW -> IO ()
delete conn btype bucket key rw = exchange_ conn $ Req.delete btype bucket key rw

-- | List the buckets in the cluster.
--
-- /Note/: this operation is expensive.  Do not use it in production.
listBuckets :: Connection -> Maybe BucketType -> IO [T.Bucket]
listBuckets conn btype = Resp.listBuckets <$> exchange conn (Req.listBuckets btype)

-- | Fold over the keys in a bucket.
--
-- /Note/: this operation is expensive.  Do not use it in production.
foldKeys :: (MonadIO m) => Connection -> Maybe BucketType -> Bucket
         -> (a -> Key -> m a) -> a -> m a
foldKeys conn btype bucket f z0 = do
  liftIO $ sendRequest conn $ Req.listKeys btype bucket
  let g z = f z . unescape
      loop z = do
        response <- liftIO $ (recvResponse conn :: IO Proto.RpbListKeysResp)
        z1 <- F.foldlM g z (response ^. Proto.keys)
        if response ^. Proto.done
          then return z1
          else loop z1
  loop z0

-- | Retrieve the properties of a bucket.
getBucket :: Connection -> Maybe BucketType -> Bucket -> IO Proto.RpbBucketProps
getBucket conn btype bucket = Resp.getBucket <$> exchange conn (Req.getBucket btype bucket)

-- | Store new properties for a bucket.
setBucket :: Connection -> Maybe BucketType -> Bucket -> Proto.RpbBucketProps -> IO ()
setBucket conn btype bucket props = exchange_ conn $ Req.setBucket btype bucket props

-- | Gets the bucket properties associated with a bucket type.
getBucketType :: Connection -> T.BucketType -> IO Proto.RpbBucketProps
getBucketType conn btype = Resp.getBucket <$> exchange conn (Req.getBucketType btype)

-- | Run a 'MapReduce' job.  Its result is consumed via a strict left
-- fold.
mapReduce :: Connection -> Job -> (a -> Proto.RpbMapRedResp -> a) -> a -> IO a
mapReduce conn job f z0 = loop z0 =<< (exchange conn . Req.mapReduce $ job)
  where
    loop z mr = do
      let !z' = f z mr
      if mr ^. Proto.done
        then return z'
        else loop z' =<< recvResponse conn
