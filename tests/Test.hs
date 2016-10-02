{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ParallelListComp  #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import           Common
import qualified CRDTProperties as CRDT
import           Network.Riak.DSL (Riak, rollback)
import qualified Network.Riak.DSL.Basic as Basic
import qualified Network.Riak.DSL.JSON as J
import qualified Network.Riak.DSL.Value as V
import qualified Properties

import           Control.Monad
#if __GLASGOW_HASKELL__ <= 708
import           Control.Applicative
#endif
import qualified Data.Map as M
import qualified Data.Set as S
import qualified Data.Sequence as Seq
import           Data.List.NonEmpty (NonEmpty(..))
import           Data.Foldable (toList)
import           Data.Semigroup
import           Data.Text (Text)
import           Control.Concurrent (threadDelay)
import           Control.Exception
import qualified Network.Riak as Riak
import qualified Network.Riak.Basic as B
import qualified Network.Riak.Content as B (binary,Content,value)
import qualified Network.Riak.CRDT as C
import qualified Network.Riak.CRDT.Riak as C
import qualified Network.Riak.Search as S
import qualified Network.Riak.Cluster as Riak
import           Network.Riak.Resolvable (ResolvableMonoid (..))
import           Network.Riak.Types hiding (key)
import qualified Network.Riak.Protocol.ErrorResponse as ER
import           Test.Tasty
import           Test.Tasty.HUnit

main :: IO ()
main = defaultMain tests


tests :: TestTree
tests = testGroup "Tests" [properties,
                           integrationalTests,
                           ping'o'death,
                           exceptions,
                           crdts,
                           searches,
                           bucketTypes
                          ]
properties :: TestTree
properties = testGroup "simple properties" Properties.tests

integrationalTests :: TestTree
integrationalTests = testGroup "integrational tests"
  [ testClusterSimple
#ifdef TEST2I
  , testIndexedPutGet
#endif
  ]

crdts :: TestTree
crdts = testGroup "CRDT" [
         testGroup "simple" [counter, set, map_],
         CRDT.tests
        ]

searches :: TestTree
searches = testGroup "Search" [
            search,
            getIndex
           ]

testClusterSimple :: TestTree
testClusterSimple = testCase "testClusterSimple" $ do
    rc <- Riak.connectToCluster [Riak.defaultClient]
    Riak.inCluster rc B.ping


testIndexedPutGet :: TestTree
testIndexedPutGet = testCase "testIndexedPutGet" $ do
    rc <- Riak.connectToCluster [Riak.defaultClient]
    let bt = Nothing
        b = "riak-haskell-client-test"
        k = "test"
    keys <- Riak.inCluster rc $ \c -> rollback c $ do
      _ <- J.putIndexed bt b k [(IndexInt "someindex" 135)] Nothing
            (RM (M.fromList [("somekey", "someval")] :: M.Map Text Text))
            Default Default
      V.getByIndex b (IndexQueryExactInt "someindex" 135)
    assertEqual "" ["test"] keys

ping'o'death :: TestTree
ping'o'death = testCase "ping'o'death" $ replicateM_ 23 ping
    where ping = do
            c <- Riak.connect Riak.defaultClient
            replicateM_ 1024 $ Riak.ping c


counter :: TestTree
counter = testCase "increment" $ do
              conn <- Riak.connect Riak.defaultClient
              Just (C.DTCounter (C.Counter a)) <- act conn
              Just (C.DTCounter (C.Counter b)) <- act conn
              assertEqual "inc by 1" 1 (b-a)
    where
      act c = do C.counterSendUpdate c "counters" "xxx" "yyy" [C.CounterInc 1]
                 C.get c "counters" "xxx" "yyy"

set :: TestTree
set = testCase "set add" $ do
        conn <- Riak.connect Riak.defaultClient
        C.setSendUpdate conn btype buck key [C.SetRemove val]
        C.setSendUpdate conn btype buck key [C.SetAdd val]
        Just (C.DTSet (C.Set r)) <- C.get conn btype buck key
        assertBool "-foo +foo => contains foo" $ val `S.member` r
    where
      (btype,buck,key,val) = ("sets","xxx","yyy","foo")

map_ :: TestTree
map_ = testCase "map update" $ do
         conn <- Riak.connect Riak.defaultClient
         Just (C.DTMap a) <- act conn -- do smth (increment), get
         Just (C.DTMap b) <- act conn -- increment, get
         assertEqual "map update" (C.modify mapOp a) b -- modify's behaviour should match
         assertEqual "mapUpdate sugar" mapOp' mapOp

         -- remove top-level field (X)
         C.mapSendUpdate conn btype buck key [C.MapRemove fieldX]
         Just (C.DTMap c) <- act conn
         assertEqual "update after delete" (Just updateCreates) $ C.xlookup "X" C.MapMapTag c

         -- remove nested field (X/Y)
         C.mapSendUpdate conn btype buck key [C.MapUpdate (C.MapPath $ "X" :| [])
                                                   (C.MapMapOp (C.MapRemove fieldY))]
         Just (C.DTMap d) <- C.get conn btype buck key
         assertEqual "update after nested delete 1" Nothing
                         $ C.xlookup ("X" C.-/ "Y") C.MapMapTag d
         assertEqual "update after nested delete 2" (Just (C.MapMap (C.Map mempty)))
                         $ C.xlookup "X" C.MapMapTag d
    where
      act c = do C.mapSendUpdate c btype buck key [mapOp]
                 C.get c btype buck key

      btype = "maps"
      fieldX = C.MapField C.MapMapTag "X"
      fieldY = C.MapField C.MapMapTag "Y"
      (buck,key) = ("xxx","yyy")

      updateCreates = C.MapMap (C.Map (M.fromList
                                            [(C.MapField C.MapMapTag "Y",
                                              C.MapMap (C.Map (M.fromList
                                                                    [(C.MapField C.MapCounterTag "Z",
                                                                      C.MapCounter (C.Counter 1))])))]))

      mapOp = "X" C.-/ "Y" C.-/ "Z" `C.mapUpdate` C.CounterInc 1

      mapOp' = C.MapUpdate (C.MapPath ("X" :| "Y" : "Z" : []))
                           (C.MapCounterOp (C.CounterInc 1))


search :: TestTree
search = testCase "basic searchRaw" $ do
           conn <- Riak.connect Riak.defaultClient
           C.sendModify conn btype buck key [C.SetRemove kw]
           delay
           a <- query conn ("set:" <> kw)
           assertEqual "should not found non-existing" [] a
           C.sendModify conn btype buck key [C.SetAdd kw]
           delay
           b <- query conn ("set:" <> kw)
           assertBool "searches specific" $ not (null b)
           c <- query conn ("set:*")
           assertBool "searches *" $ not (null c)
    where
      query conn q = S.searchRaw conn q "set-ix"
      (btype,buck,key) = ("sets","xxx","yyy")
      kw = "haskell"
      delay = threadDelay (1*5000*1000) -- http://docs.basho.com/riak/2.1.3/dev/using/search/#Indexing-Values


getIndex :: TestTree
getIndex = testCase "getIndex" $ do
             conn <- Riak.connect Riak.defaultClient
             all' <- S.getIndex conn Nothing
             one <- S.getIndex conn (Just "set-ix")
             assertBool "all indeces" $ not (null all')
             assertEqual "set index" 1 (length one)

bucketTypes :: TestTree
bucketTypes = testCase "bucketTypes" $ do
             conn <- Riak.connect Riak.defaultClient
             [p0,p1,p2] <- sequence [ B.put conn bt b k Nothing o Default Default
                                      | bt <- types | o <- [o0,o1,o2] ]
             [r0,r1,r2] <- sequence [ B.get conn bt b k Default | bt <- types ]

             assertBool "sound get Nothing"   (valok r0 o0)
             assertBool "sound get untyped-1" (valok r1 o1)
             assertBool "sound get untyped-2" (valok r2 o2)

             assertEqual "put=get Nothing"   (Just p0) r0
             assertEqual "put=get untyped-1" (Just p1) r1
             assertEqual "put=get untyped-2" (Just p2) r2
    where
      (b,k) = ("xxx","0") :: (Bucket,Key)
      types = [Nothing, Just "untyped-1", Just "untyped-2"] :: [Maybe BucketType]
      [o0,o1,o2] = B.binary <$> ["A","B","C"] :: [B.Content]

      valok :: Maybe (Seq.Seq B.Content, VClock) -> B.Content -> Bool
      valok (Just (rs,_)) o = B.value o `elem` map B.value (toList rs)
      valok _ _             = False


exceptions :: TestTree
exceptions = testGroup "exceptions" [
              testCase "correct put"  . shouldBeOK . withRollback $ put,
              testCase "correct put_" . shouldBeOK . withRollback $ put_,
              testCase "invalid put"  . shouldThrow . withRollback $ putErr,
              testCase "invalid put_" . shouldThrow . withRollback $ put_Err
             ]
    where
      put     = putSome Basic.put  btype
      put_    = putSome Basic.put_ btype
      putErr  = putSome Basic.put  noBtype
      put_Err = putSome Basic.put_ noBtype

      putSome :: (Maybe BucketType -> Bucket -> Key
                             -> Maybe VClock -> B.Content -> Quorum -> Quorum -> Riak a)
              -> Maybe BucketType -> Riak a
      putSome f bt = f bt buck key Nothing val Default Default

      shouldBeOK act  = act >> assertBool "ok" True
      shouldThrow act = catch (act >> assertBool "exception" False) (\(_e::ER.ErrorResponse) -> pure ())

      btype   = Just "untyped-1"
      noBtype = Just "no such type"
      buck = "xxx"
      key = "0"
      val = B.binary ""
