{-# LANGUAGE OverloadedStrings #-}
module Main where

import Criterion.Main

import Network.Riak.Connection.Pool as Pool (Pool, create, withConnection)
import Network.Riak.Connection (defaultClient)
import Network.Riak.CRDT
import qualified Data.ByteString.Lazy.Char8 as B
import Control.Applicative
import Control.Monad
import Data.Maybe
import Data.String
import qualified Data.List.NonEmpty as NEL
import Data.Semigroup


main :: IO ()
main = benchmarks >>= defaultMain

bucket = "bench"

benchmarks = do
  pool <- Pool.create defaultClient 1 1 1
  already <- Pool.withConnection pool $ \c -> get c "counters" bucket "__setup"
  when (isNothing already) $ setup pool
  pure [crdt pool]

setup :: Pool -> IO ()
setup pool = Pool.withConnection pool $ \c -> do
               setupSetN c "10" 10
               setupSetN c "100" 100
               setupSetN c "1000" 1000

               setupMapN_elem c "1" 1
               setupMapN_elem c "10-elem" 10
               setupMapN_elem c "100-elem" 100
               setupMapN_elem c "1000-elem" 1000
               setupMapN_nest c "10-depth" 10
               setupMapN_nest c "100-depth" 100
               setupMapN_nest c "1000-depth" 1000

               sendModify c "counters" bucket "__setup" [CounterInc 1]
               putStrLn "Bench env set up."


-- | * Common things

-- | Key names
setK n = fromString $ show n
mapElemK n = fromString $ show n <> "-elem"
mapDepthK n = fromString $ show n <> "-depth"

-- | Map things
nestedMapPath n = MapPath . NEL.fromList $ [ fromString (show i) | i <- [1..n] ]


setupSetN c key n = sequence_ [
                     sendModify c "sets" bucket key [SetAdd (B.pack $ show i)]
                         | i <- [1..n]
                    ]

-- | n-elem map with counters
setupMapN_elem c key n = sendModify c "maps" bucket key ops
    where ops = [MapUpdate (MapPath $ (fromString $ show i) :| [])
                           (MapCounterOp $ CounterInc 1)
                  | i <- [1..n]
                ]

-- | n-depth map with a counter
setupMapN_nest c key n = sendModify c "maps" bucket key [op]
    where op = MapUpdate (nestedMapPath n)
                         (MapCounterOp $ CounterInc 1)



crdt :: Pool -> Benchmark
crdt pool = bgroup "CRDT" [
             bgroup "get" [
               bench "get a non-existent counter" . nfIO $ pooled getEmpty
             ],

             bgroup "counters" [
               bench "get a counter"              . nfIO $ pooled getCounter
             ],

             bgroup "sets" [
               bench "get a 10-elem set"          . nfIO $ pooled getSet10,
               bench "get a 100-elem set"         . nfIO $ pooled getSet100,
               bench "get a 1000-elem set"        . nfIO $ pooled getSet1000,
               bench "1000-set add+remove an elem cycle" . nfIO $ pooled set1kAddRemove
             ],

             bgroup "maps" [
               bgroup "get" [
                 bench "get a trivial map"    . nfIO . pooled $ get1Map,
                 bench "get a 10-elem map"    . nfIO . pooled $ getNMap 10,
                 bench "get a 100-elem map"   . nfIO . pooled $ getNMap 100,
                 bench "get a 1000-elem map"  . nfIO . pooled $ getNMap 1000,
                 bench "get a 10-depth map"   . nfIO . pooled $ getDMap 10,
                 bench "get a 100-depth map"  . nfIO . pooled $ getDMap 100,
                 bench "get a 1000-depth map" . nfIO . pooled $ getDMap 1000
               ],

               bgroup "update" [
                 bench "update a counter inside 10-elem map"    . nfIO . pooled $ updateNMap 10,
                 bench "update a counter inside 100-elem map"   . nfIO . pooled $ updateNMap 100,
                 bench "update a counter inside 1000-elem map"  . nfIO . pooled $ updateNMap 1000,
                 bench "update a counter inside 10-depth map"   . nfIO . pooled $ updateDMap 10,
                 bench "update a counter inside 100-depth map"  . nfIO . pooled $ updateDMap 100,
                 bench "update a counter inside 1000-depth map" . nfIO . pooled $ updateDMap 1000
               ]
             ]
           ]
    where pooled = Pool.withConnection pool


getEmpty c   = get c "counters" "not here" "never was"
getCounter c = get c "counters" "xxx" "yyy"
getSet10 c   = get c "sets" bucket "10"
getSet100 c  = get c "sets" bucket "100"
getSet1000 c = get c "sets" bucket "1000"

set1kAddRemove c = sequence_ [ sendModify c "sets" bucket "1000" [o]
                               | o <- [SetAdd "foo", SetRemove "foo"] ]

get1Map c = get c "maps" bucket "1"
getNMap n c = get c "maps" bucket (mapElemK n)
getDMap n c = get c "maps" bucket (mapDepthK n)

updateNMap n c = setupMapN_elem c (mapElemK n) n
updateDMap n c = setupMapN_nest c (mapDepthK n) n

