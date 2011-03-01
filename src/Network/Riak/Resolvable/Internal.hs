{-# LANGUAGE DeriveDataTypeable, GeneralizedNewtypeDeriving #-}
-- |
-- Module:      Network.Riak.Resolvable.Internal
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Bryan O'Sullivan <bos@mailrank.com>
-- Stability:   experimental
-- Portability: portable
--
-- Storage and retrieval of data with automatic conflict resolution.

module Network.Riak.Resolvable.Internal
    (
      Resolvable(..)
    , ResolvableMonoid(..)
    , get
    , getMany
    , put
    , put_
    , putMany
    , putMany_
    ) where

import Control.Arrow (first)
import Control.Monad (unless)
import Data.Aeson.Types (FromJSON, ToJSON)
import Data.Data (Data)
import Data.Either (partitionEithers)
import Data.Function (on)
import Data.List (foldl', sortBy)
import Data.Monoid (Monoid(mappend))
import Data.Typeable (Typeable)
import Network.Riak.Debug (debug)
import Network.Riak.Types.Internal hiding (MessageTag(..))

-- | A type that can automatically resolve a vector clock conflict
-- between two or more versions of a value.
--
-- Instances must be symmetric in their behaviour, such that the
-- following law is obeyed:
--
-- > resolve a b == resolve b a
--
-- Otherwise, there are no restrictions on the behaviour of 'resolve'.
-- The result may be @a@, @b@, a value derived from @a@ and @b@, or
-- something else.
--
-- If several conflicting siblings are found, 'resolve' will be
-- applied over all of them using a fold, to yield a single
-- \"winner\".
class Resolvable a where
    -- | Resolve a conflict between two values.
    resolve :: a -> a -> a

-- | A newtype wrapper that uses the 'mappend' method of a type's
-- 'Monoid' instance to perform vector clock conflict resolution.
newtype ResolvableMonoid a = RM { unRM :: a }
    deriving (Eq, Ord, Read, Show, Typeable, Data, Monoid, FromJSON, ToJSON)

instance (Monoid a) => Resolvable (ResolvableMonoid a) where
    resolve = mappend
    {-# INLINE resolve #-}

instance (Resolvable a) => Resolvable (Maybe a) where
    resolve (Just a)   (Just b) = Just (resolve a b)
    resolve a@(Just _) _        = a
    resolve _          b        = b
    {-# INLINE resolve #-}

get :: (Resolvable a) =>
       (Connection -> Bucket -> Key -> R -> IO (Maybe ([a], VClock)))
       -> (Connection -> Bucket -> Key -> R -> IO (Maybe (a, VClock)))
get doGet conn bucket key r =
    fmap (first resolveMany) `fmap` doGet conn bucket key r

getMany :: (Resolvable a) =>
           (Connection -> Bucket -> [Key] -> R -> IO [Maybe ([a], VClock)])
        -> Connection -> Bucket -> [Key] -> R -> IO [Maybe (a, VClock)]
getMany doGet conn b ks r = map (fmap (first resolveMany)) `fmap` doGet conn b ks r

put :: (Eq a, Resolvable a) =>
       (Connection -> Bucket -> Key -> Maybe VClock -> a -> W -> DW
                   -> IO ([a], VClock))
    -> Connection -> Bucket -> Key -> Maybe VClock -> a -> W -> DW
    -> IO (a, VClock)
put doPut conn bucket key mvclock0 val0 w dw = do
  let go val mvclock1 = do
        (xs, vclock) <- doPut conn bucket key mvclock1 val w dw
        case xs of
          []             -> return (val, vclock) -- not observed in the wild
          [v] | v == val -> return (val, vclock)
          ys             -> do debug "put" "conflict" 
                               go (resolveMany' val ys) (Just vclock)
  go val0 mvclock0

put_ :: (Eq a, Resolvable a) =>
        (Connection -> Bucket -> Key -> Maybe VClock -> a -> W -> DW
                    -> IO ([a], VClock))
     -> Connection -> Bucket -> Key -> Maybe VClock -> a -> W -> DW
     -> IO ()
put_ doPut conn bucket key mvclock0 val0 w dw =
    put doPut conn bucket key mvclock0 val0 w dw >> return ()
{-# INLINE put_ #-}

putMany :: (Eq a, Resolvable a) =>
           (Connection -> Bucket -> [(Key, Maybe VClock, a)] -> W -> DW
                       -> IO [([a], VClock)])
        -> Connection -> Bucket -> [(Key, Maybe VClock, a)] -> W -> DW
        -> IO [(a, VClock)]
putMany doPut conn bucket puts0 w dw = go [] . zip [(0::Int)..] $ puts0 where
  go acc [] = return . map snd . sortBy (compare `on` fst) $ acc
  go acc puts = do
    rs <- doPut conn bucket (map snd puts) w dw
    let (conflicts, ok) = partitionEithers $ zipWith mush puts rs
    unless (null conflicts) $
      debug "putMany" $ show (length conflicts) ++ " conflicts"
    go (ok++acc) conflicts
  mush (i,(k,_,c)) (cs,v) =
      case cs of
        []           -> Right (i,(c,v)) -- not observed in the wild
        [x] | x == c -> Right (i,(c,v))
        _            -> Left (i,(k,Just v, resolveMany' c cs))

putMany_ :: (Eq a, Resolvable a) =>
            (Connection -> Bucket -> [(Key, Maybe VClock, a)] -> W -> DW
                        -> IO [([a], VClock)])
         -> Connection -> Bucket -> [(Key, Maybe VClock, a)] -> W -> DW -> IO ()
putMany_ doPut conn bucket puts0 w dw =
    putMany doPut conn bucket puts0 w dw >> return ()
{-# INLINE putMany_ #-}

resolveMany' :: (Resolvable a) => a -> [a] -> a
resolveMany' a as = foldl' resolve a as

resolveMany :: (Resolvable a) => [a] -> a
resolveMany (a:as) = resolveMany' a as
resolveMany _      = error "resolveMany: empty list"
