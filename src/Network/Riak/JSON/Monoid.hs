module Network.Riak.JSON.Monoid
    (
      get
    , getMany
    , put
    , putMany
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
-- a value, the 'Monoid' is used to choose a winner.
getMany :: (FromJSON c, ToJSON c, Monoid c)
           => Connection -> Bucket -> [Key] -> R -> IO [Maybe (c, VClock)]
getMany = M.getMany J.getMany
{-# INLINE getMany #-}

-- | Store a single value.  This function does not return until any
-- vector clock conflicts are resolved.
put :: (FromJSON c, ToJSON c, Monoid c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put = M.put J.put
{-# INLINE put #-}

-- | Store multiple values.  This function does not return until any
-- vector clock conflicts are resolved.
putMany :: (FromJSON c, ToJSON c, Monoid c) =>
           Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
        -> IO [(c, VClock)]
putMany = M.putMany J.putMany
{-# INLINE putMany #-}
