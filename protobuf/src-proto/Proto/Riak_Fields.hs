{- This file was auto-generated from riak.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Riak_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
adds ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "adds" a) =>
  Lens.Family2.LensLike' f s a
adds = Data.ProtoLens.Field.field @"adds"
allowMult ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "allowMult" a) =>
  Lens.Family2.LensLike' f s a
allowMult = Data.ProtoLens.Field.field @"allowMult"
amount ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "amount" a) =>
  Lens.Family2.LensLike' f s a
amount = Data.ProtoLens.Field.field @"amount"
asis ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "asis" a) =>
  Lens.Family2.LensLike' f s a
asis = Data.ProtoLens.Field.field @"asis"
backend ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "backend" a) =>
  Lens.Family2.LensLike' f s a
backend = Data.ProtoLens.Field.field @"backend"
base ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "base" a) =>
  Lens.Family2.LensLike' f s a
base = Data.ProtoLens.Field.field @"base"
basicQuorum ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "basicQuorum" a) =>
  Lens.Family2.LensLike' f s a
basicQuorum = Data.ProtoLens.Field.field @"basicQuorum"
bigVclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "bigVclock" a) =>
  Lens.Family2.LensLike' f s a
bigVclock = Data.ProtoLens.Field.field @"bigVclock"
booleanValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "booleanValue" a) =>
  Lens.Family2.LensLike' f s a
booleanValue = Data.ProtoLens.Field.field @"booleanValue"
bucket ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "bucket" a) =>
  Lens.Family2.LensLike' f s a
bucket = Data.ProtoLens.Field.field @"bucket"
buckets ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "buckets" a) =>
  Lens.Family2.LensLike' f s a
buckets = Data.ProtoLens.Field.field @"buckets"
cells ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "cells" a) =>
  Lens.Family2.LensLike' f s a
cells = Data.ProtoLens.Field.field @"cells"
charset ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "charset" a) =>
  Lens.Family2.LensLike' f s a
charset = Data.ProtoLens.Field.field @"charset"
chashKeyfun ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "chashKeyfun" a) =>
  Lens.Family2.LensLike' f s a
chashKeyfun = Data.ProtoLens.Field.field @"chashKeyfun"
clientId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "clientId" a) =>
  Lens.Family2.LensLike' f s a
clientId = Data.ProtoLens.Field.field @"clientId"
columns ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "columns" a) =>
  Lens.Family2.LensLike' f s a
columns = Data.ProtoLens.Field.field @"columns"
consistent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "consistent" a) =>
  Lens.Family2.LensLike' f s a
consistent = Data.ProtoLens.Field.field @"consistent"
content ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "content" a) =>
  Lens.Family2.LensLike' f s a
content = Data.ProtoLens.Field.field @"content"
contentEncoding ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "contentEncoding" a) =>
  Lens.Family2.LensLike' f s a
contentEncoding = Data.ProtoLens.Field.field @"contentEncoding"
contentType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "contentType" a) =>
  Lens.Family2.LensLike' f s a
contentType = Data.ProtoLens.Field.field @"contentType"
context ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "context" a) =>
  Lens.Family2.LensLike' f s a
context = Data.ProtoLens.Field.field @"context"
continuation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "continuation" a) =>
  Lens.Family2.LensLike' f s a
continuation = Data.ProtoLens.Field.field @"continuation"
counterOp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "counterOp" a) =>
  Lens.Family2.LensLike' f s a
counterOp = Data.ProtoLens.Field.field @"counterOp"
counterValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "counterValue" a) =>
  Lens.Family2.LensLike' f s a
counterValue = Data.ProtoLens.Field.field @"counterValue"
coverContext ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "coverContext" a) =>
  Lens.Family2.LensLike' f s a
coverContext = Data.ProtoLens.Field.field @"coverContext"
datatype ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "datatype" a) =>
  Lens.Family2.LensLike' f s a
datatype = Data.ProtoLens.Field.field @"datatype"
deleted ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "deleted" a) =>
  Lens.Family2.LensLike' f s a
deleted = Data.ProtoLens.Field.field @"deleted"
deletedvclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "deletedvclock" a) =>
  Lens.Family2.LensLike' f s a
deletedvclock = Data.ProtoLens.Field.field @"deletedvclock"
desc ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "desc" a) =>
  Lens.Family2.LensLike' f s a
desc = Data.ProtoLens.Field.field @"desc"
df ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "df" a) =>
  Lens.Family2.LensLike' f s a
df = Data.ProtoLens.Field.field @"df"
docs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "docs" a) =>
  Lens.Family2.LensLike' f s a
docs = Data.ProtoLens.Field.field @"docs"
done ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "done" a) =>
  Lens.Family2.LensLike' f s a
done = Data.ProtoLens.Field.field @"done"
doubleValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "doubleValue" a) =>
  Lens.Family2.LensLike' f s a
doubleValue = Data.ProtoLens.Field.field @"doubleValue"
dw ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "dw" a) =>
  Lens.Family2.LensLike' f s a
dw = Data.ProtoLens.Field.field @"dw"
endIncl ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "endIncl" a) =>
  Lens.Family2.LensLike' f s a
endIncl = Data.ProtoLens.Field.field @"endIncl"
endKey ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "endKey" a) =>
  Lens.Family2.LensLike' f s a
endKey = Data.ProtoLens.Field.field @"endKey"
entries ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "entries" a) =>
  Lens.Family2.LensLike' f s a
entries = Data.ProtoLens.Field.field @"entries"
errcode ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "errcode" a) =>
  Lens.Family2.LensLike' f s a
errcode = Data.ProtoLens.Field.field @"errcode"
errmsg ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "errmsg" a) =>
  Lens.Family2.LensLike' f s a
errmsg = Data.ProtoLens.Field.field @"errmsg"
field ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "field" a) =>
  Lens.Family2.LensLike' f s a
