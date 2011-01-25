-- |
-- Module:      Network.Riak.Value.Monoid
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
-- Functions automatically resolve conflicts using 'Monoid' instances.
-- For instance, if a 'get' returns three siblings, a winner will be
-- chosen using 'mconcat'.  If a 'put' results in a conflict, a winner
-- will be chosen using 'mconcat', and the winner will be 'put'; this
-- will be repeated until no conflict occurs.

module Network.Riak.Value.Monoid
    (
      V.IsContent(..)
    , get
    , getMany
    , put
    , putMany
    ) where

import Data.Monoid (Monoid(..))
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Network.Riak.Monoid as M
import qualified Network.Riak.Value as V

-- | Retrieve a single value.  If conflicting values are returned, the
-- 'Monoid' is used to choose a winner.
get :: (Monoid c, V.IsContent c) =>
       Connection -> Bucket -> Key -> R -> IO (Maybe (c, VClock))
get = M.get V.get
{-# INLINE get #-}

-- | Retrieve multiple values.  If conflicting values are returned for
-- a key, the 'Monoid' is used to choose a winner.
getMany :: (Monoid c, V.IsContent c) => Connection -> Bucket -> [Key] -> R
        -> IO [Maybe (c, VClock)]
getMany = M.getMany V.getMany
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
put :: (Monoid c, V.IsContent c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put = M.put V.put 
{-# INLINE put #-}

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
putMany :: (Monoid c, V.IsContent c) =>
           Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
        -> IO [(c, VClock)]
putMany = M.putMany V.putMany
{-# INLINE putMany #-}
