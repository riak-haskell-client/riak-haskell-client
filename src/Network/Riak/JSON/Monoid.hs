{-# LANGUAGE RecordWildCards #-}

module Network.Riak.JSON.Monoid
    (
      get
    , getMany
    , put
    ) where

import Control.Arrow (first)
import Data.Monoid (Monoid(..))
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Data.Aeson.Types as Aeson
import qualified Network.Riak.JSON as J

get :: (Aeson.FromJSON c, Aeson.ToJSON c, Monoid c) =>
       Connection -> Bucket -> Key -> R -> IO (Maybe (c, VClock))
get conn bucket key r = fmap (first mconcat) `fmap` J.get conn bucket key r
{-# INLINE get #-}

getMany :: (Aeson.FromJSON c, Aeson.ToJSON c, Monoid c)
           => Connection -> Bucket -> [Key] -> R
        -> IO [Maybe (c, VClock)]
getMany conn b ks r = map (fmap (first mconcat)) `fmap` J.getMany conn b ks r
{-# INLINE getMany #-}

put :: (Aeson.FromJSON c, Aeson.ToJSON c, Monoid c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put conn bucket key mvclock0 val0 w dw = do
  let go val mvclock1 = do
        (xs, vclock) <- J.put conn bucket key mvclock1 val w dw
        case xs of
          [c] -> return (c, vclock)
          _   -> go (mconcat xs) (Just vclock)
  go val0 mvclock0
