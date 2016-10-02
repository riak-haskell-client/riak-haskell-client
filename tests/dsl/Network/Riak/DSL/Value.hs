module Network.Riak.DSL.Value
  ( -- Riak Value API
    getByIndex
  ) where

import Network.Riak.DSL (Riak, RiakF(..))

import Control.Monad.Trans.Free (liftF)
import Network.Riak.Types

getByIndex :: Bucket -> IndexQuery -> Riak [Key]
getByIndex a b = liftF (GetByIndexValue a b id)
