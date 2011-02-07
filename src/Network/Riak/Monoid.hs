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

import Control.Arrow (first)
import Data.Function (on)
import Data.Either (partitionEithers)
import Data.List (sortBy)
import Data.Monoid (Monoid(..))
import Network.Riak.Types.Internal hiding (MessageTag(..))

get :: (Monoid c) =>
       (Connection -> Bucket -> Key -> R -> IO (Maybe ([c], VClock)))
       -> (Connection -> Bucket -> Key -> R -> IO (Maybe (c, VClock)))
get doGet conn bucket key r =
    fmap (first mconcat) `fmap` doGet conn bucket key r

getMany :: (Monoid c) =>
           (Connection -> Bucket -> [Key] -> R -> IO [Maybe ([c], VClock)])
        -> Connection -> Bucket -> [Key] -> R -> IO [Maybe (c, VClock)]
getMany doGet conn b ks r = map (fmap (first mconcat)) `fmap` doGet conn b ks r

put :: (Eq c, Monoid c) =>
       (Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
                   -> IO ([c], VClock))
    -> Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put doPut conn bucket key mvclock0 val0 w dw = do
  let go val mvclock1 = do
        (xs, vclock) <- doPut conn bucket key mvclock1 val w dw
        case xs of
          []             -> return (val, vclock) -- not observed in the wild
          [v] | v == val -> return (val, vclock)
          ys             -> go (mconcat (val:ys)) (Just vclock)
  go val0 mvclock0

put_ :: (Eq c, Monoid c) =>
        (Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
                    -> IO ([c], VClock))
     -> Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
     -> IO ()
put_ doPut conn bucket key mvclock0 val0 w dw =
    put doPut conn bucket key mvclock0 val0 w dw >> return ()
{-# INLINE put_ #-}

putMany :: (Eq c, Monoid c) =>
           (Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
                       -> IO [([c], VClock)])
        -> Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
        -> IO [(c, VClock)]
putMany doPut conn bucket puts0 w dw = go [] . zip [(0::Int)..] $ puts0 where
  go acc [] = return . map snd . sortBy (compare `on` fst) $ acc
  go acc puts = do
    rs <- doPut conn bucket (map snd puts) w dw
    let (conflicts, ok) = partitionEithers $ zipWith mush puts rs
    go (ok++acc) conflicts
  mush (i,(k,_,c)) (cs,v) =
      case cs of
        []           -> Right (i,(c,v)) -- not observed in the wild
        [x] | x == c -> Right (i,(c,v))
        _            -> Left (i,(k,Just v, mconcat (c:cs)))

putMany_ :: (Eq c, Monoid c) =>
            (Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
                        -> IO [([c], VClock)])
         -> Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW -> IO ()
putMany_ doPut conn bucket puts0 w dw =
    putMany doPut conn bucket puts0 w dw >> return ()
{-# INLINE putMany_ #-}
