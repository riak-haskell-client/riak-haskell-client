{-# LANGUAGE GeneralizedNewtypeDeriving, OverloadedStrings, RecordWildCards,
    StandaloneDeriving #-}

-- |
-- Module:      Network.Riak.Value
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Mark Hibberd <mark@hibberd.id.au>, Nathan Hunter <nhunter@janrain.com>
-- Stability:   experimental
-- Portability: portable
--
-- This module allows storage and retrieval of data using the
-- 'IsContent' typeclass.  This provides access to more of Riak's
-- storage features than JSON, e.g. links.
--
-- The functions in this module do not perform any conflict resolution.

module Network.Riak.Value
    (
      IsContent(..)
    , fromContent
    , get
    , getMany
    , getByIndex
    , addIndexes
    , put
    , putIndexed
    , put_
    , putMany
    , putMany_
    ) where

import Control.Applicative
import Data.Aeson.Types (Parser, Result(..), parse)
import Data.Monoid ((<>))
import Network.Riak.Connection.Internal
import Network.Riak.Lens
import Network.Riak.Resolvable (ResolvableMonoid(..))
import Network.Riak.Response (unescapeLinks)
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Data.Riak.Proto as Proto
import qualified Data.Aeson as Aeson (eitherDecodeStrict)
import qualified Data.Aeson.Types as Aeson
import qualified Data.ByteString as L
import qualified Data.ByteString.Char8 as CL8
import qualified Network.Riak.Content as C
import qualified Network.Riak.Request as Req

fromContent :: IsContent c => Proto.RpbContent -> Maybe c
fromContent c = case parse parseContent c of
                  Success a -> Just a
                  Error _   -> Nothing

class IsContent c where
    parseContent :: Proto.RpbContent -> Parser c
    toContent :: c -> Proto.RpbContent

instance IsContent Proto.RpbContent where
    parseContent = return
    {-# INLINE parseContent #-}

    toContent v = v
    {-# INLINE toContent #-}

instance IsContent () where
    parseContent c | c == C.empty = pure ()
                   | otherwise    = empty
    {-# INLINE parseContent #-}

    toContent _ = C.empty
    {-# INLINE toContent #-}

instance IsContent Aeson.Value where
    parseContent c | c ^. Proto.maybe'contentType == Just "application/json" =
                      case Aeson.eitherDecodeStrict (c ^. Proto.value) of
                        Left err -> fail err
                        Right a -> return a
                   | otherwise = fail "non-JSON document"
    toContent = C.json
    {-# INLINE toContent #-}

deriving instance (IsContent a) => IsContent (ResolvableMonoid a)

-- | Add indexes to a content value for a further put request.
addIndexes :: [IndexValue] -> Proto.RpbContent -> Proto.RpbContent
addIndexes ix c =
    c & Proto.indexes .~ (map toPair ix)
  where
    toPair :: IndexValue -> Proto.RpbPair
    toPair (IndexInt k v) = Proto.defMessage
                              & Proto.key .~ (k <> "_int")
                              & Proto.value .~ (CL8.pack . show $ v)
    toPair (IndexBin k v) = Proto.defMessage
                              & Proto.key .~ (k <> "_bin")
                              & Proto.value .~ v

-- | Store a single value.  This may return multiple conflicting
-- siblings.  Choosing among them, and storing a new value, is your
-- responsibility.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored.
put :: (IsContent c) => Connection
    -> Maybe BucketType -> Bucket -> Key -> Maybe VClock -> c
    -> W -> DW -> IO ([c], VClock)
put conn btype bucket key mvclock val w dw =
  putResp =<< exchange conn
              (Req.put btype bucket key mvclock (toContent val) w dw True)

-- | Store an indexed value.
putIndexed :: (IsContent c) => Connection -> Maybe BucketType -> Bucket -> Key
           -> [IndexValue]
           -> Maybe VClock -> c
           -> W -> DW -> IO ([c], VClock)
putIndexed conn bt b k inds mvclock val w dw =
    putResp =<< exchange conn
                  (Req.put bt b k mvclock (addIndexes inds (toContent val))
                      w dw True)

-- | Store many values.  This may return multiple conflicting siblings
-- for each value stored.  Choosing among them, and storing a new
-- value in each case, is your responsibility.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored.
putMany :: (IsContent c) => Connection
        -> Maybe BucketType -> Bucket -> [(Key, Maybe VClock, c)]
        -> W -> DW -> IO [([c], VClock)]
putMany conn bt b puts w dw =
  mapM putResp =<< pipeline conn (map (\(k,v,c) -> Req.put bt b k v (toContent c) w dw True) puts)

putResp :: (IsContent c) => Proto.RpbPutResp -> IO ([c], VClock)
putResp response = do
  case response ^. Proto.maybe'vclock of
    Nothing -> return ([], VClock L.empty)
    Just s  -> do
      c <- convert (response ^. Proto.content)
      return (c, VClock s)

-- | Store a single value, without the possibility of conflict
-- resolution.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored, and you will not be notified.
put_ :: (IsContent c) => Connection
     -> Maybe BucketType -> Bucket -> Key -> Maybe VClock -> c
     -> W -> DW -> IO ()
put_ conn btype bucket key mvclock val w dw =
  exchange_ conn (Req.put btype bucket key mvclock (toContent val) w dw False)

-- | Store many values, without the possibility of conflict
-- resolution.
--
-- You should /only/ supply 'Nothing' as a 'T.VClock' if you are sure
-- that the given type+bucket+key combination does not already exist.
-- If you omit a 'T.VClock' but the type+bucket+key /does/ exist, your
-- value will not be stored, and you will not be notified.
putMany_ :: (IsContent c) => Connection
         -> Maybe BucketType -> Bucket -> [(Key, Maybe VClock, c)]
         -> W -> DW -> IO ()
putMany_ conn bt b puts w dw =
  pipeline_ conn . map (\(k,v,c) -> Req.put bt b k v (toContent c) w dw False) $ puts

-- | Retrieve a value.  This may return multiple conflicting siblings.
-- Choosing among them is your responsibility.
get :: (IsContent c) => Connection -> Maybe BucketType -> Bucket -> Key -> R
    -> IO (Maybe ([c], VClock))
get conn btype bucket key r = getResp =<< exchangeMaybe conn (Req.get btype bucket key r)

-- | Retrieve list of keys matching some index query.
getByIndex :: Connection -> Bucket -> IndexQuery
           -> IO [Key]
getByIndex conn b indq =
    getByIndexResp =<< exchangeMaybe conn (Req.getByIndex b indq)

getMany :: (IsContent c) => Connection
        -> Maybe BucketType -> Bucket -> [Key] -> R
        -> IO [Maybe ([c], VClock)]
getMany conn bt b ks r =
    mapM getResp =<< pipelineMaybe conn (map (\k -> Req.get bt b k r) ks)

getResp :: (IsContent c) => Maybe Proto.RpbGetResp -> IO (Maybe ([c], VClock))
getResp resp =
  case resp of
    Just resp' ->
      case resp' ^. Proto.maybe'vclock of
        Just s -> do
           c <- convert (resp' ^. Proto.content)
           return $ Just (c, VClock s)
        _ -> return Nothing
    _ -> return Nothing

getByIndexResp :: Maybe Proto.RpbIndexResp -> IO [Key]
getByIndexResp resp =
    case resp of
      Just resp' -> return (resp' ^. Proto.keys)
      Nothing -> return []

convert :: IsContent v => [Proto.RpbContent] -> IO [v]
convert = go [] []
    where go cs vs (x:xs) = case fromContent y of
                              Just v -> go cs (v:vs) xs
                              _      -> go (y:cs) vs xs
              where y = unescapeLinks x
          go [] vs _      = return (reverse vs)
          go cs _  _      = typeError "Network.Riak.Value" "convert" $
                            show (length cs) ++ " values failed conversion: " ++
                            show cs