field = Data.ProtoLens.Field.field @"field"
fieldName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fieldName" a) =>
  Lens.Family2.LensLike' f s a
fieldName = Data.ProtoLens.Field.field @"fieldName"
fields ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "fields" a) =>
  Lens.Family2.LensLike' f s a
fields = Data.ProtoLens.Field.field @"fields"
filter ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "filter" a) =>
  Lens.Family2.LensLike' f s a
filter = Data.ProtoLens.Field.field @"filter"
fl ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "fl" a) =>
  Lens.Family2.LensLike' f s a
fl = Data.ProtoLens.Field.field @"fl"
flagOp ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "flagOp" a) =>
  Lens.Family2.LensLike' f s a
flagOp = Data.ProtoLens.Field.field @"flagOp"
flagValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "flagValue" a) =>
  Lens.Family2.LensLike' f s a
flagValue = Data.ProtoLens.Field.field @"flagValue"
function ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "function" a) =>
  Lens.Family2.LensLike' f s a
function = Data.ProtoLens.Field.field @"function"
gsetOp ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "gsetOp" a) =>
  Lens.Family2.LensLike' f s a
gsetOp = Data.ProtoLens.Field.field @"gsetOp"
gsetValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "gsetValue" a) =>
  Lens.Family2.LensLike' f s a
gsetValue = Data.ProtoLens.Field.field @"gsetValue"
hasPostcommit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hasPostcommit" a) =>
  Lens.Family2.LensLike' f s a
hasPostcommit = Data.ProtoLens.Field.field @"hasPostcommit"
hasPrecommit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hasPrecommit" a) =>
  Lens.Family2.LensLike' f s a
hasPrecommit = Data.ProtoLens.Field.field @"hasPrecommit"
head ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "head" a) =>
  Lens.Family2.LensLike' f s a
head = Data.ProtoLens.Field.field @"head"
hllOp ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "hllOp" a) =>
  Lens.Family2.LensLike' f s a
hllOp = Data.ProtoLens.Field.field @"hllOp"
hllPrecision ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hllPrecision" a) =>
  Lens.Family2.LensLike' f s a
hllPrecision = Data.ProtoLens.Field.field @"hllPrecision"
hllValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hllValue" a) =>
  Lens.Family2.LensLike' f s a
hllValue = Data.ProtoLens.Field.field @"hllValue"
ifModified ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ifModified" a) =>
  Lens.Family2.LensLike' f s a
ifModified = Data.ProtoLens.Field.field @"ifModified"
ifNoneMatch ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ifNoneMatch" a) =>
  Lens.Family2.LensLike' f s a
ifNoneMatch = Data.ProtoLens.Field.field @"ifNoneMatch"
ifNotModified ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ifNotModified" a) =>
  Lens.Family2.LensLike' f s a
ifNotModified = Data.ProtoLens.Field.field @"ifNotModified"
includeContext ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "includeContext" a) =>
  Lens.Family2.LensLike' f s a
includeContext = Data.ProtoLens.Field.field @"includeContext"
increment ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "increment" a) =>
  Lens.Family2.LensLike' f s a
increment = Data.ProtoLens.Field.field @"increment"
index ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "index" a) =>
  Lens.Family2.LensLike' f s a
index = Data.ProtoLens.Field.field @"index"
indexes ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "indexes" a) =>
  Lens.Family2.LensLike' f s a
indexes = Data.ProtoLens.Field.field @"indexes"
interpolations ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "interpolations" a) =>
  Lens.Family2.LensLike' f s a
interpolations = Data.ProtoLens.Field.field @"interpolations"
ip ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "ip" a) =>
  Lens.Family2.LensLike' f s a
ip = Data.ProtoLens.Field.field @"ip"
key ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "key" a) =>
  Lens.Family2.LensLike' f s a
key = Data.ProtoLens.Field.field @"key"
keys ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "keys" a) =>
  Lens.Family2.LensLike' f s a
keys = Data.ProtoLens.Field.field @"keys"
keyspaceDesc ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "keyspaceDesc" a) =>
  Lens.Family2.LensLike' f s a
keyspaceDesc = Data.ProtoLens.Field.field @"keyspaceDesc"
lastMod ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "lastMod" a) =>
  Lens.Family2.LensLike' f s a
lastMod = Data.ProtoLens.Field.field @"lastMod"
lastModUsecs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastModUsecs" a) =>
  Lens.Family2.LensLike' f s a
lastModUsecs = Data.ProtoLens.Field.field @"lastModUsecs"
lastWriteWins ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lastWriteWins" a) =>
  Lens.Family2.LensLike' f s a
lastWriteWins = Data.ProtoLens.Field.field @"lastWriteWins"
linkfun ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "linkfun" a) =>
  Lens.Family2.LensLike' f s a
linkfun = Data.ProtoLens.Field.field @"linkfun"
links ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "links" a) =>
  Lens.Family2.LensLike' f s a
links = Data.ProtoLens.Field.field @"links"
lowerBound ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lowerBound" a) =>
  Lens.Family2.LensLike' f s a
lowerBound = Data.ProtoLens.Field.field @"lowerBound"
lowerBoundInclusive ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lowerBoundInclusive" a) =>
  Lens.Family2.LensLike' f s a
lowerBoundInclusive
  = Data.ProtoLens.Field.field @"lowerBoundInclusive"
mapOp ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "mapOp" a) =>
  Lens.Family2.LensLike' f s a
mapOp = Data.ProtoLens.Field.field @"mapOp"
mapValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "mapValue" a) =>
  Lens.Family2.LensLike' f s a
mapValue = Data.ProtoLens.Field.field @"mapValue"
maxResults ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxResults" a) =>
  Lens.Family2.LensLike' f s a
maxResults = Data.ProtoLens.Field.field @"maxResults"
maxScore ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxScore" a) =>
  Lens.Family2.LensLike' f s a
