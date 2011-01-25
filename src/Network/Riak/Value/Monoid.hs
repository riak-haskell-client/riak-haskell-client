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

get :: (Monoid c, V.IsContent c) =>
       Connection -> Bucket -> Key -> R -> IO (Maybe (c, VClock))
get = M.get V.get
{-# INLINE get #-}

getMany :: (Monoid c, V.IsContent c) => Connection -> Bucket -> [Key] -> R
        -> IO [Maybe (c, VClock)]
getMany = M.getMany V.getMany
{-# INLINE getMany #-}

put :: (Monoid c, V.IsContent c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put = M.put V.put 
{-# INLINE put #-}

putMany :: (Monoid c, V.IsContent c) =>
           Connection -> Bucket -> [(Key, Maybe VClock, c)] -> W -> DW
        -> IO [(c, VClock)]
putMany = M.putMany V.putMany
{-# INLINE putMany #-}
