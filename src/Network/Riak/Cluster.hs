{-# LANGUAGE DeriveDataTypeable    #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Network.Riak.Cluster
    ( Cluster(..)
    , InClusterError(..)
    , connectToCluster
    , inCluster
    , Riak.create
    , Riak.defaultClient
    ) where

import           Control.Concurrent.STM        (atomically)
import           Control.Concurrent.STM.TMVar
import           Control.Exception
import           Control.Exception.Enclosed
import           Control.Monad.Base            (liftBase)
import           Control.Monad.Catch           (MonadThrow (..))
import           Control.Monad.Trans.Control   (MonadBaseControl)
import           Data.Typeable
import           Network.Riak                  (Connection)
import qualified Network.Riak                  as Riak
import qualified Network.Riak.Connection.Pool  as Riak
import           System.Random.Mersenne.Pure64

-- | Datatype holding connection-pool with all known cluster nodes
data Cluster = Cluster
    { clusterPools :: [Riak.Pool]
      -- ^ Vector of connection pools to riak cluster nodes
    , clusterGen   :: TMVar PureMT
    }

-- | Error that gets thrown whenever operation couldn't succeed with
-- any node.
data InClusterError = InClusterError [SomeException]
    deriving (Show, Typeable)
instance Exception InClusterError

-- | Function to connect to riak cluster with sane pool defaults
connectToCluster :: [Riak.Client] -> IO Cluster
connectToCluster clients = do
    pools <- mapM (\c -> Riak.create c 1 10 20) clients
    connectToClusterWithPools pools

-- | Function to connect to riak cluster with pre-created list of
-- 'Riak.Pool' objects
connectToClusterWithPools :: [Riak.Pool] -> IO Cluster
connectToClusterWithPools pools = do
    gen <- newPureMT
    mt <- atomically (newTMVar gen)
    return (Cluster pools mt)

-- | Tries to run some operation for a random riak node. If it fails,
-- tries all other nodes. If all other nodes fail - throws
-- 'InClusterError' exception.
inCluster :: (MonadThrow m, MonadBaseControl IO m)
          => Cluster -> (Connection -> m a) -> m a
inCluster Cluster{clusterPools=pools, clusterGen=tMT} f = do
    rnd <- liftBase $ atomically $ do
      mt <- takeTMVar tMT
      let (i, mt') = randomInt mt
      putTMVar tMT mt'
      return i
    let n = if null pools then 0 else rnd `mod` length pools
        -- we rotate pool vector by n
        pools' = rotateL n pools
    go pools' []
  where
    go [] errors = throwM (InClusterError errors)
    go (p:ps) es =
        catchAny (Riak.withConnectionM p f) (\e -> go ps (e:es))

rotateL :: Int -> [a] -> [a]
rotateL i xs = right ++ left
  where
    (left, right) = splitAt i xs