maxScore = Data.ProtoLens.Field.field @"maxScore"
maybe'allowMult ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'allowMult" a) =>
  Lens.Family2.LensLike' f s a
maybe'allowMult = Data.ProtoLens.Field.field @"maybe'allowMult"
maybe'asis ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'asis" a) =>
  Lens.Family2.LensLike' f s a
maybe'asis = Data.ProtoLens.Field.field @"maybe'asis"
maybe'backend ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'backend" a) =>
  Lens.Family2.LensLike' f s a
maybe'backend = Data.ProtoLens.Field.field @"maybe'backend"
maybe'basicQuorum ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'basicQuorum" a) =>
  Lens.Family2.LensLike' f s a
maybe'basicQuorum = Data.ProtoLens.Field.field @"maybe'basicQuorum"
maybe'bigVclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'bigVclock" a) =>
  Lens.Family2.LensLike' f s a
maybe'bigVclock = Data.ProtoLens.Field.field @"maybe'bigVclock"
maybe'booleanValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'booleanValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'booleanValue
  = Data.ProtoLens.Field.field @"maybe'booleanValue"
maybe'bucket ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'bucket" a) =>
  Lens.Family2.LensLike' f s a
maybe'bucket = Data.ProtoLens.Field.field @"maybe'bucket"
maybe'charset ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'charset" a) =>
  Lens.Family2.LensLike' f s a
maybe'charset = Data.ProtoLens.Field.field @"maybe'charset"
maybe'chashKeyfun ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'chashKeyfun" a) =>
  Lens.Family2.LensLike' f s a
maybe'chashKeyfun = Data.ProtoLens.Field.field @"maybe'chashKeyfun"
maybe'consistent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'consistent" a) =>
  Lens.Family2.LensLike' f s a
maybe'consistent = Data.ProtoLens.Field.field @"maybe'consistent"
maybe'content ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'content" a) =>
  Lens.Family2.LensLike' f s a
maybe'content = Data.ProtoLens.Field.field @"maybe'content"
maybe'contentEncoding ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'contentEncoding" a) =>
  Lens.Family2.LensLike' f s a
maybe'contentEncoding
  = Data.ProtoLens.Field.field @"maybe'contentEncoding"
maybe'contentType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'contentType" a) =>
  Lens.Family2.LensLike' f s a
maybe'contentType = Data.ProtoLens.Field.field @"maybe'contentType"
maybe'context ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'context" a) =>
  Lens.Family2.LensLike' f s a
maybe'context = Data.ProtoLens.Field.field @"maybe'context"
maybe'continuation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'continuation" a) =>
  Lens.Family2.LensLike' f s a
maybe'continuation
  = Data.ProtoLens.Field.field @"maybe'continuation"
maybe'counterOp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'counterOp" a) =>
  Lens.Family2.LensLike' f s a
maybe'counterOp = Data.ProtoLens.Field.field @"maybe'counterOp"
maybe'counterValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'counterValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'counterValue
  = Data.ProtoLens.Field.field @"maybe'counterValue"
maybe'coverContext ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'coverContext" a) =>
  Lens.Family2.LensLike' f s a
maybe'coverContext
  = Data.ProtoLens.Field.field @"maybe'coverContext"
maybe'datatype ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'datatype" a) =>
  Lens.Family2.LensLike' f s a
maybe'datatype = Data.ProtoLens.Field.field @"maybe'datatype"
maybe'deleted ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'deleted" a) =>
  Lens.Family2.LensLike' f s a
maybe'deleted = Data.ProtoLens.Field.field @"maybe'deleted"
maybe'deletedvclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'deletedvclock" a) =>
  Lens.Family2.LensLike' f s a
maybe'deletedvclock
  = Data.ProtoLens.Field.field @"maybe'deletedvclock"
maybe'df ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'df" a) =>
  Lens.Family2.LensLike' f s a
maybe'df = Data.ProtoLens.Field.field @"maybe'df"
maybe'done ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'done" a) =>
  Lens.Family2.LensLike' f s a
maybe'done = Data.ProtoLens.Field.field @"maybe'done"
maybe'doubleValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'doubleValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'doubleValue = Data.ProtoLens.Field.field @"maybe'doubleValue"
maybe'dw ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'dw" a) =>
  Lens.Family2.LensLike' f s a
maybe'dw = Data.ProtoLens.Field.field @"maybe'dw"
maybe'endIncl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'endIncl" a) =>
  Lens.Family2.LensLike' f s a
maybe'endIncl = Data.ProtoLens.Field.field @"maybe'endIncl"
maybe'endKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'endKey" a) =>
  Lens.Family2.LensLike' f s a
maybe'endKey = Data.ProtoLens.Field.field @"maybe'endKey"
maybe'filter ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'filter" a) =>
  Lens.Family2.LensLike' f s a
maybe'filter = Data.ProtoLens.Field.field @"maybe'filter"
maybe'flagOp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'flagOp" a) =>
  Lens.Family2.LensLike' f s a
maybe'flagOp = Data.ProtoLens.Field.field @"maybe'flagOp"
maybe'flagValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'flagValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'flagValue = Data.ProtoLens.Field.field @"maybe'flagValue"
maybe'gsetOp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'gsetOp" a) =>
  Lens.Family2.LensLike' f s a
maybe'gsetOp = Data.ProtoLens.Field.field @"maybe'gsetOp"
maybe'hasPostcommit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'hasPostcommit" a) =>
  Lens.Family2.LensLike' f s a
maybe'hasPostcommit
  = Data.ProtoLens.Field.field @"maybe'hasPostcommit"
maybe'hasPrecommit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'hasPrecommit" a) =>
  Lens.Family2.LensLike' f s a
maybe'hasPrecommit
  = Data.ProtoLens.Field.field @"maybe'hasPrecommit"
