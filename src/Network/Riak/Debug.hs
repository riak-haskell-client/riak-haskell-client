{-# LANGUAGE CPP, ScopedTypeVariables #-}

module Network.Riak.Debug
    (
      enabled
    , debug
    , setHandle
    ) where

import Control.Exception hiding (handle)
import Data.IORef
import System.Environment
import System.IO
import System.IO.Unsafe

enabled :: Bool
#ifdef DEBUG
enabled = unsafePerformIO $ do
          es <- try $ getEnv "RIAK_DEBUG"
          case es of
            Left (_::SomeException) -> return False
            Right s -> return (s == "1" || s == "on")
{-# NOINLINE enabled #-}
#else
enabled = False
{-# INLINE enabled #-}
#endif

#ifdef DEBUG
handle :: IORef Handle
handle = unsafePerformIO $ newIORef stderr
{-# NOINLINE handle #-}
#endif

setHandle :: Handle -> IO ()
#ifdef DEBUG
setHandle = writeIORef handle
#else
setHandle _ = return ()
{-# INLINE setHandle #-}
#endif

debug :: String -> String -> IO ()
#ifdef DEBUG
debug func str
    | not enabled = return ()
    | otherwise = do
  h <- readIORef handle
  hPutStrLn h $ func ++ ": " ++ str
#else
debug _ _ = return ()
{-# INLINE debug
#endif
