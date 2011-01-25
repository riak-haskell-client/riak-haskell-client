{-# LANGUAGE CPP, ScopedTypeVariables #-}

module Network.Riak.Debug
    (
      level
    , debug
    , setHandle
    , showM
    ) where

import Control.Exception hiding (handle)
import Data.IORef (IORef, newIORef, readIORef, writeIORef)
import Network.Riak.Types.Internal
import System.Environment (getEnv)
import System.IO (Handle, hPutStrLn, stderr)
import System.IO.Unsafe (unsafePerformIO)

level :: Int
#ifdef DEBUG
level = unsafePerformIO $ do
          es <- try $ getEnv "RIAK_DEBUG"
          case es of
            Left (_::SomeException)   -> return 0
            Right "on" -> return 1
            Right s    -> case reads s of
                            ((n,_):_) -> return n
                            _         -> return 1
{-# NOINLINE level #-}
#else
level = 0
{-# INLINE level #-}
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
    | level == 0 = return ()
    | otherwise  = do
  h <- readIORef handle
  hPutStrLn h $ str ++ " [" ++ func ++ "]"
#else
debug _ _ = return ()
{-# INLINE debug #-}
#endif

showM :: (Show a, Tagged a) => a -> String
showM m | level > 1 = show m
        | otherwise = show (messageTag m)
