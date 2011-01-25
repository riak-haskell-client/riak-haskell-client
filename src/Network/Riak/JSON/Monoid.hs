module Network.Riak.JSON.Monoid
    (
      get
    , getMany
    , put
    , putMany
    ) where

import Data.Monoid (Monoid(..))
import Network.Riak.Types.Internal hiding (MessageTag(..))
import Data.Aeson.Types (FromJSON, ToJSON)
import qualified Network.Riak.JSON as J
import qualified Network.Riak.Monoid as M

get :: (FromJSON c, ToJSON c, Monoid c) =>
       Connection -> Bucket -> Key -> R -> IO (Maybe (c, VClock))
get = M.get J.get
{-# INLINE get #-}

getMany :: (FromJSON c, ToJSON c, Monoid c)
           => Connection -> Bucket -> [Key] -> R
        -> IO [Maybe (c, VClock)]
getMany = M.getMany J.getMany
{-# INLINE getMany #-}

put :: (FromJSON c, ToJSON c, Monoid c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put = M.put J.put
{-# INLINE put #-}

putMany :: (FromJSON c, ToJSON c, Monoid c) =>
           Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
        -> IO [(c, VClock)]
putMany = M.putMany J.putMany
{-# INLINE putMany #-}
