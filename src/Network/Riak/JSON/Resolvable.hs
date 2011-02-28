-- |
-- Module:      Network.Riak.JSON.Resolvable
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Bryan O'Sullivan <bos@mailrank.com>
-- Stability:   experimental
-- Portability: portable
--
-- This module allows storage and retrieval of JSON-encoded data.
--
-- Functions automatically resolve conflicts using 'Resolvable' instances.
-- For instance, if a 'get' returns three siblings, a winner will be
-- chosen using 'mconcat'.  If a 'put' results in a conflict, a winner
-- will be chosen using 'mconcat', and the winner will be 'put'; this
-- will be repeated until no conflict occurs.

module Network.Riak.JSON.Resolvable
    (
      get
    , getMany
    , put
    , put_
    , putMany
    , putMany_
    ) where

import Data.Aeson.Types (FromJSON(..), ToJSON(..))
import Network.Riak.Resolvable.Internal (Resolvable)
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Network.Riak.JSON as J
import qualified Network.Riak.Resolvable.Internal as R

-- | Retrieve a single value.  If conflicting values are returned, the
-- 'Resolvable' is used to choose a winner.
get :: (FromJSON c, ToJSON c, Resolvable c) =>
       Connection -> Bucket -> Key -> R -> IO (Maybe (c, VClock))
get = R.get J.get
{-# INLINE get #-}

-- | Retrieve multiple values.  If conflicting values are returned for
-- a key, the 'Resolvable' is used to choose a winner.
getMany :: (FromJSON c, ToJSON c, Resolvable c)
           => Connection -> Bucket -> [Key] -> R -> IO [Maybe (c, VClock)]
getMany = R.getMany J.getMany
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
put :: (Eq c, FromJSON c, ToJSON c, Resolvable c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put = R.put J.put
{-# INLINE put #-}

-- | Store a single value, automatically resolving any vector clock
-- conflicts that arise.  A single invocation of this function may
-- involve several roundtrips to the server to resolve conflicts.
--
-- If a conflict arises, a winner will be chosen using 'mconcat', and
-- the winner will be stored; this will be repeated until no conflict
-- occurs.
put_ :: (Eq c, FromJSON c, ToJSON c, Resolvable c) =>
        Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
     -> IO ()
put_ = R.put_ J.put
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
putMany :: (Eq c, FromJSON c, ToJSON c, Resolvable c) =>
           Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
        -> IO [(c, VClock)]
putMany = R.putMany J.putMany
{-# INLINE putMany #-}

-- | Store multiple values, resolving any vector clock conflicts that
-- arise.  A single invocation of this function may involve several
-- roundtrips to the server to resolve conflicts.
--
-- If any conflicts arise, a winner will be chosen in each case using
-- 'mconcat', and the winners will be stored; this will be repeated
-- until no conflicts occur.
putMany_ :: (Eq c, FromJSON c, ToJSON c, Resolvable c) =>
            Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
         -> IO ()
putMany_ = R.putMany_ J.putMany
{-# INLINE putMany_ #-}
