module Common (withSomeConnection) where

import qualified Network.Riak.Basic as B
import Network.Riak.Connection.Pool (Pool, create, withConnection)
import Network.Riak.Connection (defaultClient)
import System.IO.Unsafe (unsafePerformIO)


pool :: Pool
{-# NOINLINE pool #-}
pool = unsafePerformIO $
       create defaultClient 1 1 1

-- | run action in some riak connection
withSomeConnection :: (B.Connection -> IO a) -> IO a
withSomeConnection = withConnection pool

