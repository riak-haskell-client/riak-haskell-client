{-# LANGUAGE CPP                 #-}
{-# LANGUAGE LambdaCase          #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ParallelListComp    #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

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
import           Network.Riak.Admin.DSL
import qualified Network.Riak.Basic as B
import qualified Network.Riak.Content as B (binary,Content,value)
import           Network.Riak.Connection (exchange)
import qualified Network.Riak.CRDT as C
import qualified Network.Riak.CRDT.Riak as C
import qualified Network.Riak.Request as Req
import qualified Network.Riak.Response as Resp
import qualified Network.Riak.Search as S
import qualified Network.Riak.JSON as J
import           Network.Riak.Resolvable (ResolvableMonoid (..))
import           Network.Riak.Types
import qualified Network.Riak.Protocol.ErrorResponse as ER
import qualified Network.Riak.Protocol.SearchQueryRequest as S
import qualified Properties
import qualified CRDTProperties as CRDT
import           Utils
import           Test.Tasty
import           Test.Tasty.HUnit

main :: IO ()
main = do
  setup
  defaultMain tests

setup :: IO ()
setup = do
  -- Create a "set-ix" index and wait for it to exist.
  let createIxUrl :: String
      createIxUrl = globalHost ++ ":" ++ show globalHttpPort ++ "/search/index/set-ix"

  shell ("curl -sf -XPUT " ++ createIxUrl ++ " -H 'Content-Type: application/json'")
  let loop =
        try (shell ("curl -sf " ++ createIxUrl)) >>= \case
          Left (_ :: ShellFailure) -> do
            threadDelay (1*1000*1000)
            loop
          Right _ -> pure ()
  loop

  riakAdminWith globalAdmin
    [ waitForService "riak_kv" Nothing
    , waitForService "yokozuna" Nothing

    , bucketTypeCreate "maps" (Just "'{\"props\":{\"datatype\":\"map\"}}'")
    , bucketTypeCreate "sets" (Just "'{\"props\":{\"datatype\":\"set\",\"search_index\":\"set-ix\"}}'")
    , bucketTypeCreate "counters" (Just "'{\"props\":{\"datatype\":\"counter\"}}'")

    , bucketTypeActivate "maps"
    , bucketTypeActivate "sets"
    , bucketTypeActivate "counters"

    , bucketTypeCreate "untyped-1" Nothing
    , bucketTypeCreate "untyped-2" Nothing

    , bucketTypeActivate "untyped-1"
    , bucketTypeActivate "untyped-2"
    ]

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
            search1,
            search2,
            getIndex,
            putIndex,
            deleteIndex
           ]

testClusterSimple :: TestTree
testClusterSimple = testCase "testClusterSimple" $ withGlobalConn B.ping


testIndexedPutGet :: TestTree
testIndexedPutGet = testCase "testIndexedPutGet" $ do
    let bt = Nothing
        b = "riak-haskell-client-test"
        k = "test"
    keys <- withGlobalConn $ \c -> do
      _ <- J.putIndexed c bt b k [(IndexInt "someindex" 135)] Nothing
          (RM (M.fromList [("somekey", "someval")] :: M.Map Text Text))
          Default Default
      Riak.getByIndex c b (IndexQueryExactInt "someindex" 135)
    assertEqual "" ["test"] keys

ping'o'death :: TestTree
ping'o'death = testCase "ping'o'death" $ replicateM_ 23 ping
    where ping = withGlobalConn (\c -> replicateM_ 1024 (Riak.ping c))


counter :: TestTree
counter = testCase "increment" $ withGlobalConn $ \conn -> do
              Just (C.DTCounter (C.Counter a)) <- act conn
              Just (C.DTCounter (C.Counter b)) <- act conn
              assertEqual "inc by 1" 1 (b-a)
    where
      act c = do C.counterSendUpdate c "counters" "xxx" "yyy" [C.CounterInc 1]
                 C.get c "counters" "xxx" "yyy"

set :: TestTree
set = testCase "set add" $ withGlobalConn $ \conn -> do
        C.setSendUpdate conn btype buck key [C.SetRemove val]
        C.setSendUpdate conn btype buck key [C.SetAdd val]
        Just (C.DTSet (C.Set r)) <- C.get conn btype buck key
        assertBool "-foo +foo => contains foo" $ val `S.member` r
    where
      (btype,buck,key,val) = ("sets","xxx","yyy","foo")

map_ :: TestTree
map_ = testCase "map update" $ withGlobalConn $ \conn -> do
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


search1 :: TestTree
search1 = testCase "basic searchRaw" $ withGlobalConn $ \conn -> do
           C.sendModify conn btype buck key [C.SetRemove kw]
           delay
           a <- query conn ("set:" <> kw)
           assertEqual "should not found non-existing" (S.SearchResult Seq.empty (Just 0.0) (Just 0)) a
           C.sendModify conn btype buck key [C.SetAdd kw]
           delay
           b <- query conn ("set:" <> kw)
           assertBool "searches specific" $ not (Seq.null (S.docs b))
           c <- query conn ("set:*")
           assertBool "searches *" $ not (Seq.null (S.docs c))
    where
      query conn q = S.searchRaw conn q "set-ix"
      (btype,buck,key) = ("sets","xxx","yyy")
      kw = "haskell"
      delay = threadDelay (1*5000*1000) -- http://docs.basho.com/riak/2.1.3/dev/using/search/#Indexing-Values

search2 :: TestTree
search2 = testCase "search with fl" $ withGlobalConn $ \conn -> do
            let req = (Req.search "set:haskell" "set-ix") { S.fl = Seq.singleton "_yz_rk" }
            resp <- Resp.search <$> exchange conn req
            assertEqual "only returns fl"
              (Seq.singleton (Seq.singleton ("_yz_rk", Just "yyy")))
              (S.docs resp)


getIndex :: TestTree
getIndex = testCase "getIndex" $ withGlobalConn $ \conn -> do
             all' <- S.getIndex conn Nothing
             one <- S.getIndex conn (Just "set-ix")
             assertBool "all indeces" $ not (null all')
             assertEqual "set index" 1 (length one)

putIndex :: TestTree
putIndex = testCase "putIndex" $ withGlobalConn $ \conn -> do
             _ <- S.putIndex conn (S.indexInfo "dummy-index" Nothing Nothing) Nothing
             threadDelay 5000000
             one <- S.getIndex conn (Just "dummy-index")
             assertEqual "index was created" 1 (length one)

deleteIndex :: TestTree
deleteIndex = testCase "deleteIndex" $ withGlobalConn $ \conn -> do
  S.deleteIndex conn "dummy-index"
  threadDelay (5*1000*1000)

  _ <- tryJust f (S.getIndex conn (Just "dummy-index"))
  pure ()

  where
    f :: ER.ErrorResponse -> Maybe ()
    f (ER.ErrorResponse "notfound" 0) = Just ()
    f _ = Nothing

bucketTypes :: TestTree
bucketTypes = testCase "bucketTypes" $ withGlobalConn $ \conn -> do
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
              testCase "correct put"  . shouldBeOK . withGlobalConn $ put,
              testCase "correct put_" . shouldBeOK . withGlobalConn $ put_,
              testCase "invalid put"  . shouldThrow . withGlobalConn $ putErr,
              testCase "invalid put_" . shouldThrow . withGlobalConn $ put_Err
             ]
    where
      put     = putSome B.put  btype
      put_    = putSome B.put_ btype
      putErr  = putSome B.put  noBtype
      put_Err = putSome B.put_ noBtype

      putSome :: (Connection -> Maybe BucketType -> Bucket -> Key
                             -> Maybe VClock -> B.Content -> Quorum -> Quorum -> IO a)
              -> Maybe BucketType -> Connection -> IO a
      putSome f bt c = f c bt buck key Nothing val Default Default

      shouldBeOK act  = act >> assertBool "ok" True
      shouldThrow act = catch (act >> assertBool "exception" False) (\(_e::ER.ErrorResponse) -> pure ())

      btype   = Just "untyped-1"
      noBtype = Just "no such type"
      buck = "xxx"
      key = "0"
      val = B.binary ""
