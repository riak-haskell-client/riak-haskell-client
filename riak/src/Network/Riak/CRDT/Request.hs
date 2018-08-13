-- |
-- Module:      Network.Riak.CRDT.Request
-- Copyright:   (c) 2016 Sentenai
-- Author:      Antonio Nikishaev <me@lelf.lu>
-- License:     Apache
-- Maintainer:  Tim McGilchrist <timmcgil@gmail.com>, Mark Hibberd <mark@hibberd.id.au>
-- Stability:   experimental
-- Portability: portable
--
module Network.Riak.CRDT.Request (
    get
  , counterUpdate
  , setUpdate
  , mapUpdate
  ) where

import           Data.ByteString.Lazy (ByteString)
import           Network.Riak.CRDT.Ops
import qualified Network.Riak.CRDT.Types as CRDT
import qualified Network.Riak.Protocol.DtFetchRequest as DtFetch
import qualified Network.Riak.Protocol.DtOp as DtOp
import qualified Network.Riak.Protocol.DtUpdateRequest as DtUpdate
import           Network.Riak.Types

counterUpdate :: [CRDT.CounterOp]
              -> BucketType -> Bucket -> Key
              -> DtUpdate.DtUpdateRequest
counterUpdate ops = update (counterUpdateOp ops)

setUpdate :: [CRDT.SetOp]
          -> BucketType -> Bucket -> Key
          -> DtUpdate.DtUpdateRequest
setUpdate ops = update (setUpdateOp ops)

mapUpdate :: [CRDT.MapOp]
          -> BucketType -> Bucket -> Key
          -> DtUpdate.DtUpdateRequest
mapUpdate ops = update (mapUpdateOp ops)

update :: DtOp.DtOp -> BucketType -> Bucket -> Key -> DtUpdate.DtUpdateRequest
update op t b k = DtUpdate.DtUpdateRequest {
                    DtUpdate.bucket = b,
                    DtUpdate.key = Just k,
                    DtUpdate.type' = t,
                    DtUpdate.context = Nothing,
                    DtUpdate.op = op,
                    DtUpdate.w = Nothing,
                    DtUpdate.dw = Nothing,
                    DtUpdate.pw = Nothing,
                    DtUpdate.return_body = Nothing,
                    DtUpdate.timeout = Nothing,
                    DtUpdate.sloppy_quorum = Nothing,
                    DtUpdate.n_val = Nothing,
                    DtUpdate.include_context = Nothing
                  }

get :: ByteString -> ByteString -> ByteString -> DtFetch.DtFetchRequest
get t b k = DtFetch.DtFetchRequest {
              DtFetch.bucket = b,
              DtFetch.key = k,
              DtFetch.type' = t,
              DtFetch.r = Nothing,
              DtFetch.pr = Nothing,
              DtFetch.basic_quorum = Nothing,
              DtFetch.notfound_ok = Nothing,
              DtFetch.timeout = Nothing,
              DtFetch.sloppy_quorum = Nothing,
              DtFetch.n_val = Nothing,
              DtFetch.include_context = Nothing
            }
