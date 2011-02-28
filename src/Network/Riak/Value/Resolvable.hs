-- |
-- Module:      Network.Riak.Value.Resolvable
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Bryan O'Sullivan <bos@mailrank.com>
-- Stability:   experimental
-- Portability: portable
--
-- This module allows storage and retrieval of data encoded using the
-- 'V.IsContent' typeclass.  This provides access to more of Riak's
-- storage features than JSON, e.g. links.
--
-- Functions automatically resolve conflicts using 'Resolvable' instances.
-- For instance, if a 'get' returns three siblings, a winner will be
-- chosen using 'mconcat'.  If a 'put' results in a conflict, a winner
-- will be chosen using 'mconcat', and the winner will be 'put'; this
-- will be repeated until no conflict occurs.

module Network.Riak.Value.Resolvable
    (
      V.IsContent(..)
    , get
    , getMany
    , put
    , put_
    , putMany
    , putMany_
    ) where

import Network.Riak.Resolvable (Resolvable)
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Network.Riak.Resolvable as R
import qualified Network.Riak.Value as V

-- | Retrieve a single value.  If conflicting values are returned, the
-- 'Resolvable' is used to choose a winner.
get :: (Resolvable a, V.IsContent a) =>
       Connection -> Bucket -> Key -> R -> IO (Maybe (a, VClock))
get = R.get V.get
{-# INLINE get #-}

-- | Retrieve multiple values.  If conflicting values are returned for
-- a key, the 'Resolvable' is used to choose a winner.
getMany :: (Resolvable a, V.IsContent a) => Connection -> Bucket -> [Key] -> R
        -> IO [Maybe (a, VClock)]
getMany = R.getMany V.getMany
{-# INLINE getMany #-}

-- | Store a single value, automatically resolving any vector clock
-- conflicts that arise.  A single invocation of this function may
-- involve several roundtrips to the server to resolve conflicts.
--
-- If a conflict arises, a winner will be chosen using 'mconcat', and
-- the winner will be stored; this will be repeated until no conflict
-- occurs.
--
-- The final value to be stored at the end of any conflict resolution
-- is returned.
put :: (Eq a, Resolvable a, V.IsContent a) =>
       Connection -> Bucket -> Key -> Maybe VClock -> a -> W -> DW
    -> IO (a, VClock)
put = R.put V.put 
{-# INLINE put #-}

-- | Store a single value, automatically resolving any vector clock
-- conflicts that arise.  A single invocation of this function may
-- involve several roundtrips to the server to resolve conflicts.
--
-- If a conflict arises, a winner will be chosen using 'mconcat', and
-- the winner will be stored; this will be repeated until no conflict
-- occurs.
put_ :: (Eq a, Resolvable a, V.IsContent a) =>
        Connection -> Bucket -> Key -> Maybe VClock -> a -> W -> DW
     -> IO ()
put_ = R.put_ V.put 
{-# INLINE put_ #-}

-- | Store multiple values, resolving any vector clock conflicts that
-- arise.  A single invocation of this function may involve several
-- roundtrips to the server to resolve conflicts.
--
-- If any conflicts arise, a winner will be chosen in each case using
-- 'mconcat', and the winners will be stored; this will be repeated
-- until no conflicts occur.
--
-- For each original value to be stored, the final value that was
-- stored at the end of any conflict resolution is returned.
putMany :: (Eq a, Resolvable a, V.IsContent a) =>
           Connection -> Bucket -> [(Key, Maybe VClock, a)] -> W -> DW
        -> IO [(a, VClock)]
putMany = R.putMany V.putMany
{-# INLINE putMany #-}

-- | Store multiple values, resolving any vector clock conflicts that
-- arise.  A single invocation of this function may involve several
-- roundtrips to the server to resolve conflicts.
--
-- If any conflicts arise, a winner will be chosen in each case using
-- 'mconcat', and the winners will be stored; this will be repeated
-- until no conflicts occur.
putMany_ :: (Eq a, Resolvable a, V.IsContent a) =>
            Connection -> Bucket -> [(Key, Maybe VClock, a)] -> W -> DW -> IO ()
putMany_ = R.putMany_ V.putMany
{-# INLINE putMany_ #-}
