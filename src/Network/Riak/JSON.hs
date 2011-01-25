{-# LANGUAGE DeriveDataTypeable, GeneralizedNewtypeDeriving #-}

-- |
-- Module:      Network.Riak.JSON
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Bryan O'Sullivan <bos@mailrank.com>
-- Stability:   experimental
-- Portability: portable
--
-- This module allows storage and retrieval of JSON-encoded data.
--
-- The functions in this module do not perform any conflict resolution.

module Network.Riak.JSON
    (
      JSON
    , json
    , plain
    , get
    , getMany
    , put
    , put_
    , putMany
    , putMany_
    ) where

import Control.Applicative ((<$>))
import Control.Arrow (first)
import Data.Monoid (Monoid)
import Data.Typeable (Typeable)
import Network.Riak.Types.Internal
import Data.Aeson.Types (FromJSON(..), ToJSON(..))
import qualified Network.Riak.Value as V

newtype JSON a = J {
      plain :: a -- ^ Unwrap a 'JSON'-wrapped value.
    } deriving (Eq, Ord, Show, Read, Bounded, Typeable, Monoid)

-- | Wrap up a value so that it will be encoded and decoded as JSON
-- when converted to/from 'Content'.
json :: (FromJSON a, ToJSON a) => a -> JSON a
json = J
{-# INLINE json #-}

instance Functor JSON where
    fmap f (J a) = J (f a)
    {-# INLINE fmap #-}

instance (FromJSON a, ToJSON a) => V.IsContent (JSON a) where
    fromContent c = J `fmap` (V.fromContent c >>= fromJSON)
    {-# INLINE fromContent #-}

    toContent (J a) = V.toContent (toJSON a)
    {-# INLINE toContent #-}

get :: (FromJSON c, ToJSON c) => Connection -> Bucket -> Key -> R
    -> IO (Maybe ([c], VClock))
get conn bucket key r = fmap convert <$> V.get conn bucket key r

getMany :: (FromJSON c, ToJSON c) => Connection -> Bucket -> [Key] -> R
    -> IO [Maybe ([c], VClock)]
getMany conn bucket ks r = map (fmap convert) <$> V.getMany conn bucket ks r

put :: (FromJSON c, ToJSON c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c
    -> W -> DW -> IO ([c], VClock)
put conn bucket key mvclock val w dw =
    convert <$> V.put conn bucket key mvclock (json val) w dw

put_ :: (FromJSON c, ToJSON c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c
    -> W -> DW -> IO ()
put_ conn bucket key mvclock val w dw =
    V.put_ conn bucket key mvclock (json val) w dw

putMany :: (FromJSON c, ToJSON c) =>
       Connection -> Bucket -> [(Key, Maybe VClock, c)]
    -> W -> DW -> IO [([c], VClock)]
putMany conn bucket puts w dw =
    map convert <$> V.putMany conn bucket (map f puts) w dw
  where f (k,v,c) = (k,v,json c)

putMany_ :: (FromJSON c, ToJSON c) =>
            Connection -> Bucket -> [(Key, Maybe VClock, c)]
         -> W -> DW -> IO ()
putMany_ conn bucket puts w dw = V.putMany_ conn bucket (map f puts) w dw
  where f (k,v,c) = (k,v,json c)

convert :: ([JSON a], VClock) -> ([a], VClock)
convert = first (map plain)
