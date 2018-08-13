-- |
-- Module:      Network.Riak.Functions
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Tim McGilchrist <timmcgil@gmail.com>, Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
-- Stability:   experimental
-- Portability: portable
--
-- Useful functions.

module Network.Riak.Functions
    (
      strict
    , lazy
    ) where

import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Internal as L

strict :: L.ByteString -> B.ByteString
strict = B.concat . L.toChunks
{-# INLINE strict #-}

lazy :: B.ByteString -> L.ByteString
lazy s | B.null s  = L.Empty
       | otherwise = L.Chunk s L.Empty
{-# INLINE lazy #-}
