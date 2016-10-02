{-# LANGUAGE ConstraintKinds           #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE LambdaCase                #-}
{-# LANGUAGE TypeOperators             #-}

module Network.Riak.DSL.JSON
  ( -- * Riak JSON DSL
    RiakF(..)
  , putIndexed
    -- * Riak JSON interpreters
  , executeAlg
  , rollbackAlg
  ) where

import Data.Alacarte

import Control.Exception        (finally)
import Control.Monad.Trans.Free
import Data.Aeson               (FromJSON, ToJSON)
import Network.Riak.Types

import qualified Network.Riak.Basic as Basic
import qualified Network.Riak.JSON  as JSON

--------------------------------------------------------------------------------
-- Riak JSON DSL

data RiakF a
  = forall c. (FromJSON c, ToJSON c) =>
    PutIndexed (Maybe BucketType) Bucket Key [IndexValue] (Maybe VClock) c W DW
      (([c], VClock) -> a)

instance Functor RiakF where
  fmap f = \case
    PutIndexed a b c d e g h i k -> PutIndexed a b c d e g h i (f . k)

type C f m = (RiakF :<: f, Monad m)

putIndexed
  :: (C f m, FromJSON c, ToJSON c)
  => Maybe BucketType -> Bucket -> Key -> [IndexValue] -> Maybe VClock -> c -> W
  -> DW -> FreeT f m ([c], VClock)
putIndexed a b c d e f g h = liftF (inj (PutIndexed a b c d e f g h id))


--------------------------------------------------------------------------------
-- Interpreters

executeAlg :: Connection -> RiakF (IO a) -> IO a
executeAlg conn = \case
  PutIndexed a b c d e f g h k -> JSON.putIndexed conn a b c d e f g h >>= k

rollbackAlg :: Connection -> RiakF (IO a) -> IO a
rollbackAlg conn = \case
  act@(PutIndexed a b c _ _ _ _ _ _) ->
    executeAlg conn act
      `finally` Basic.delete conn a b c All