maybe'head ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'head" a) =>
  Lens.Family2.LensLike' f s a
maybe'head = Data.ProtoLens.Field.field @"maybe'head"
maybe'hllOp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'hllOp" a) =>
  Lens.Family2.LensLike' f s a
maybe'hllOp = Data.ProtoLens.Field.field @"maybe'hllOp"
maybe'hllPrecision ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'hllPrecision" a) =>
  Lens.Family2.LensLike' f s a
maybe'hllPrecision
  = Data.ProtoLens.Field.field @"maybe'hllPrecision"
maybe'hllValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'hllValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'hllValue = Data.ProtoLens.Field.field @"maybe'hllValue"
maybe'ifModified ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'ifModified" a) =>
  Lens.Family2.LensLike' f s a
maybe'ifModified = Data.ProtoLens.Field.field @"maybe'ifModified"
maybe'ifNoneMatch ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'ifNoneMatch" a) =>
  Lens.Family2.LensLike' f s a
maybe'ifNoneMatch = Data.ProtoLens.Field.field @"maybe'ifNoneMatch"
maybe'ifNotModified ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'ifNotModified" a) =>
  Lens.Family2.LensLike' f s a
maybe'ifNotModified
  = Data.ProtoLens.Field.field @"maybe'ifNotModified"
maybe'includeContext ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'includeContext" a) =>
  Lens.Family2.LensLike' f s a
maybe'includeContext
  = Data.ProtoLens.Field.field @"maybe'includeContext"
maybe'increment ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'increment" a) =>
  Lens.Family2.LensLike' f s a
maybe'increment = Data.ProtoLens.Field.field @"maybe'increment"
maybe'key ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'key" a) =>
  Lens.Family2.LensLike' f s a
maybe'key = Data.ProtoLens.Field.field @"maybe'key"
maybe'keyspaceDesc ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'keyspaceDesc" a) =>
  Lens.Family2.LensLike' f s a
maybe'keyspaceDesc
  = Data.ProtoLens.Field.field @"maybe'keyspaceDesc"
maybe'lastMod ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'lastMod" a) =>
  Lens.Family2.LensLike' f s a
maybe'lastMod = Data.ProtoLens.Field.field @"maybe'lastMod"
maybe'lastModUsecs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'lastModUsecs" a) =>
  Lens.Family2.LensLike' f s a
maybe'lastModUsecs
  = Data.ProtoLens.Field.field @"maybe'lastModUsecs"
maybe'lastWriteWins ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'lastWriteWins" a) =>
  Lens.Family2.LensLike' f s a
maybe'lastWriteWins
  = Data.ProtoLens.Field.field @"maybe'lastWriteWins"
maybe'linkfun ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'linkfun" a) =>
  Lens.Family2.LensLike' f s a
maybe'linkfun = Data.ProtoLens.Field.field @"maybe'linkfun"
maybe'mapOp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'mapOp" a) =>
  Lens.Family2.LensLike' f s a
maybe'mapOp = Data.ProtoLens.Field.field @"maybe'mapOp"
maybe'maxResults ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'maxResults" a) =>
  Lens.Family2.LensLike' f s a
maybe'maxResults = Data.ProtoLens.Field.field @"maybe'maxResults"
maybe'maxScore ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'maxScore" a) =>
  Lens.Family2.LensLike' f s a
maybe'maxScore = Data.ProtoLens.Field.field @"maybe'maxScore"
maybe'minPartitions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'minPartitions" a) =>
  Lens.Family2.LensLike' f s a
maybe'minPartitions
  = Data.ProtoLens.Field.field @"maybe'minPartitions"
maybe'modfun ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'modfun" a) =>
  Lens.Family2.LensLike' f s a
maybe'modfun = Data.ProtoLens.Field.field @"maybe'modfun"
maybe'nVal ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'nVal" a) =>
  Lens.Family2.LensLike' f s a
maybe'nVal = Data.ProtoLens.Field.field @"maybe'nVal"
maybe'name ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'name" a) =>
  Lens.Family2.LensLike' f s a
maybe'name = Data.ProtoLens.Field.field @"maybe'name"
maybe'node ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'node" a) =>
  Lens.Family2.LensLike' f s a
maybe'node = Data.ProtoLens.Field.field @"maybe'node"
maybe'notfoundOk ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'notfoundOk" a) =>
  Lens.Family2.LensLike' f s a
maybe'notfoundOk = Data.ProtoLens.Field.field @"maybe'notfoundOk"
maybe'numFound ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'numFound" a) =>
  Lens.Family2.LensLike' f s a
maybe'numFound = Data.ProtoLens.Field.field @"maybe'numFound"
maybe'oldVclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'oldVclock" a) =>
  Lens.Family2.LensLike' f s a
maybe'oldVclock = Data.ProtoLens.Field.field @"maybe'oldVclock"
maybe'op ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'op" a) =>
  Lens.Family2.LensLike' f s a
maybe'op = Data.ProtoLens.Field.field @"maybe'op"
maybe'paginationSort ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'paginationSort" a) =>
  Lens.Family2.LensLike' f s a
maybe'paginationSort
  = Data.ProtoLens.Field.field @"maybe'paginationSort"
maybe'phase ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'phase" a) =>
  Lens.Family2.LensLike' f s a
maybe'phase = Data.ProtoLens.Field.field @"maybe'phase"
maybe'pr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'pr" a) =>
  Lens.Family2.LensLike' f s a
maybe'pr = Data.ProtoLens.Field.field @"maybe'pr"
maybe'presort ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'presort" a) =>
  Lens.Family2.LensLike' f s a
maybe'presort = Data.ProtoLens.Field.field @"maybe'presort"
maybe'pw ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'pw" a) =>
  Lens.Family2.LensLike' f s a
