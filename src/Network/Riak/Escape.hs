{-# LANGUAGE OverloadedStrings #-}

-- |
-- Module:      Network.Riak.Connection
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Bryan O'Sullivan <bos@mailrank.com>
-- Stability:   experimental
-- Portability: portable
--
-- Support for REST-safe name handling.
--
-- Riak's protocol buffer (PBC) API will accept unescaped bucket,
-- link, and key names.  Its REST API does not unescape names, so it
-- is possible to use the PBC API to construct names that cannot be
-- accessed via the REST API (e.g. containing an embedded slash or
-- other URL-unsafe octet).

module Network.Riak.Escape
    (
      escape
    , unescape
    ) where

import Blaze.ByteString.Builder (fromByteString, toByteString)
import Blaze.ByteString.Builder.Word (fromWord8)
import Control.Applicative ((<$>))
import Data.Attoparsec as A
import Data.Bits ((.|.), (.&.), shiftL, shiftR)
import Data.ByteString (ByteString)
import Data.Monoid (mappend, mempty)
import qualified Data.ByteString as B
import qualified Data.ByteString.Unsafe as B

-- | URL-escape a string.
escape :: ByteString -> ByteString
escape = toByteString . B.foldl step mempty
  where
    step acc 32 = acc `mappend` fromWord8 43
    step acc w | literal w = acc `mappend` fromWord8 w
               | otherwise = acc `mappend` hex w
    literal w = w >= 97 && w <= 122 || w >= 65 && w <= 90 ||
                w >= 48 && w <= 57 || w `B.elem` "$-.!*'(),"
    hex w = fromWord8 37 `mappend` d (w `shiftR` 4) `mappend` d (w .&. 0xf)
    d n | n < 10    = fromWord8 (n + 48)
        | otherwise = fromWord8 (n + 87)

-- | URL-unescape a string.
unescapeP :: Parser ByteString
unescapeP = toByteString <$> go mempty
  where
    go acc  = do
      s <- A.takeWhile $ \w -> w /= 37 && w /= 43
      let rest = do
            w <- anyWord8
            if w == 43
              then go (acc `mappend` fromByteString s `mappend` fromWord8 32)
              else do
                h <- A.take 2
                let hex b | b >= 48 && b <= 57  = b - 48
                          | b >= 97 && b <= 102 = b - 87
                          | b >= 65 && b <= 70  = b - 55
                          | otherwise           = 255
                    hi = hex (B.unsafeIndex h 0)
                    lo = hex (B.unsafeIndex h 1)
                if hi .|. lo == 255
                  then fail "invalid hex escape"
                  else go (acc `mappend` fromByteString s `mappend`
                           fromWord8 (lo .|. (hi `shiftL` 4)))
      done <- atEnd
      if done
        then return (acc `mappend` fromByteString s)
        else rest

-- | URL-unescape a string.
unescape :: ByteString -> Either String ByteString
unescape s0 = eitherResult $ parse unescapeP s0 `feed` B.empty
