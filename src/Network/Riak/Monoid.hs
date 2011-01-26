-- |
-- Module:      Network.Riak.Monoid
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Bryan O'Sullivan <bos@mailrank.com>
-- Stability:   experimental
-- Portability: portable
--
-- Storage and retrieval of monoidal data with automatic conflict resolution.

module Network.Riak.Monoid
    (
      get
    , getMany
    , put
    , put_
    , putMany
    , putMany_
    ) where

import Control.Arrow (first, second)
import Data.Function (on)
import Data.List (partition, sortBy)
import Data.Monoid (Monoid(..))
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Data.IntMap as M

get :: (Monoid c) =>
       (Connection -> Bucket -> Key -> R -> IO (Maybe ([c], VClock)))
       -> (Connection -> Bucket -> Key -> R -> IO (Maybe (c, VClock)))
get doGet conn bucket key r =
    fmap (first mconcat) `fmap` doGet conn bucket key r

getMany :: (Monoid c) =>
           (Connection -> Bucket -> [Key] -> R -> IO [Maybe ([c], VClock)])
        -> Connection -> Bucket -> [Key] -> R -> IO [Maybe (c, VClock)]
getMany doGet conn b ks r = map (fmap (first mconcat)) `fmap` doGet conn b ks r

put :: Monoid c => (Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
                               -> IO ([c], VClock))
    -> Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put doPut conn bucket key mvclock0 val0 w dw = do
  let go val mvclock1 = do
        (xs, vclock) <- doPut conn bucket key mvclock1 val w dw
        case xs of
          [c] -> return (c, vclock)
          _   -> go (mconcat xs) (Just vclock)
  go val0 mvclock0

put_ :: Monoid c => (Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
                                -> IO ([c], VClock))
     -> Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
     -> IO ()
put_ doPut conn bucket key mvclock0 val0 w dw =
    put doPut conn bucket key mvclock0 val0 w dw >> return ()
{-# INLINE put_ #-}

putMany :: (Monoid c) =>
           (Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
                       -> IO [([c], VClock)])
        -> Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
        -> IO [(c, VClock)]
putMany doPut conn bucket puts0 w dw = go [] . zip [(0::Int)..] $ puts0 where
  go acc [] = return . map snd . sortBy (compare `on` fst) $ acc
  go acc puts = do
    rs <- doPut conn bucket (map snd puts) w dw
    let (conflicts, ok) = partition isConflict $ zip (map fst puts) rs
        isConflict (_,(_:_:_,_)) = True
        isConflict  _            = False
    go (map (second (first mconcat)) ok++acc) (map asPut conflicts)
  asPut (i,(c,v)) = (i,(keys M.! i, Just v, mconcat c))
  keys = M.fromAscList (zip [(0::Int)..] (map fst3 puts0))
  fst3 (a,_,_) = a

putMany_ :: (Monoid c) =>
           (Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
                       -> IO [([c], VClock)])
        -> Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
        -> IO ()
putMany_ doPut conn bucket puts0 w dw =
    putMany doPut conn bucket puts0 w dw >> return ()
{-# INLINE putMany_ #-}
