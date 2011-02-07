{-# LANGUAGE DeriveDataTypeable, NamedFieldPuns, RecordWildCards,
    ScopedTypeVariables #-}

-- |
-- Module:      Network.Riak.Connection.Pool
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Bryan O'Sullivan <bos@mailrank.com>
-- Stability:   experimental
-- Portability: portable
--
-- A high-performance striped pooling abstraction for managing
-- connections to a Riak cluster.
--
-- \"Striped\" means that a single 'Pool' consists of several
-- sub-pools, each managed independently.  A stripe size of 1 is fine
-- for many applications, and probably what you should choose by
-- default.  Larger stripe sizes will lead to reduced contention in
-- high-performance multicore applications, at a trade-off of causing
-- the maximum number of simultaneous connections to grow.
module Network.Riak.Connection.Pool
    (
      Pool
    , client
    , create
    , idleTime
    , maxConnections
    , numStripes
    , withConnection
    ) where

import Control.Applicative ((<$>))
import Control.Concurrent (forkIO, killThread, myThreadId, threadDelay)
import Control.Concurrent.STM
import Control.Exception (SomeException, catch, onException)
import Control.Monad (forM_, forever, join, liftM2, unless, when)
import Data.Hashable (hash)
import Data.List (partition)
import Data.Time.Clock (NominalDiffTime, UTCTime, diffUTCTime, getCurrentTime)
import Data.Typeable (Typeable)
import Network.Riak.Connection.Internal (connect, disconnect, makeClientID)
import Network.Riak.Debug (debug)
import Network.Riak.Types (Client(clientID), Connection)
import Prelude hiding (catch)
import System.Mem.Weak (addFinalizer)
import qualified Data.Vector as V

-- | A single connection pool entry.
data Entry = Entry {
      connection :: Connection
    , lastUse :: UTCTime
    -- ^ Time of last return.
    }

-- | A single striped pool.
data LocalPool = LocalPool {
      connected :: TVar Int
    -- ^ Count of open connections (both idle and in use).
    , entries :: TVar [Entry]
    -- ^ Idle entries.
    }

-- | A pool of connections to a Riak server.
--
-- This pool is \"striped\", i.e. it consists of several sub-pools
-- that are managed independently.
--
-- The total number of connections that can possibly be open at once
-- is 'maxConnections' * 'numStripes'.
data Pool = Pool {
      client :: Client
    -- ^ Client specification.  The client ID is ignored, and always
    -- regenerated automatically for each new connection.
    , numStripes :: Int
    -- ^ Stripe count.  The number of distinct sub-pools to maintain.
    -- The smallest acceptable value is 1.
    , idleTime :: NominalDiffTime
    -- ^ Amount of time for which an unused connection is kept open.
    -- The smallest acceptable value is 0.5 seconds.
    --
    -- The elapsed time before closing may be a little longer than
    -- requested, as the reaper thread wakes at 2-second intervals.
    , maxConnections :: Int
    -- ^ Maximum number of connections to keep open per stripe.  The
    -- smallest acceptable value is 1.
    -- 
    -- Requests for connections will block if this limit is reached on
    -- a single stripe, even if other stripes have idle connections
    -- available.
    , localPools :: V.Vector LocalPool
    -- ^ Per-capability connection pools.
    } deriving (Typeable)

instance Show Pool where
    show Pool{..} = "Pool { client = " ++ show client ++ ", " ++
                    "numStripes = " ++ show numStripes ++ ", " ++
                    "idleTime = " ++ show idleTime ++ ", " ++
                    "maxConnections = " ++ show maxConnections ++ "}"

instance Eq Pool where
    a == b = client a == client b && numStripes a == numStripes b &&
             idleTime a == idleTime b && maxConnections a == maxConnections b

-- | Create a new connection pool.
create :: Client
       -- ^ Client configuration.  The client ID is ignored, and
       -- always regenerated automatically for each new connection.
       -> Int
       -- ^ Stripe count.  The number of distinct sub-pools to
       -- maintain.  The smallest acceptable value is 1.
       -> NominalDiffTime
       -- ^ Amount of time for which an unused connection is kept
       -- open.  The smallest acceptable value is 0.5 seconds.
       --
       -- The elapsed time before closing may be a little longer than
       -- requested, as the reaper thread wakes at 2-second intervals.
       -> Int
       -- ^ Maximum number of connections to keep open per stripe.
       -- The smallest acceptable value is 1.
       -- 
       -- Requests for connections will block if this limit is reached
       -- on a single stripe, even if other stripes have idle
       -- connections available.
       -> IO Pool
create client numStripes idleTime maxConnections = do
  when (numStripes < 1) $
    modError "pool " $ "invalid stripe count " ++ show numStripes
  when (idleTime < 0.5) $
    modError "pool " $ "invalid idle time " ++ show idleTime
  when (maxConnections < 1) $
    modError "pool " $ "invalid maximum connection count " ++
                       show maxConnections
  localPools <- atomically . V.replicateM numStripes $
                liftM2 LocalPool (newTVar 0) (newTVar [])
  reaperId <- forkIO $ reaper idleTime localPools
  let p = Pool {
            client
          , numStripes
          , idleTime
          , maxConnections
          , localPools
          }
  addFinalizer p $ killThread reaperId
  return p

-- | Periodically go through all pools, closing any connections that
-- have been left idle for too long.
reaper :: NominalDiffTime -> V.Vector LocalPool -> IO ()
reaper idleTime pools = forever $ do
  threadDelay (2 * 1000000)
  now <- getCurrentTime
  let isStale Entry{..} = now `diffUTCTime` lastUse > idleTime
  V.forM_ pools $ \LocalPool{..} -> do
    conns <- atomically $ do
      (stale,fresh) <- partition isStale <$> readTVar entries
      unless (null stale) $ do
        writeTVar entries fresh
        modifyTVar_ connected (subtract (length stale))
      return (map connection stale)
    forM_ conns $ \conn -> do
      debug "reaper" "closing idle connection"
      disconnect conn `catch` \(_::SomeException) -> return ()
              
-- | Temporarily take a connection from a 'Pool', perform an action
-- with it, and return it to the pool afterwards.
--
-- * If the pool has a connection available, it is used
--   immediately.
--
-- * Otherwise, if the maximum number of connections has not been
--   reached, a new connection is created and used.
--
-- * If the maximum number of connections has been reached, this
--   function blocks until a connection becomes available, then that
--   connection is used.
--
-- If the action throws an exception of any type, the 'Connection' is
-- destroyed, and not returned to the pool.
--
-- It probably goes without saying that you should never call
-- 'disconnect' on a connection, as doing so will cause a subsequent
-- user, expecting the connection to be valid, to throw an exception.
withConnection :: Pool -> (Connection -> IO a) -> IO a
withConnection Pool{..} act = do
  i <- ((`mod` numStripes) . hash) <$> myThreadId
  let LocalPool{..} = localPools V.! i
  conn <- join . atomically $ do
    ents <- readTVar entries
    case ents of
      (Entry{..}:es) -> writeTVar entries es >> return (return connection)
      [] -> do
        inUse <- readTVar connected
        when (inUse == maxConnections) retry
        writeTVar connected $! inUse + 1
        return $ do
          cid <- makeClientID
          connect client { clientID = cid }
            `onException` atomically (modifyTVar_ connected (subtract 1))
  ret <- act conn `onException` do
           disconnect conn `catch` \(_::SomeException) -> return ()
           atomically (modifyTVar_ connected (subtract 1))
  now <- getCurrentTime
  atomically $ modifyTVar_ entries (Entry conn now:)
  return ret

modifyTVar_ :: TVar a -> (a -> a) -> STM ()
modifyTVar_ v f = readTVar v >>= \a -> writeTVar v $! f a

modError :: String -> String -> a
modError func msg =
    error $ "Network.Riak.Connection.Pool." ++ func ++ ": " ++ msg
