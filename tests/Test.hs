module Main where

import           Control.Exception            (finally)
import           Control.Monad                (forM_)
import           Data.IORef
import qualified Network.Riak.Basic           as B
import           Network.Riak.Connection.Pool (withConnection)
import           Network.Riak.Types
import qualified Properties
import           Test.Tasty
import           Test.Tasty.HUnit

main :: IO ()
main = defaultMain tests `finally` cleanup
  where
    cleanup = withConnection Properties.pool $ \c -> do
                bks <- readIORef Properties.cruft
                forM_ bks $ \(b,k) -> B.delete c b k Default

tests :: TestTree
tests = testGroup "Tests" [properties, integrationalTests]

properties :: TestTree
properties = testGroup "Properties" Properties.tests

integrationalTests :: TestTree
integrationalTests = testGroup "Integrational tests"
  [ ]
