{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE LambdaCase         #-}

module Utils where

import Control.Applicative
import Control.Exception
import Control.Monad
import Data.Typeable
import System.Exit
import System.Timeout

import qualified System.Process as Process


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
