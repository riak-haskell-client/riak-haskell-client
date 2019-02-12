{-# LANGUAGE FlexibleInstances, OverloadedStrings, CPP #-}

-- |
-- Module:      Network.Riak.Connection
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Tim McGilchrist <timmcgil@gmail.com>, Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
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
      Escape(..)
    , unescape
    ) where

import Blaze.ByteString.Builder (Builder, fromByteString, toByteString, toLazyByteString)
import Blaze.ByteString.Builder.Word (fromWord8)
#if __GLASGOW_HASKELL__ < 710
import Control.Applicative ((<$>))
#endif
import Data.Attoparsec.ByteString as A
import Data.Bits ((.|.), (.&.), shiftL, shiftR)
import Data.ByteString (ByteString)
#if __GLASGOW_HASKELL__ < 710
import Data.Monoid (mappend, mempty)
#endif
import Data.Text (Text)
import Data.Word (Word8)
import Data.Bifunctor (second, first)
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Unsafe as B
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TL

-- | The class of string-like types that can be URL-escaped and
-- unescaped.
class Escape e where
    -- | URL-escape a string.
    escape :: e -> ByteString
    -- | URL-unescape a string.
    unescape' :: ByteString -> Either String e

-- | URL-unescape a string that is presumed to be properly escaped.
-- If the string is invalid, an error will be thrown that cannot be
-- caught from pure code.
unescape :: Escape e => ByteString -> e
unescape bs = case unescape' bs of
                Left err -> error $ "Network.Riak.Escape.unescape: " ++ err
                Right v  -> v
{-# INLINE unescape #-}

instance Escape ByteString where
    escape = L.toStrict . toLazyByteString . B.foldl escapeWord8 mempty
    {-# INLINE escape #-}
    unescape' = A.eitherResult . A.parse (toByteString <$> unescapeBS)
    {-# INLINE unescape' #-}

instance Escape L.ByteString where
    escape = L.toStrict . toLazyByteString . L.foldl escapeWord8 mempty
    {-# INLINE escape #-}
    unescape' = A.eitherResult . A.parse (toLazyByteString <$> unescapeBS)
    {-# INLINE unescape' #-}

instance Escape Text where
    escape = escape . T.encodeUtf8
    {-# INLINE escape #-}
    unescape' = (>>= first show . T.decodeUtf8') . A.eitherResult . A.parse (toByteString <$> unescapeBS)
    {-# INLINE unescape' #-}

instance Escape TL.Text where
    escape = escape . TL.encodeUtf8
    {-# INLINE escape #-}
    unescape' = (>>= first show . TL.decodeUtf8') . A.eitherResult . A.parse (toLazyByteString <$> unescapeBS)
    {-# INLINE unescape' #-}

instance Escape [Char] where
    escape = escape . T.encodeUtf8 . T.pack
    {-# INLINE escape #-}
    unescape' = second T.unpack . unescape'
    {-# INLINE unescape' #-}

-- | URL-escape a byte from a bytestring.
escapeWord8 :: Builder -> Word8 -> Builder
escapeWord8 acc 32 = acc `mappend` fromWord8 43
escapeWord8 acc i
    | literal i = acc `mappend` fromWord8 i
    | otherwise = acc `mappend` hex i
  where
    literal w = w >= 97 && w <= 122 || w >= 65 && w <= 90 ||
                w >= 48 && w <= 57 || w `B.elem` "$-.!*'(),_"
    hex w = fromWord8 37 `mappend` d (w `shiftR` 4) `mappend` d (w .&. 0xf)
    d n | n < 10    = fromWord8 (n + 48)
        | otherwise = fromWord8 (n + 87)
{-# INLINE escapeWord8 #-}

-- | URL-unescape' a bytestring.
unescapeBS :: Parser Builder
unescapeBS = go mempty
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
