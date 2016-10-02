{-# LANGUAGE LambdaCase    #-}
{-# LANGUAGE TypeOperators #-}

module Network.Riak.DSL
  ( -- * Riak DSL
    Riak
  , RiakF
    -- * Interpreters
  , execute
  , rollback
  ) where

import Data.Alacarte

import qualified Network.Riak.DSL.Basic  as Basic
import qualified Network.Riak.DSL.JSON   as JSON
import qualified Network.Riak.DSL.Value  as Value

import Control.Exception                (finally)
import Control.Monad.Trans.Free
import Data.Aeson                       (FromJSON, ToJSON)
import Data.Sequence                    (Seq)
import Network.Riak.Content             (Content)
import Network.Riak.Types
import Network.Riak.Protocol.ServerInfo (ServerInfo)

-- | The 'RiakF' functor is simply the sum of the underlying Riak
-- "sub-languages".
type RiakF = Basic.RiakF :+: JSON.RiakF :+: Value.RiakF

type Riak a = FreeT RiakF IO a

-- | Interpret a 'Riak' expression in 'IO'.
execute :: Connection -> Riak a -> IO a
execute conn = iterT phi
  where
    phi :: RiakF (IO a) -> IO a
    phi = \case
      InL f       -> Basic.executeAlg conn f
      InR (InL f) -> JSON.executeAlg  conn f
      InR (InR f) -> Value.executeAlg conn f

-- | Interpret a 'Riak' expression in 'IO', and attempt to roll back the cluster
-- to the state it was in prior to execution.
rollback :: Connection -> Riak a -> IO a
rollback conn = iterT phi
  where
    phi :: RiakF (IO a) -> IO a
    phi = \case
      InL f       -> Basic.rollbackAlg conn f
      InR (InL f) -> JSON.rollbackAlg  conn f
      InR (InR f) -> Value.rollbackAlg conn f
