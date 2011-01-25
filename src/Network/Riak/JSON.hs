{-# LANGUAGE DeriveDataTypeable, GeneralizedNewtypeDeriving #-}

module Network.Riak.JSON
    (
      JSON(plain)
    , json
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
import qualified Data.Aeson.Types as Aeson
import qualified Network.Riak.Value as V

newtype JSON a = J {
      plain :: a
    } deriving (Eq, Ord, Show, Read, Bounded, Typeable, Monoid)

json :: (Aeson.FromJSON a, Aeson.ToJSON a) => a -> JSON a
json = J
{-# INLINE json #-}

instance Functor JSON where
    fmap f (J a) = J (f a)
    {-# INLINE fmap #-}

instance (Aeson.FromJSON a, Aeson.ToJSON a) => V.IsContent (JSON a) where
    fromContent c = J `fmap` (V.fromContent c >>= Aeson.fromJSON)
    {-# INLINE fromContent #-}

    toContent (J a) = V.toContent (Aeson.toJSON a)
    {-# INLINE toContent #-}

get :: (Aeson.FromJSON c, Aeson.ToJSON c) => Connection -> Bucket -> Key -> R
    -> IO (Maybe ([c], VClock))
get conn bucket key r = fmap convert <$> V.get conn bucket key r

getMany :: (Aeson.FromJSON c, Aeson.ToJSON c) => Connection -> Bucket -> [Key] -> R
    -> IO [Maybe ([c], VClock)]
getMany conn bucket ks r = map (fmap convert) <$> V.getMany conn bucket ks r

put :: (Aeson.FromJSON c, Aeson.ToJSON c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c
    -> W -> DW -> IO ([c], VClock)
put conn bucket key mvclock val w dw =
    convert <$> V.put conn bucket key mvclock (json val) w dw

put_ :: (Aeson.FromJSON c, Aeson.ToJSON c) =>
       Connection -> Bucket -> Key -> Maybe VClock -> c
    -> W -> DW -> IO ()
put_ conn bucket key mvclock val w dw =
    V.put_ conn bucket key mvclock (json val) w dw

putMany :: (Aeson.FromJSON c, Aeson.ToJSON c) =>
       Connection -> Bucket -> [(Key, Maybe VClock, c)]
    -> W -> DW -> IO [([c], VClock)]
putMany conn bucket puts w dw =
    map convert <$> V.putMany conn bucket (map f puts) w dw
  where f (k,v,c) = (k,v,json c)

putMany_ :: (Aeson.FromJSON c, Aeson.ToJSON c) =>
            Connection -> Bucket -> [(Key, Maybe VClock, c)]
         -> W -> DW -> IO ()
putMany_ conn bucket puts w dw = V.putMany_ conn bucket (map f puts) w dw
  where f (k,v,c) = (k,v,json c)

convert :: ([JSON a], VClock) -> ([a], VClock)
convert = first (map plain)
