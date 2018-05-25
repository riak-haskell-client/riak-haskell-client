{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE CPP #-}

-- |
-- Module:      Network.Riak.JSON
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
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
    , putIndexed
    , put_
    , putMany
    , putMany_
    ) where

#if __GLASGOW_HASKELL__ < 710
import Control.Applicative ((<$>))
#endif
import Control.Arrow (first)
import Data.Aeson.Types (FromJSON(..), ToJSON(..))
#if __GLASGOW_HASKELL__ < 710
import Data.Monoid (Monoid)
#endif
import Data.Semigroup (Semigroup)
import Data.Typeable (Typeable)
import Network.Riak.Types.Internal
import qualified Network.Riak.Value as V

newtype JSON a = J {
      plain :: a -- ^ Unwrap a 'JSON'-wrapped value.
    } deriving (Eq, Ord, Show, Read, Bounded, Typeable, Semigroup, Monoid)

-- | Wrap up a value so that it will be encoded and decoded as JSON
-- when converted to/from 'Content'.
json :: a -> JSON a
json = J
{-# INLINE json #-}

instance Functor JSON where
    fmap f (J a) = J (f a)
    {-# INLINE fmap #-}

instance (FromJSON a, ToJSON a) => V.IsContent (JSON a) where
    parseContent c = J `fmap` (V.parseContent c >>= parseJSON)
    {-# INLINE parseContent #-}

    toContent (J a) = V.toContent (toJSON a)
    {-# INLINE toContent #-}

-- | Retrieve a value.  This may return multiple conflicting siblings.
-- Choosing among them is your responsibility.
get :: (FromJSON c, ToJSON c) => Connection
    -> Maybe BucketType -> Bucket -> Key -> R
    -> IO (Maybe ([c], VClock))
get conn btype bucket' key' r = fmap convert <$> V.get conn btype bucket' key' r

getMany :: (FromJSON c, ToJSON c) => Connection
        -> Maybe BucketType -> Bucket -> [Key] -> R
        -> IO [Maybe ([c], VClock)]
getMany conn btype bucket' ks r = map (fmap convert) <$> V.getMany conn btype bucket' ks r

-- | Store a single value.  This may return multiple conflicting
-- siblings.  Choosing among them, and storing a new value, is your
-- responsibility.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored.
put :: (FromJSON c, ToJSON c) =>
       Connection -> Maybe BucketType -> Bucket -> Key -> Maybe VClock -> c
    -> W -> DW -> IO ([c], VClock)
put conn btype bucket' key' mvclock val w dw =
    convert <$> V.put conn btype bucket' key' mvclock (json val) w dw

-- | Store a single value indexed.
putIndexed :: (FromJSON c, ToJSON c)
           => Connection -> Maybe BucketType -> Bucket -> Key -> [IndexValue]
           -> Maybe VClock -> c
           -> W -> DW -> IO ([c], VClock)
putIndexed conn btype bucket' key' ixs mvclock val w dw =
    convert <$> V.putIndexed conn btype bucket' key' ixs mvclock (json val) w dw

-- | Store a single value, without the possibility of conflict
-- resolution.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored, and you will not be notified.
put_ :: (FromJSON c, ToJSON c) =>
       Connection -> Maybe BucketType -> Bucket -> Key -> Maybe VClock -> c
    -> W -> DW -> IO ()
put_ conn btype bucket' key' mvclock val w dw =
    V.put_ conn btype bucket' key' mvclock (json val) w dw

-- | Store many values.  This may return multiple conflicting siblings
-- for each value stored.  Choosing among them, and storing a new
-- value in each case, is your responsibility.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored.
putMany :: (FromJSON c, ToJSON c) =>
           Connection -> Maybe BucketType -> Bucket -> [(Key, Maybe VClock, c)]
        -> W -> DW -> IO [([c], VClock)]
putMany conn btype bucket' puts w dw =
    map convert <$> V.putMany conn btype bucket' (map f puts) w dw
  where f (k,v,c) = (k,v,json c)

-- | Store many values, without the possibility of conflict
-- resolution.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored, and you will not be notified.
putMany_ :: (FromJSON c, ToJSON c) =>
            Connection -> Maybe BucketType -> Bucket -> [(Key, Maybe VClock, c)]
         -> W -> DW -> IO ()
putMany_ conn btype bucket' puts w dw = V.putMany_ conn btype bucket' (map f puts) w dw
  where f (k,v,c) = (k,v,json c)

convert :: ([JSON a], VClock) -> ([a], VClock)
convert = first (map plain)
