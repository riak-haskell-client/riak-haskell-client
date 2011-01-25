-- |
-- Module:      Network.Riak.JSON.Monoid
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Bryan O'Sullivan <bos@mailrank.com>
-- Stability:   experimental
-- Portability: portable
--
-- This module allows storage and retrieval of JSON-encoded data.
--
-- Functions automatically resolve conflicts using 'Monoid' instances.
-- For instance, if a 'get' returns three siblings, a winner will be
-- chosen using 'mconcat'.  If a 'put' results in a conflict, a winner
-- will be chosen using 'mconcat', and the winner will be 'put'; this
-- will be repeated until no conflict occurs.

module Network.Riak.JSON.Monoid
    (
      get
    , getMany
    , put
    , put_
    , putMany
    , putMany_
    ) where

import Data.Aeson.Types (FromJSON(..), ToJSON(..))
import Data.Monoid (Dual(..), First(..), Last(..), Monoid)
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Network.Riak.JSON as J
import qualified Network.Riak.Monoid as M

instance ToJSON a => ToJSON (Dual a) where
    toJSON = toJSON . getDual
    {-# INLINE toJSON #-}

instance FromJSON a => FromJSON (Dual a) where
    fromJSON = fmap Dual . fromJSON
    {-# INLINE fromJSON #-}

instance ToJSON a => ToJSON (First a) where
    toJSON = toJSON . getFirst
    {-# INLINE toJSON #-}

instance FromJSON a => FromJSON (First a) where
    fromJSON = fmap First . fromJSON
    {-# INLINE fromJSON #-}

instance ToJSON a => ToJSON (Last a) where
    toJSON = toJSON . getLast
    {-# INLINE toJSON #-}

instance FromJSON a => FromJSON (Last a) where
    fromJSON = fmap Last . fromJSON
    {-# INLINE fromJSON #-}

-- | Retrieve a single value.  If conflicting values are returned, the
-- 'Monoid' is used to choose a winner.
get :: (FromJSON c, ToJSON c, Monoid c) =>
       Connection -> Bucket -> Key -> R -> IO (Maybe (c, VClock))
get = M.get J.get
{-# INLINE get #-}

-- | Retrieve multiple values.  If conflicting values are returned for
-- a key, the 'Monoid' is used to choose a winner.
getMany :: (FromJSON c, ToJSON c, Monoid c)
           => Connection -> Bucket -> [Key] -> R -> IO [Maybe (c, VClock)]
getMany = M.getMany J.getMany
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
put :: (FromJSON c, ToJSON c, Monoid c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put = M.put J.put
{-# INLINE put #-}

-- | Store a single value, automatically resolving any vector clock
-- conflicts that arise.  A single invocation of this function may
-- involve several roundtrips to the server to resolve conflicts.
--
-- If a conflict arises, a winner will be chosen using 'mconcat', and
-- the winner will be stored; this will be repeated until no conflict
-- occurs.
put_ :: (FromJSON c, ToJSON c, Monoid c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO ()
put_ = M.put_ J.put
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
putMany :: (FromJSON c, ToJSON c, Monoid c) =>
           Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
        -> IO [(c, VClock)]
putMany = M.putMany J.putMany
{-# INLINE putMany #-}

-- | Store multiple values, resolving any vector clock conflicts that
-- arise.  A single invocation of this function may involve several
-- roundtrips to the server to resolve conflicts.
--
-- If any conflicts arise, a winner will be chosen in each case using
-- 'mconcat', and the winners will be stored; this will be repeated
-- until no conflicts occur.
putMany_ :: (FromJSON c, ToJSON c, Monoid c) =>
            Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
         -> IO ()
putMany_ = M.putMany_ J.putMany
{-# INLINE putMany_ #-}
