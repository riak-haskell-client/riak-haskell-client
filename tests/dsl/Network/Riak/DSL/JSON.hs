module Network.Riak.DSL.JSON
  ( -- * Riak JSON DSL
    putIndexed
  ) where

import Network.Riak.DSL (Riak, RiakF(..))

import Control.Monad.Trans.Free (liftF)
import Data.Aeson               (FromJSON, ToJSON)
import Network.Riak.Types


--------------------------------------------------------------------------------
-- Riak JSON DSL

putIndexed
  :: (FromJSON c, ToJSON c)
  => Maybe BucketType -> Bucket -> Key -> [IndexValue] -> Maybe VClock -> c -> W
  -> DW -> Riak ([c], VClock)
putIndexed a b c d e f g h = liftF (PutIndexedJSON a b c d e f g h id)
