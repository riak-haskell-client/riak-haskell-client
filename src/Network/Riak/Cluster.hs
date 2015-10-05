{-# LANGUAGE DeriveDataTypeable    #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Network.Riak.Cluster where

import           Control.Exception
import           Control.Exception.Enclosed
import           Control.Monad.Catch           (MonadThrow (..))
import           Control.Monad.Trans.Control   (MonadBaseControl)
import           Data.Typeable
import           Data.Vector                   (Vector)
import qualified Data.Vector                   as V
import           Network.Riak                  (Connection)
import qualified Network.Riak.Connection.Pool  as Riak
import           System.Random.Mersenne.Pure64
import           System.Random.Shuffle         (shuffle')

-- | Datatype holding connection-pool with all known cluster nodes
data RiakCluster = RiakCluster
    { clusterPools :: Vector Riak.Pool
      -- ^ Vector of connection pools to riak cluster nodes
    , clusterGen   :: PureMT
    }
    deriving (Show)

-- | Error that gets thrown whenever operation couldn't succeed with
-- any node.
data RiakInClusterError = RiakInClusterError [SomeException]
    deriving (Show, Typeable)
instance Exception RiakInClusterError

connectToRiakCluster :: [Riak.Pool] -> IO RiakCluster
connectToRiakCluster pools = do
    mt <- newPureMT
    return (RiakCluster (V.fromList pools) mt)

-- | Tries to run some operation for a random riak node. If it fails,
-- tries all other nodes. If all other nodes fail - throws
-- 'RiakInClusterError' exception.
inCluster :: (MonadThrow m, MonadBaseControl IO m)
          => RiakCluster -> (Connection -> m a) -> m a
inCluster rc f = do
    let pools = shuffle' (V.toList (clusterPools rc))
                         (V.length (clusterPools rc))
                         (clusterGen rc)
    go pools []
  where
    go [] errors = throwM (RiakInClusterError errors)
    go (p:ps) es = Riak.withConnectionM p $ \c -> do
        er <- tryAny (f c)
        either (\err -> go ps (err:es))
               return er