maybe'pw = Data.ProtoLens.Field.field @"maybe'pw"
maybe'query ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'query" a) =>
  Lens.Family2.LensLike' f s a
maybe'query = Data.ProtoLens.Field.field @"maybe'query"
maybe'r ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "maybe'r" a) =>
  Lens.Family2.LensLike' f s a
maybe'r = Data.ProtoLens.Field.field @"maybe'r"
maybe'range ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'range" a) =>
  Lens.Family2.LensLike' f s a
maybe'range = Data.ProtoLens.Field.field @"maybe'range"
maybe'rangeMax ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'rangeMax" a) =>
  Lens.Family2.LensLike' f s a
maybe'rangeMax = Data.ProtoLens.Field.field @"maybe'rangeMax"
maybe'rangeMin ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'rangeMin" a) =>
  Lens.Family2.LensLike' f s a
maybe'rangeMin = Data.ProtoLens.Field.field @"maybe'rangeMin"
maybe'registerOp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'registerOp" a) =>
  Lens.Family2.LensLike' f s a
maybe'registerOp = Data.ProtoLens.Field.field @"maybe'registerOp"
maybe'registerValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'registerValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'registerValue
  = Data.ProtoLens.Field.field @"maybe'registerValue"
maybe'repl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'repl" a) =>
  Lens.Family2.LensLike' f s a
maybe'repl = Data.ProtoLens.Field.field @"maybe'repl"
maybe'replaceCover ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'replaceCover" a) =>
  Lens.Family2.LensLike' f s a
maybe'replaceCover
  = Data.ProtoLens.Field.field @"maybe'replaceCover"
maybe'response ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'response" a) =>
  Lens.Family2.LensLike' f s a
maybe'response = Data.ProtoLens.Field.field @"maybe'response"
maybe'returnBody ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'returnBody" a) =>
  Lens.Family2.LensLike' f s a
maybe'returnBody = Data.ProtoLens.Field.field @"maybe'returnBody"
maybe'returnHead ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'returnHead" a) =>
  Lens.Family2.LensLike' f s a
maybe'returnHead = Data.ProtoLens.Field.field @"maybe'returnHead"
maybe'returnTerms ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'returnTerms" a) =>
  Lens.Family2.LensLike' f s a
maybe'returnTerms = Data.ProtoLens.Field.field @"maybe'returnTerms"
maybe'returnvalue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'returnvalue" a) =>
  Lens.Family2.LensLike' f s a
maybe'returnvalue = Data.ProtoLens.Field.field @"maybe'returnvalue"
maybe'rows ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'rows" a) =>
  Lens.Family2.LensLike' f s a
maybe'rows = Data.ProtoLens.Field.field @"maybe'rows"
maybe'rw ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'rw" a) =>
  Lens.Family2.LensLike' f s a
maybe'rw = Data.ProtoLens.Field.field @"maybe'rw"
maybe'schema ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'schema" a) =>
  Lens.Family2.LensLike' f s a
maybe'schema = Data.ProtoLens.Field.field @"maybe'schema"
maybe'search ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'search" a) =>
  Lens.Family2.LensLike' f s a
maybe'search = Data.ProtoLens.Field.field @"maybe'search"
maybe'searchIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'searchIndex" a) =>
  Lens.Family2.LensLike' f s a
maybe'searchIndex = Data.ProtoLens.Field.field @"maybe'searchIndex"
maybe'serverVersion ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'serverVersion" a) =>
  Lens.Family2.LensLike' f s a
maybe'serverVersion
  = Data.ProtoLens.Field.field @"maybe'serverVersion"
maybe'setOp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'setOp" a) =>
  Lens.Family2.LensLike' f s a
maybe'setOp = Data.ProtoLens.Field.field @"maybe'setOp"
maybe'sint64Value ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sint64Value" a) =>
  Lens.Family2.LensLike' f s a
maybe'sint64Value = Data.ProtoLens.Field.field @"maybe'sint64Value"
maybe'sloppyQuorum ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sloppyQuorum" a) =>
  Lens.Family2.LensLike' f s a
maybe'sloppyQuorum
  = Data.ProtoLens.Field.field @"maybe'sloppyQuorum"
maybe'smallVclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'smallVclock" a) =>
  Lens.Family2.LensLike' f s a
maybe'smallVclock = Data.ProtoLens.Field.field @"maybe'smallVclock"
maybe'sort ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sort" a) =>
  Lens.Family2.LensLike' f s a
maybe'sort = Data.ProtoLens.Field.field @"maybe'sort"
maybe'start ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'start" a) =>
  Lens.Family2.LensLike' f s a
maybe'start = Data.ProtoLens.Field.field @"maybe'start"
maybe'startIncl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'startIncl" a) =>
  Lens.Family2.LensLike' f s a
maybe'startIncl = Data.ProtoLens.Field.field @"maybe'startIncl"
maybe'stream ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'stream" a) =>
  Lens.Family2.LensLike' f s a
maybe'stream = Data.ProtoLens.Field.field @"maybe'stream"
maybe'tag ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'tag" a) =>
  Lens.Family2.LensLike' f s a
maybe'tag = Data.ProtoLens.Field.field @"maybe'tag"
maybe'termRegex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'termRegex" a) =>
  Lens.Family2.LensLike' f s a
maybe'termRegex = Data.ProtoLens.Field.field @"maybe'termRegex"
maybe'timeout ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'timeout" a) =>
  Lens.Family2.LensLike' f s a
maybe'timeout = Data.ProtoLens.Field.field @"maybe'timeout"
maybe'timestampValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'timestampValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'timestampValue
  = Data.ProtoLens.Field.field @"maybe'timestampValue"
maybe'ttl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'ttl" a) =>
  Lens.Family2.LensLike' f s a
maybe'ttl = Data.ProtoLens.Field.field @"maybe'ttl"
maybe'type' ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'type'" a) =>
  Lens.Family2.LensLike' f s a
