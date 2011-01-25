{-# LANGUAGE RecordWildCards #-}

module Network.Riak.Monoid
    (
      V.IsContent(..)
    , V.JSON(plain)
    , V.json
    , get
    , getMany
    , put
    ) where

import Control.Arrow (first)
import Data.Monoid (Monoid(..))
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Network.Riak.Value as V

get :: (Monoid c, V.IsContent c) =>
       Connection -> Bucket -> Key -> R -> IO (Maybe (c, VClock))
get conn bucket key r = fmap (first mconcat) `fmap` V.get conn bucket key r

getMany :: (Monoid c, V.IsContent c) => Connection -> [(Bucket, Key)] -> R
        -> IO [Maybe (c, VClock)]
getMany conn bks r = map (fmap (first mconcat)) `fmap` V.getMany conn bks r

put :: (Monoid c, V.IsContent c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c -> W -> DW
    -> IO (c, VClock)
put conn bucket key mvclock0 val0 w dw = do
  let go val mvclock1 = do
        (xs, vclock) <- V.put conn bucket key mvclock1 val w dw
        case xs of
          [c] -> return (c, vclock)
          _   -> go (mconcat xs) (Just vclock)
  go val0 mvclock0
