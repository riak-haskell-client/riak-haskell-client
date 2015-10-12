{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Control.Exception            (finally)
import           Control.Monad                (forM_)
import           Data.IORef
import qualified Data.Map                     as M
import           Data.Text                    (Text)
import qualified Network.Riak                 as Riak
import qualified Network.Riak.Basic           as B
import qualified Network.Riak.Cluster         as Riak
import           Network.Riak.Connection.Pool (withConnection)
import qualified Network.Riak.JSON            as J
import           Network.Riak.Resolvable      (ResolvableMonoid (..))
import qualified Network.Riak.Simple          as S
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
  [ testClusterSimple
  -- , testSimpleApi1
#ifdef TEST2I
  , testIndexedPutGet
#endif
  ]

testClusterSimple :: TestTree
testClusterSimple = testCase "testClusterSimple" $ do
    rc <- Riak.connectToCluster [Riak.defaultClient]
    Riak.inCluster rc B.ping


testIndexedPutGet :: TestTree
testIndexedPutGet = testCase "testIndexedPutGet" $ do
    rc <- Riak.connectToCluster [Riak.defaultClient]
    let b = "riak-haskell-client-test"
        k = "test"
    keys <- Riak.inCluster rc $ \c -> do
      _ <- J.putIndexed c b k [(IndexInt "someindex" 135)] Nothing
          (RM (M.fromList [("somekey", "someval")] :: M.Map Text Text))
          Default Default
      Riak.getByIndex c b (IndexQueryExactInt "someindex" 135)
    assertEqual "" ["test"] keys