maybe'type' = Data.ProtoLens.Field.field @"maybe'type'"
maybe'unchanged ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'unchanged" a) =>
  Lens.Family2.LensLike' f s a
maybe'unchanged = Data.ProtoLens.Field.field @"maybe'unchanged"
maybe'value ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'value" a) =>
  Lens.Family2.LensLike' f s a
maybe'value = Data.ProtoLens.Field.field @"maybe'value"
maybe'varcharValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'varcharValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'varcharValue
  = Data.ProtoLens.Field.field @"maybe'varcharValue"
maybe'vclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'vclock" a) =>
  Lens.Family2.LensLike' f s a
maybe'vclock = Data.ProtoLens.Field.field @"maybe'vclock"
maybe'vtag ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'vtag" a) =>
  Lens.Family2.LensLike' f s a
maybe'vtag = Data.ProtoLens.Field.field @"maybe'vtag"
maybe'w ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "maybe'w" a) =>
  Lens.Family2.LensLike' f s a
maybe'w = Data.ProtoLens.Field.field @"maybe'w"
maybe'writeOnce ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'writeOnce" a) =>
  Lens.Family2.LensLike' f s a
maybe'writeOnce = Data.ProtoLens.Field.field @"maybe'writeOnce"
maybe'youngVclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'youngVclock" a) =>
  Lens.Family2.LensLike' f s a
maybe'youngVclock = Data.ProtoLens.Field.field @"maybe'youngVclock"
minPartitions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "minPartitions" a) =>
  Lens.Family2.LensLike' f s a
minPartitions = Data.ProtoLens.Field.field @"minPartitions"
modfun ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "modfun" a) =>
  Lens.Family2.LensLike' f s a
modfun = Data.ProtoLens.Field.field @"modfun"
module' ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "module'" a) =>
  Lens.Family2.LensLike' f s a
module' = Data.ProtoLens.Field.field @"module'"
nVal ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "nVal" a) =>
  Lens.Family2.LensLike' f s a
nVal = Data.ProtoLens.Field.field @"nVal"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
node ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "node" a) =>
  Lens.Family2.LensLike' f s a
node = Data.ProtoLens.Field.field @"node"
notfoundOk ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "notfoundOk" a) =>
  Lens.Family2.LensLike' f s a
notfoundOk = Data.ProtoLens.Field.field @"notfoundOk"
numFound ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numFound" a) =>
  Lens.Family2.LensLike' f s a
numFound = Data.ProtoLens.Field.field @"numFound"
object ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "object" a) =>
  Lens.Family2.LensLike' f s a
object = Data.ProtoLens.Field.field @"object"
objects ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "objects" a) =>
  Lens.Family2.LensLike' f s a
objects = Data.ProtoLens.Field.field @"objects"
oldVclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "oldVclock" a) =>
  Lens.Family2.LensLike' f s a
oldVclock = Data.ProtoLens.Field.field @"oldVclock"
op ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "op" a) =>
  Lens.Family2.LensLike' f s a
op = Data.ProtoLens.Field.field @"op"
paginationSort ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paginationSort" a) =>
  Lens.Family2.LensLike' f s a
paginationSort = Data.ProtoLens.Field.field @"paginationSort"
partition ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "partition" a) =>
  Lens.Family2.LensLike' f s a
partition = Data.ProtoLens.Field.field @"partition"
password ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "password" a) =>
  Lens.Family2.LensLike' f s a
password = Data.ProtoLens.Field.field @"password"
phase ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "phase" a) =>
  Lens.Family2.LensLike' f s a
phase = Data.ProtoLens.Field.field @"phase"
port ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "port" a) =>
  Lens.Family2.LensLike' f s a
port = Data.ProtoLens.Field.field @"port"
postcommit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "postcommit" a) =>
  Lens.Family2.LensLike' f s a
postcommit = Data.ProtoLens.Field.field @"postcommit"
pr ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "pr" a) =>
  Lens.Family2.LensLike' f s a
pr = Data.ProtoLens.Field.field @"pr"
precommit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "precommit" a) =>
  Lens.Family2.LensLike' f s a
precommit = Data.ProtoLens.Field.field @"precommit"
preflist ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "preflist" a) =>
  Lens.Family2.LensLike' f s a
preflist = Data.ProtoLens.Field.field @"preflist"
presort ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "presort" a) =>
  Lens.Family2.LensLike' f s a
presort = Data.ProtoLens.Field.field @"presort"
primary ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "primary" a) =>
  Lens.Family2.LensLike' f s a
primary = Data.ProtoLens.Field.field @"primary"
props ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "props" a) =>
  Lens.Family2.LensLike' f s a
props = Data.ProtoLens.Field.field @"props"
pw ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "pw" a) =>
  Lens.Family2.LensLike' f s a
pw = Data.ProtoLens.Field.field @"pw"
q ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "q" a) =>
  Lens.Family2.LensLike' f s a
q = Data.ProtoLens.Field.field @"q"
qtype ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "qtype" a) =>
  Lens.Family2.LensLike' f s a
qtype = Data.ProtoLens.Field.field @"qtype"
query ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "query" a) =>
  Lens.Family2.LensLike' f s a
query = Data.ProtoLens.Field.field @"query"
r ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "r" a) =>
  Lens.Family2.LensLike' f s a
r = Data.ProtoLens.Field.field @"r"
range ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "range" a) =>
  Lens.Family2.LensLike' f s a
range = Data.ProtoLens.Field.field @"range"
rangeMax ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rangeMax" a) =>
  Lens.Family2.LensLike' f s a
rangeMax = Data.ProtoLens.Field.field @"rangeMax"
rangeMin ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rangeMin" a) =>
  Lens.Family2.LensLike' f s a
