{-# LANGUAGE OverloadedStrings, RecordWildCards #-}

module Network.Riak.Value
    (
      IsContent(..)
    , get
    , getMany
    , put
    , put_
    , putMany
    , putMany_
    ) where

import Data.Attoparsec.Lazy (maybeResult, parse)
import Data.Foldable (toList)
import Network.Riak.Connection.Internal
import Network.Riak.Protocol.Content (Content(..))
import Network.Riak.Protocol.GetResponse (GetResponse(..))
import Network.Riak.Protocol.PutResponse (PutResponse(..))
import Network.Riak.Types.Internal hiding (MessageTag(..))
import qualified Data.Aeson.Parser as Aeson
import qualified Data.Aeson.Types as Aeson
import qualified Data.ByteString.Lazy as L
import qualified Data.Sequence as Seq
import qualified Network.Riak.Content as C
import qualified Network.Riak.Request as Req

class IsContent c where
    fromContent :: Content -> Maybe c
    toContent :: c -> Content

instance IsContent Content where
    fromContent = Just
    {-# INLINE fromContent #-}

    toContent v = v
    {-# INLINE toContent #-}

instance IsContent () where
    fromContent c | c == C.empty = Just ()
                  | otherwise    = Nothing
    {-# INLINE fromContent #-}

    toContent _ = C.empty
    {-# INLINE toContent #-}

instance IsContent Aeson.Value where
    fromContent c | content_type c == Just "application/json" =
                      maybeResult (parse Aeson.json (value c))
                  | otherwise = Nothing

    toContent = C.json
    {-# INLINE toContent #-}

put :: (IsContent c) => Connection -> Bucket -> Key -> Maybe VClock -> c
    -> W -> DW -> IO ([c], VClock)
put conn bucket key mvclock val w dw =
  putResp =<< exchange conn
              (Req.put bucket key mvclock (toContent val) w dw True)

putMany :: (IsContent c) => Connection -> Bucket -> [(Key, Maybe VClock, c)]
        -> W -> DW -> IO [([c], VClock)]
putMany conn b puts w dw =
  mapM putResp =<< pipeline conn (map (\(k,v,c) -> Req.put b k v (toContent c) w dw True) puts)

putResp :: (IsContent c) => PutResponse -> IO ([c], VClock)
putResp PutResponse{..} = do
  case vclock of
    Nothing -> return ([], VClock L.empty)
    Just s  -> do
      c <- convert content
      return (c, VClock s)

put_ :: (IsContent c) => Connection -> Bucket -> Key -> Maybe VClock -> c
    -> W -> DW -> IO ()
put_ conn bucket key mvclock val w dw =
  exchange_ conn (Req.put bucket key mvclock (toContent val) w dw False)

putMany_ :: (IsContent c) => Connection -> Bucket -> [(Key, Maybe VClock, c)]
         -> W -> DW -> IO ()
putMany_ conn b puts w dw =
  pipeline_ conn . map (\(k,v,c) -> Req.put b k v (toContent c) w dw False) $ puts

get :: (IsContent c) => Connection -> Bucket -> Key -> R
    -> IO (Maybe ([c], VClock))
get conn bucket key r = getResp =<< exchangeMaybe conn (Req.get bucket key r)

getMany :: (IsContent c) => Connection -> Bucket -> [Key] -> R
        -> IO [Maybe ([c], VClock)]
getMany conn b ks r =
    mapM getResp =<< pipelineMaybe conn (map (\k -> Req.get b k r) ks)

getResp :: (IsContent c) => Maybe GetResponse -> IO (Maybe ([c], VClock))
getResp resp =
  case resp of
    Just (GetResponse content (Just s)) -> do
      c <- convert content
      return $ Just (c, VClock s)
    _   -> return Nothing

convert :: IsContent v => Seq.Seq Content -> IO [v]
convert = go [] [] . toList
    where go cs vs (x:xs) = case fromContent x of
                              Just v -> go cs (v:vs) xs
                              _      -> go (x:cs) vs xs
          go [] vs _      = return (reverse vs)
          go cs _  _      = typeError "Network.Riak.Value" "convert" $
                            show (length cs) ++ " values failed conversion: " ++
                            show cs
