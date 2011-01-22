{-# LANGUAGE OverloadedStrings #-}

module Network.Riak.Content
    (
      Content(..)
    , Link.Link(..)
    , empty
    , binary
    , json
    , link
    ) where

import qualified Data.ByteString.Lazy.Char8 as L
import qualified Data.Sequence as Seq
import Network.Riak.Protocol.Content (Content(..))
import qualified Network.Riak.Protocol.Link as Link
import Network.Riak.Types.Internal
import Data.Aeson.Encode
import Data.Aeson.Types

link :: Bucket -> Key -> Tag -> Link.Link
link bucket key tag = Link.Link (Just bucket) (Just key) (Just tag)
{-# INLINE link #-}

empty :: Content
empty = Content { value = L.empty
                , content_type = Nothing
                , charset = Nothing
                , content_encoding = Nothing
                , vtag = Nothing
                , links = Seq.empty
                , last_mod = Nothing
                , last_mod_usecs = Nothing
                , usermeta = Seq.empty
                }

binary :: L.ByteString -> Content
binary bs = empty { value = bs
                  , content_type = Just "application/octet-stream"
                  }

json :: ToJSON a => a -> Content
json j = empty { value = encode j
               , content_type = Just "application/json"
               }