rangeMin = Data.ProtoLens.Field.field @"rangeMin"
registerOp ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "registerOp" a) =>
  Lens.Family2.LensLike' f s a
registerOp = Data.ProtoLens.Field.field @"registerOp"
registerValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "registerValue" a) =>
  Lens.Family2.LensLike' f s a
registerValue = Data.ProtoLens.Field.field @"registerValue"
removes ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "removes" a) =>
  Lens.Family2.LensLike' f s a
removes = Data.ProtoLens.Field.field @"removes"
repl ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "repl" a) =>
  Lens.Family2.LensLike' f s a
repl = Data.ProtoLens.Field.field @"repl"
replaceCover ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "replaceCover" a) =>
  Lens.Family2.LensLike' f s a
replaceCover = Data.ProtoLens.Field.field @"replaceCover"
request ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "request" a) =>
  Lens.Family2.LensLike' f s a
request = Data.ProtoLens.Field.field @"request"
response ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "response" a) =>
  Lens.Family2.LensLike' f s a
response = Data.ProtoLens.Field.field @"response"
results ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "results" a) =>
  Lens.Family2.LensLike' f s a
results = Data.ProtoLens.Field.field @"results"
returnBody ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "returnBody" a) =>
  Lens.Family2.LensLike' f s a
returnBody = Data.ProtoLens.Field.field @"returnBody"
returnHead ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "returnHead" a) =>
  Lens.Family2.LensLike' f s a
returnHead = Data.ProtoLens.Field.field @"returnHead"
returnTerms ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "returnTerms" a) =>
  Lens.Family2.LensLike' f s a
returnTerms = Data.ProtoLens.Field.field @"returnTerms"
returnvalue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "returnvalue" a) =>
  Lens.Family2.LensLike' f s a
returnvalue = Data.ProtoLens.Field.field @"returnvalue"
rows ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "rows" a) =>
  Lens.Family2.LensLike' f s a
rows = Data.ProtoLens.Field.field @"rows"
rw ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "rw" a) =>
  Lens.Family2.LensLike' f s a
rw = Data.ProtoLens.Field.field @"rw"
schema ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "schema" a) =>
  Lens.Family2.LensLike' f s a
schema = Data.ProtoLens.Field.field @"schema"
search ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "search" a) =>
  Lens.Family2.LensLike' f s a
search = Data.ProtoLens.Field.field @"search"
searchIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "searchIndex" a) =>
  Lens.Family2.LensLike' f s a
searchIndex = Data.ProtoLens.Field.field @"searchIndex"
serverVersion ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "serverVersion" a) =>
  Lens.Family2.LensLike' f s a
serverVersion = Data.ProtoLens.Field.field @"serverVersion"
setOp ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "setOp" a) =>
  Lens.Family2.LensLike' f s a
setOp = Data.ProtoLens.Field.field @"setOp"
setValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "setValue" a) =>
  Lens.Family2.LensLike' f s a
setValue = Data.ProtoLens.Field.field @"setValue"
sint64Value ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sint64Value" a) =>
  Lens.Family2.LensLike' f s a
sint64Value = Data.ProtoLens.Field.field @"sint64Value"
sloppyQuorum ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sloppyQuorum" a) =>
  Lens.Family2.LensLike' f s a
sloppyQuorum = Data.ProtoLens.Field.field @"sloppyQuorum"
smallVclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "smallVclock" a) =>
  Lens.Family2.LensLike' f s a
smallVclock = Data.ProtoLens.Field.field @"smallVclock"
sort ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "sort" a) =>
  Lens.Family2.LensLike' f s a
sort = Data.ProtoLens.Field.field @"sort"
start ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "start" a) =>
  Lens.Family2.LensLike' f s a
start = Data.ProtoLens.Field.field @"start"
startIncl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "startIncl" a) =>
  Lens.Family2.LensLike' f s a
startIncl = Data.ProtoLens.Field.field @"startIncl"
startKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "startKey" a) =>
  Lens.Family2.LensLike' f s a
startKey = Data.ProtoLens.Field.field @"startKey"
stream ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "stream" a) =>
  Lens.Family2.LensLike' f s a
stream = Data.ProtoLens.Field.field @"stream"
table ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "table" a) =>
  Lens.Family2.LensLike' f s a
table = Data.ProtoLens.Field.field @"table"
tag ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "tag" a) =>
  Lens.Family2.LensLike' f s a
tag = Data.ProtoLens.Field.field @"tag"
termRegex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "termRegex" a) =>
  Lens.Family2.LensLike' f s a
termRegex = Data.ProtoLens.Field.field @"termRegex"
timeout ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "timeout" a) =>
  Lens.Family2.LensLike' f s a
timeout = Data.ProtoLens.Field.field @"timeout"
timestampValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timestampValue" a) =>
  Lens.Family2.LensLike' f s a
timestampValue = Data.ProtoLens.Field.field @"timestampValue"
ttl ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "ttl" a) =>
  Lens.Family2.LensLike' f s a
ttl = Data.ProtoLens.Field.field @"ttl"
type' ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "type'" a) =>
  Lens.Family2.LensLike' f s a
type' = Data.ProtoLens.Field.field @"type'"
unavailableCover ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "unavailableCover" a) =>
  Lens.Family2.LensLike' f s a
unavailableCover = Data.ProtoLens.Field.field @"unavailableCover"
unchanged ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "unchanged" a) =>
  Lens.Family2.LensLike' f s a
unchanged = Data.ProtoLens.Field.field @"unchanged"
updates ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "updates" a) =>
  Lens.Family2.LensLike' f s a
updates = Data.ProtoLens.Field.field @"updates"
upperBound ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "upperBound" a) =>
  Lens.Family2.LensLike' f s a
upperBound = Data.ProtoLens.Field.field @"upperBound"
upperBoundInclusive ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "upperBoundInclusive" a) =>
  Lens.Family2.LensLike' f s a
