-- |
-- Module:      Network.Riak.CRDT.Request
-- Copyright:   (c) 2016 Sentenai
-- Author:      Antonio Nikishaev <me@lelf.lu>
-- License:     Apache
-- Maintainer:  Tim McGilchrist <timmcgil@gmail.com>, Mark Hibberd <mark@hibberd.id.au>
-- Stability:   experimental
-- Portability: portable
module Network.Riak.CRDT.Request
  ( get,
    counterUpdate,
    setUpdate,
    mapUpdate,
  )
where

import Data.ByteString (ByteString)
import qualified Data.Riak.Proto as Proto
import Network.Riak.CRDT.Ops
import qualified Network.Riak.CRDT.Types as CRDT
import Network.Riak.Escape (escape)
import Network.Riak.Lens
import Network.Riak.Types

counterUpdate ::
  [CRDT.CounterOp] ->
  BucketType ->
  Bucket ->
  Key ->
  Proto.DtUpdateReq
counterUpdate ops = update (counterUpdateOp ops)

setUpdate ::
  [CRDT.SetOp] ->
  BucketType ->
  Bucket ->
  Key ->
  Proto.DtUpdateReq
setUpdate ops = update (setUpdateOp ops)

mapUpdate ::
  [CRDT.MapOp] ->
  BucketType ->
  Bucket ->
  Key ->
  Proto.DtUpdateReq
mapUpdate ops = update (mapUpdateOp ops)

update :: Proto.DtOp -> BucketType -> Bucket -> Key -> Proto.DtUpdateReq
update op t b k =
  Proto.defMessage
    & Proto.bucket .~ escape b
    & Proto.key .~ escape k
    & Proto.op .~ op
    & Proto.type' .~ t

get :: ByteString -> ByteString -> ByteString -> Proto.DtFetchReq
get t b k =
  Proto.defMessage
    & Proto.bucket .~ escape b
    & Proto.key .~ escape k
    & Proto.type' .~ t
