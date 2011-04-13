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
-- Functions automatically resolve conflicts using 'Resolvable'
-- instances.  For instance, if a 'get' returns three siblings, a
-- winner will be chosen using 'resolve'.  If a 'put' results in a
-- conflict, a winner will be chosen using 'resolve', and the winner
-- will be 'put'; this will be repeated until either no conflict
-- occurs or the process has been repeated too many times.

module Network.Riak.Value.Resolvable
    (
      V.IsContent(..)
    , Resolvable(..)
    , ResolutionFailure(..)
    , get
    , getMany
    , put
    , put_
    , putMany
    , putMany_
    ) where

import Network.Riak.Resolvable.Internal (ResolutionFailure(..), Resolvable(..))
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Network.Riak.Resolvable.Internal as R
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
-- If a conflict arises, a winner will be chosen using 'resolve', and
-- the winner will be stored; this will be repeated until no conflict
-- occurs or a (fairly large) number of retries has been attempted
-- without success.
--
-- If this function gives up due to apparently being stuck in a
-- conflict resolution loop, it will throw a 'ResolutionFailure'
-- exception.
put :: (Eq a, Resolvable a, V.IsContent a) =>
       Connection -> Bucket -> Key -> Maybe VClock -> a -> W -> DW
    -> IO (a, VClock)
put = R.put V.put 
{-# INLINE put #-}

-- | Store a single value, automatically resolving any vector clock
-- conflicts that arise.  A single invocation of this function may
-- involve several roundtrips to the server to resolve conflicts.
--
-- If a conflict arises, a winner will be chosen using 'resolve', and
-- the winner will be stored; this will be repeated until no conflict
-- occurs or a (fairly large) number of retries has been attempted
-- without success.
--
-- If this function gives up due to apparently being stuck in a
-- conflict resolution loop, it will throw a 'ResolutionFailure'
-- exception.
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
-- 'resolve', and the winners will be stored; this will be repeated
-- until either no conflicts occur or a (fairly large) number of
-- retries has been attempted without success.
--
-- For each original value to be stored, the final value that was
-- stored at the end of any conflict resolution is returned.
--
-- If this function gives up due to apparently being stuck in a loop,
-- it will throw a 'ResolutionFailure' exception.
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
-- 'resolve', and the winners will be stored; this will be repeated
-- until either no conflicts occur or a (fairly large) number of
-- retries has been attempted without success.
--
-- If this function gives up due to apparently being stuck in a loop,
-- it will throw a 'ResolutionFailure' exception.
putMany_ :: (Eq a, Resolvable a, V.IsContent a) =>
            Connection -> Bucket -> [(Key, Maybe VClock, a)] -> W -> DW -> IO ()
putMany_ = R.putMany_ V.putMany
{-# INLINE putMany_ #-}