upperBoundInclusive
  = Data.ProtoLens.Field.field @"upperBoundInclusive"
user ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "user" a) =>
  Lens.Family2.LensLike' f s a
user = Data.ProtoLens.Field.field @"user"
usermeta ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "usermeta" a) =>
  Lens.Family2.LensLike' f s a
usermeta = Data.ProtoLens.Field.field @"usermeta"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
varcharValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "varcharValue" a) =>
  Lens.Family2.LensLike' f s a
varcharValue = Data.ProtoLens.Field.field @"varcharValue"
vclock ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "vclock" a) =>
  Lens.Family2.LensLike' f s a
vclock = Data.ProtoLens.Field.field @"vclock"
vec'adds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'adds" a) =>
  Lens.Family2.LensLike' f s a
vec'adds = Data.ProtoLens.Field.field @"vec'adds"
vec'buckets ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'buckets" a) =>
  Lens.Family2.LensLike' f s a
vec'buckets = Data.ProtoLens.Field.field @"vec'buckets"
vec'cells ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'cells" a) =>
  Lens.Family2.LensLike' f s a
vec'cells = Data.ProtoLens.Field.field @"vec'cells"
vec'columns ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'columns" a) =>
  Lens.Family2.LensLike' f s a
vec'columns = Data.ProtoLens.Field.field @"vec'columns"
vec'content ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'content" a) =>
  Lens.Family2.LensLike' f s a
vec'content = Data.ProtoLens.Field.field @"vec'content"
vec'docs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'docs" a) =>
  Lens.Family2.LensLike' f s a
vec'docs = Data.ProtoLens.Field.field @"vec'docs"
vec'entries ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'entries" a) =>
  Lens.Family2.LensLike' f s a
vec'entries = Data.ProtoLens.Field.field @"vec'entries"
vec'fields ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'fields" a) =>
  Lens.Family2.LensLike' f s a
vec'fields = Data.ProtoLens.Field.field @"vec'fields"
vec'fl ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "vec'fl" a) =>
  Lens.Family2.LensLike' f s a
vec'fl = Data.ProtoLens.Field.field @"vec'fl"
vec'gsetValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'gsetValue" a) =>
  Lens.Family2.LensLike' f s a
vec'gsetValue = Data.ProtoLens.Field.field @"vec'gsetValue"
vec'index ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'index" a) =>
  Lens.Family2.LensLike' f s a
vec'index = Data.ProtoLens.Field.field @"vec'index"
vec'indexes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'indexes" a) =>
  Lens.Family2.LensLike' f s a
vec'indexes = Data.ProtoLens.Field.field @"vec'indexes"
vec'interpolations ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'interpolations" a) =>
  Lens.Family2.LensLike' f s a
vec'interpolations
  = Data.ProtoLens.Field.field @"vec'interpolations"
vec'key ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "vec'key" a) =>
  Lens.Family2.LensLike' f s a
vec'key = Data.ProtoLens.Field.field @"vec'key"
vec'keys ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'keys" a) =>
  Lens.Family2.LensLike' f s a
vec'keys = Data.ProtoLens.Field.field @"vec'keys"
vec'links ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'links" a) =>
  Lens.Family2.LensLike' f s a
vec'links = Data.ProtoLens.Field.field @"vec'links"
vec'mapValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'mapValue" a) =>
  Lens.Family2.LensLike' f s a
vec'mapValue = Data.ProtoLens.Field.field @"vec'mapValue"
vec'objects ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'objects" a) =>
  Lens.Family2.LensLike' f s a
vec'objects = Data.ProtoLens.Field.field @"vec'objects"
vec'postcommit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'postcommit" a) =>
  Lens.Family2.LensLike' f s a
vec'postcommit = Data.ProtoLens.Field.field @"vec'postcommit"
vec'precommit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'precommit" a) =>
  Lens.Family2.LensLike' f s a
vec'precommit = Data.ProtoLens.Field.field @"vec'precommit"
vec'preflist ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'preflist" a) =>
  Lens.Family2.LensLike' f s a
vec'preflist = Data.ProtoLens.Field.field @"vec'preflist"
vec'removes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'removes" a) =>
  Lens.Family2.LensLike' f s a
vec'removes = Data.ProtoLens.Field.field @"vec'removes"
vec'results ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'results" a) =>
  Lens.Family2.LensLike' f s a
vec'results = Data.ProtoLens.Field.field @"vec'results"
vec'rows ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'rows" a) =>
  Lens.Family2.LensLike' f s a
vec'rows = Data.ProtoLens.Field.field @"vec'rows"
vec'setValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'setValue" a) =>
  Lens.Family2.LensLike' f s a
vec'setValue = Data.ProtoLens.Field.field @"vec'setValue"
vec'unavailableCover ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'unavailableCover" a) =>
  Lens.Family2.LensLike' f s a
vec'unavailableCover
  = Data.ProtoLens.Field.field @"vec'unavailableCover"
vec'updates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'updates" a) =>
  Lens.Family2.LensLike' f s a
vec'updates = Data.ProtoLens.Field.field @"vec'updates"
vec'usermeta ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'usermeta" a) =>
  Lens.Family2.LensLike' f s a
vec'usermeta = Data.ProtoLens.Field.field @"vec'usermeta"
vtag ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "vtag" a) =>
  Lens.Family2.LensLike' f s a
vtag = Data.ProtoLens.Field.field @"vtag"
w ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "w" a) =>
  Lens.Family2.LensLike' f s a
w = Data.ProtoLens.Field.field @"w"
writeOnce ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "writeOnce" a) =>
  Lens.Family2.LensLike' f s a
writeOnce = Data.ProtoLens.Field.field @"writeOnce"
youngVclock ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "youngVclock" a) =>
  Lens.Family2.LensLike' f s a
youngVclock = Data.ProtoLens.Field.field @"youngVclock"