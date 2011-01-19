{-# LANGUAGE OverloadedStrings #-}

module Network.Riak.Content
    (
      unspecified
    , binary
    ) where

import qualified Data.ByteString.Lazy.Char8 as L
import qualified Data.Sequence as Seq
import Network.Riakclient.RpbContent
import Network.Riak.Types

unspecified :: Content
unspecified = RpbContent { value = L.empty
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
binary bs = unspecified { value = bs
                        , content_type = Just "application/octet-stream"
                        }
