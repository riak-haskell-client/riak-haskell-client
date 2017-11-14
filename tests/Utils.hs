{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE LambdaCase         #-}
{-# LANGUAGE TemplateHaskell    #-}
{-# LANGUAGE CPP #-}
module Utils
  ( globalAdmin
  , globalHost
  , globalHttpPort
  , shell
  , withGlobalConn
  , ShellFailure(..)
  ) where

#if __GLASGOW_HASKELL__ < 710
import Control.Applicative
#endif
import Control.Exception
import Control.Monad
import Data.Typeable
import Data.Yaml.TH (decodeFile)
import Internal
import System.Exit
import System.IO.Unsafe (unsafePerformIO)
import System.Timeout

import qualified Network.Riak as Riak
import qualified Network.Riak.Basic as B
import Network.Riak.Connection.Pool (Pool, create, withConnection)

import qualified System.Process as Process

config :: Config
config = $$(decodeFile "tests/test.yaml")

-- | The global riak-admin string, configured in test.yaml.
globalAdmin :: String
globalAdmin = configAdmin config

globalHost :: String
globalHost = configHost config

globalHttpPort :: Int
globalHttpPort = configHttpPort config

-- | Run action in some Riak connection
withGlobalConn :: (B.Connection -> IO a) -> IO a
withGlobalConn = withConnection pool

-- | The global riak pool that all tests share.
pool :: Pool
pool = unsafePerformIO (create client 1 1 1)
 where
  client = Riak.defaultClient
    { Riak.host = globalHost
    , Riak.port = show (configProtoPort config)
    }
{-# NOINLINE pool #-}

data ShellFailure
  = ShellFailure Int String
  | ShellTimeout String
  deriving (Show, Typeable)

instance Exception ShellFailure

-- | Run a shell command (inheriting stdin, stdout, and stderr), and throw an
-- exception if it fails. Time out after 30 seconds.
shell :: String -> IO ()
shell s =
  timeout (30*1000*1000) act >>= \case
    Nothing -> throw (ShellTimeout s)
    _       -> pure ()
  where
    act :: IO ()
    act =
      bracketOnError
        (do
          (_, _, _, h) <- Process.createProcess (Process.shell s)
          pure h)
        Process.terminateProcess
        (Process.waitForProcess >=> \case
          ExitSuccess -> pure ()
          ExitFailure n -> throw (ShellFailure n s))
