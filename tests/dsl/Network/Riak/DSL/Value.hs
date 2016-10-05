{-# LANGUAGE ConstraintKinds  #-}
{-# LANGUAGE DeriveFunctor    #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase       #-}
{-# LANGUAGE TypeOperators    #-}

module Network.Riak.DSL.Value
  ( -- Riak Value DSL
    RiakF(..)
  , getByIndex
    -- * Riak Value interpreters
  , executeAlg
  , rollbackAlg
  ) where

import Data.Alacarte

import Control.Monad.Trans.Free
import Network.Riak.Types

import qualified Network.Riak.Value as Value


--------------------------------------------------------------------------------
-- Riak JSON DSL

data RiakF a
  = GetByIndex Bucket IndexQuery ([Key] -> a)
  deriving Functor

type C f m = (RiakF :<: f, Monad m)

getByIndex :: C f m => Bucket -> IndexQuery -> FreeT f m [Key]
getByIndex a b = liftF (inj (GetByIndex a b id))


--------------------------------------------------------------------------------
-- Interpreters

executeAlg :: Connection -> RiakF (IO a) -> IO a
executeAlg conn = \case
  GetByIndex a b k -> Value.getByIndex conn a b >>= k

rollbackAlg :: Connection -> RiakF (IO a) -> IO a
rollbackAlg = executeAlg
