-- |   module:    Network.Riak.CRDT.Request
--     copyright: (c) 2016 Sentenai
--     author:    Antonio Nikishaev <me@lelf.lu>
--     license:   Apache
-- 
module Network.Riak.CRDT.Request
    (get, counterUpdate, setUpdate, mapUpdate) where

import qualified Network.Riak.Protocol.DtFetchRequest as DtFetch
import qualified Network.Riak.Protocol.DtUpdateRequest as DtUpdate
import qualified Network.Riak.Protocol.DtOp as DtOp
import Network.Riak.CRDT.Ops
import qualified Network.Riak.CRDT.Types as CRDT
import Network.Riak.Types

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
