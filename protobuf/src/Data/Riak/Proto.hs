module Data.Riak.Proto
  ( module Proto.Riak
  , module Proto.Riak_Fields
    -- ** Re-exports
  , Message
  , defMessage
  , decodeMessage
  , encodeMessage
  ) where

import Proto.Riak
import Proto.Riak_Fields

import Data.ProtoLens.Encoding (decodeMessage, encodeMessage)
import Data.ProtoLens.Message (Message, defMessage)
