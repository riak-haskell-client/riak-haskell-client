{-# LANGUAGE OverloadedStrings #-}

-- |
-- Module:      Network.Riak.Content
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
-- Stability:   experimental
-- Portability: portable
--
-- Low-level content and link types and functions.

module Network.Riak.Content
    (
    -- * Types
      Proto.RpbContent
    , Proto.RpbLink
    -- * Functions
    , empty
    , binary
    , json
    , link
    ) where

import Data.Aeson (encode)
import Data.Aeson.Types (ToJSON)
import Data.ByteString (ByteString)
import qualified Data.ByteString.Lazy as LazyByteString
import qualified Data.Riak.Proto as Proto
import Network.Riak.Lens
import Network.Riak.Types.Internal (Bucket, Key, Tag)

-- | Create a link.
link :: Bucket -> Key -> Tag -> Proto.RpbLink
link bucket key tag = Proto.defMessage
                        & Proto.bucket .~ bucket
                        & Proto.key .~ key
                        & Proto.tag .~ tag
{-# INLINE link #-}

-- | An empty piece of content.
empty :: Proto.RpbContent
empty = Proto.defMessage

-- | Content encoded as @application/octet-stream@.
binary :: ByteString -> Proto.RpbContent
binary bs = empty & Proto.value .~ bs
                  & Proto.contentType .~ "application/octet-stream"

-- | Content encoded as @application/json@.
json :: ToJSON a => a -> Proto.RpbContent
json j = empty & Proto.value .~ LazyByteString.toStrict (encode j)
               & Proto.contentType .~ "application/json"
