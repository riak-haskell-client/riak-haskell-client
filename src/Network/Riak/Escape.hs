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
import Control.Applicative ((<$>), (<|>))
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
unescape :: ByteString -> Either String ByteString
unescape s = eitherResult $ parse p s `feed` B.empty
  where
    p = toByteString <$> go (Right mempty)
    go (Right acc)  = do
      s <- A.takeWhile $ \w -> w /= 37 && w /= 43
      let rest = do
            w <- anyWord8
            if w == 43
              then go (Right (acc `mappend` fromByteString s `mappend`
                              fromWord8 32))
              else flip (<|>) (go (Left "short escape")) $ do
                h <- A.take 2
                let hex w | w >= 48 && w <= 57  = w - 48
                          | w >= 97 && w <= 102 = w - 87
                          | w >= 65 && w <= 70  = w - 55
                          | otherwise           = 255
                    hi = hex (B.unsafeIndex h 0)
                    lo = hex (B.unsafeIndex h 1)
                if hi .|. lo == 255
                  then go (Left "invalid hex escape")
                  else go (Right (acc `mappend` fromByteString s `mappend`
                                  fromWord8 (lo .|. (hi `shiftL` 4))))
      rest <|> return (acc `mappend` fromByteString s)
    go (Left err) = fail err
