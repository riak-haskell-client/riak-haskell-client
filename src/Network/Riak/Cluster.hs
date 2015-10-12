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

import           Control.Exception
import           Control.Exception.Enclosed
import           Control.Monad.Catch           (MonadThrow (..))
import           Control.Monad.Trans.Control   (MonadBaseControl)
import           Data.Typeable
import           Data.Vector                   (Vector)
import qualified Data.Vector                   as V
import           Network.Riak                  (Connection)
import qualified Network.Riak                  as Riak
import qualified Network.Riak.Connection.Pool  as Riak
import           System.Random.Mersenne.Pure64
import           System.Random.Shuffle         (shuffle')

-- | Datatype holding connection-pool with all known cluster nodes
data Cluster = Cluster
    { clusterPools :: Vector Riak.Pool
      -- ^ Vector of connection pools to riak cluster nodes
    , clusterGen   :: PureMT
    }
    deriving (Show)

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
    mt <- newPureMT
    return (Cluster (V.fromList pools) mt)

-- | Tries to run some operation for a random riak node. If it fails,
-- tries all other nodes. If all other nodes fail - throws
-- 'InClusterError' exception.
inCluster :: (MonadThrow m, MonadBaseControl IO m)
          => Cluster -> (Connection -> m a) -> m a
inCluster rc f = do
    let pools = shuffle' (V.toList (clusterPools rc))
                         (V.length (clusterPools rc))
                         (clusterGen rc)
    go pools []
  where
    go [] errors = throwM (InClusterError errors)
    go (p:ps) es = Riak.withConnectionM p $ \c -> do
        er <- tryAny (f c)
        either (\err -> go ps (err:es))
               return er
