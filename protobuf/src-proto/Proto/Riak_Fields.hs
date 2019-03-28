{- This file was auto-generated from riak.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.Riak_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens
       as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum
       as Data.ProtoLens.Message.Enum
import qualified
       Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types
       as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2
       as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked
       as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString
       as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8
       as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Lens.Labels as Lens.Labels
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read

adds ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "adds" a) =>
       Lens.Family2.LensLike' f s a
adds
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "adds")
allowMult ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "allowMult" a) =>
            Lens.Family2.LensLike' f s a
allowMult
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "allowMult")
amount ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "amount" a) =>
         Lens.Family2.LensLike' f s a
amount
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "amount")
asis ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "asis" a) =>
       Lens.Family2.LensLike' f s a
asis
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "asis")
backend ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "backend" a) =>
          Lens.Family2.LensLike' f s a
backend
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "backend")
base ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "base" a) =>
       Lens.Family2.LensLike' f s a
base
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "base")
basicQuorum ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "basicQuorum" a) =>
              Lens.Family2.LensLike' f s a
basicQuorum
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "basicQuorum")
bigVclock ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "bigVclock" a) =>
            Lens.Family2.LensLike' f s a
bigVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bigVclock")
booleanValue ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "booleanValue" a) =>
               Lens.Family2.LensLike' f s a
booleanValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "booleanValue")
bucket ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "bucket" a) =>
         Lens.Family2.LensLike' f s a
bucket
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")
buckets ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "buckets" a) =>
          Lens.Family2.LensLike' f s a
buckets
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "buckets")
cells ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "cells" a) =>
        Lens.Family2.LensLike' f s a
cells
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "cells")
charset ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "charset" a) =>
          Lens.Family2.LensLike' f s a
charset
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "charset")
chashKeyfun ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "chashKeyfun" a) =>
              Lens.Family2.LensLike' f s a
chashKeyfun
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "chashKeyfun")
clientId ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "clientId" a) =>
           Lens.Family2.LensLike' f s a
clientId
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "clientId")
columns ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "columns" a) =>
          Lens.Family2.LensLike' f s a
columns
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "columns")
consistent ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "consistent" a) =>
             Lens.Family2.LensLike' f s a
consistent
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "consistent")
content ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "content" a) =>
          Lens.Family2.LensLike' f s a
content
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "content")
contentEncoding ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "contentEncoding" a) =>
                  Lens.Family2.LensLike' f s a
contentEncoding
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "contentEncoding")
contentType ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "contentType" a) =>
              Lens.Family2.LensLike' f s a
contentType
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "contentType")
context ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "context" a) =>
          Lens.Family2.LensLike' f s a
context
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "context")
continuation ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "continuation" a) =>
               Lens.Family2.LensLike' f s a
continuation
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "continuation")
counterOp ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "counterOp" a) =>
            Lens.Family2.LensLike' f s a
counterOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "counterOp")
counterValue ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "counterValue" a) =>
               Lens.Family2.LensLike' f s a
counterValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "counterValue")
coverContext ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "coverContext" a) =>
               Lens.Family2.LensLike' f s a
coverContext
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "coverContext")
datatype ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "datatype" a) =>
           Lens.Family2.LensLike' f s a
datatype
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "datatype")
deleted ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "deleted" a) =>
          Lens.Family2.LensLike' f s a
deleted
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "deleted")
deletedvclock ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "deletedvclock" a) =>
                Lens.Family2.LensLike' f s a
deletedvclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "deletedvclock")
desc ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "desc" a) =>
       Lens.Family2.LensLike' f s a
desc
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "desc")
df ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "df" a) =>
     Lens.Family2.LensLike' f s a
df
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "df")
docs ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "docs" a) =>
       Lens.Family2.LensLike' f s a
docs
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "docs")
done ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "done" a) =>
       Lens.Family2.LensLike' f s a
done
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "done")
doubleValue ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "doubleValue" a) =>
              Lens.Family2.LensLike' f s a
doubleValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "doubleValue")
dw ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "dw" a) =>
     Lens.Family2.LensLike' f s a
dw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "dw")
endIncl ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "endIncl" a) =>
          Lens.Family2.LensLike' f s a
endIncl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "endIncl")
endKey ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "endKey" a) =>
         Lens.Family2.LensLike' f s a
endKey
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "endKey")
entries ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "entries" a) =>
          Lens.Family2.LensLike' f s a
entries
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "entries")
errcode ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "errcode" a) =>
          Lens.Family2.LensLike' f s a
errcode
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "errcode")
errmsg ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "errmsg" a) =>
         Lens.Family2.LensLike' f s a
errmsg
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "errmsg")
field ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "field" a) =>
        Lens.Family2.LensLike' f s a
field
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "field")
fieldName ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "fieldName" a) =>
            Lens.Family2.LensLike' f s a
fieldName
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fieldName")
fields ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "fields" a) =>
         Lens.Family2.LensLike' f s a
fields
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fields")
filter ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "filter" a) =>
         Lens.Family2.LensLike' f s a
filter
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "filter")
fl ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "fl" a) =>
     Lens.Family2.LensLike' f s a
fl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fl")
flagOp ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "flagOp" a) =>
         Lens.Family2.LensLike' f s a
flagOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "flagOp")
flagValue ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "flagValue" a) =>
            Lens.Family2.LensLike' f s a
flagValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "flagValue")
function ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "function" a) =>
           Lens.Family2.LensLike' f s a
function
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "function")
gsetOp ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "gsetOp" a) =>
         Lens.Family2.LensLike' f s a
gsetOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "gsetOp")
gsetValue ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "gsetValue" a) =>
            Lens.Family2.LensLike' f s a
gsetValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "gsetValue")
hasPostcommit ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "hasPostcommit" a) =>
                Lens.Family2.LensLike' f s a
hasPostcommit
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "hasPostcommit")
hasPrecommit ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "hasPrecommit" a) =>
               Lens.Family2.LensLike' f s a
hasPrecommit
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "hasPrecommit")
head ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "head" a) =>
       Lens.Family2.LensLike' f s a
head
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "head")
hllOp ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "hllOp" a) =>
        Lens.Family2.LensLike' f s a
hllOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "hllOp")
hllPrecision ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "hllPrecision" a) =>
               Lens.Family2.LensLike' f s a
hllPrecision
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "hllPrecision")
hllValue ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "hllValue" a) =>
           Lens.Family2.LensLike' f s a
hllValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "hllValue")
ifModified ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "ifModified" a) =>
             Lens.Family2.LensLike' f s a
ifModified
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ifModified")
ifNoneMatch ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "ifNoneMatch" a) =>
              Lens.Family2.LensLike' f s a
ifNoneMatch
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ifNoneMatch")
ifNotModified ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "ifNotModified" a) =>
                Lens.Family2.LensLike' f s a
ifNotModified
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ifNotModified")
includeContext ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "includeContext" a) =>
                 Lens.Family2.LensLike' f s a
includeContext
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "includeContext")
increment ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "increment" a) =>
            Lens.Family2.LensLike' f s a
increment
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "increment")
index ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "index" a) =>
        Lens.Family2.LensLike' f s a
index
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "index")
indexes ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "indexes" a) =>
          Lens.Family2.LensLike' f s a
indexes
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "indexes")
interpolations ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "interpolations" a) =>
                 Lens.Family2.LensLike' f s a
interpolations
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "interpolations")
ip ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "ip" a) =>
     Lens.Family2.LensLike' f s a
ip
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ip")
key ::
    forall f s a .
      (Prelude.Functor f, Lens.Labels.HasLens' s "key" a) =>
      Lens.Family2.LensLike' f s a
key
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")
keys ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "keys" a) =>
       Lens.Family2.LensLike' f s a
keys
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "keys")
keyspaceDesc ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "keyspaceDesc" a) =>
               Lens.Family2.LensLike' f s a
keyspaceDesc
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "keyspaceDesc")
lastMod ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "lastMod" a) =>
          Lens.Family2.LensLike' f s a
lastMod
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "lastMod")
lastModUsecs ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "lastModUsecs" a) =>
               Lens.Family2.LensLike' f s a
lastModUsecs
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "lastModUsecs")
lastWriteWins ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "lastWriteWins" a) =>
                Lens.Family2.LensLike' f s a
lastWriteWins
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "lastWriteWins")
linkfun ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "linkfun" a) =>
          Lens.Family2.LensLike' f s a
linkfun
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "linkfun")
links ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "links" a) =>
        Lens.Family2.LensLike' f s a
links
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "links")
lowerBound ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "lowerBound" a) =>
             Lens.Family2.LensLike' f s a
lowerBound
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "lowerBound")
lowerBoundInclusive ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "lowerBoundInclusive" a) =>
                      Lens.Family2.LensLike' f s a
lowerBoundInclusive
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "lowerBoundInclusive")
mapOp ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "mapOp" a) =>
        Lens.Family2.LensLike' f s a
mapOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "mapOp")
mapValue ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "mapValue" a) =>
           Lens.Family2.LensLike' f s a
mapValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "mapValue")
maxResults ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maxResults" a) =>
             Lens.Family2.LensLike' f s a
maxResults
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maxResults")
maxScore ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maxScore" a) =>
           Lens.Family2.LensLike' f s a
maxScore
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maxScore")
maybe'allowMult ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'allowMult" a) =>
                  Lens.Family2.LensLike' f s a
maybe'allowMult
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'allowMult")
maybe'asis ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'asis" a) =>
             Lens.Family2.LensLike' f s a
maybe'asis
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'asis")
maybe'backend ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'backend" a) =>
                Lens.Family2.LensLike' f s a
maybe'backend
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'backend")
maybe'basicQuorum ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'basicQuorum" a) =>
                    Lens.Family2.LensLike' f s a
maybe'basicQuorum
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'basicQuorum")
maybe'bigVclock ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'bigVclock" a) =>
                  Lens.Family2.LensLike' f s a
maybe'bigVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'bigVclock")
maybe'booleanValue ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'booleanValue" a) =>
                     Lens.Family2.LensLike' f s a
maybe'booleanValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'booleanValue")
maybe'bucket ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'bucket" a) =>
               Lens.Family2.LensLike' f s a
maybe'bucket
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'bucket")
maybe'charset ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'charset" a) =>
                Lens.Family2.LensLike' f s a
maybe'charset
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'charset")
maybe'chashKeyfun ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'chashKeyfun" a) =>
                    Lens.Family2.LensLike' f s a
maybe'chashKeyfun
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'chashKeyfun")
maybe'consistent ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'consistent" a) =>
                   Lens.Family2.LensLike' f s a
maybe'consistent
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'consistent")
maybe'content ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'content" a) =>
                Lens.Family2.LensLike' f s a
maybe'content
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'content")
maybe'contentEncoding ::
                      forall f s a .
                        (Prelude.Functor f,
                         Lens.Labels.HasLens' s "maybe'contentEncoding" a) =>
                        Lens.Family2.LensLike' f s a
maybe'contentEncoding
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'contentEncoding")
maybe'contentType ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'contentType" a) =>
                    Lens.Family2.LensLike' f s a
maybe'contentType
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'contentType")
maybe'context ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'context" a) =>
                Lens.Family2.LensLike' f s a
maybe'context
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'context")
maybe'continuation ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'continuation" a) =>
                     Lens.Family2.LensLike' f s a
maybe'continuation
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'continuation")
maybe'counterOp ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'counterOp" a) =>
                  Lens.Family2.LensLike' f s a
maybe'counterOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'counterOp")
maybe'counterValue ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'counterValue" a) =>
                     Lens.Family2.LensLike' f s a
maybe'counterValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'counterValue")
maybe'coverContext ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'coverContext" a) =>
                     Lens.Family2.LensLike' f s a
maybe'coverContext
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'coverContext")
maybe'datatype ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'datatype" a) =>
                 Lens.Family2.LensLike' f s a
maybe'datatype
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'datatype")
maybe'deleted ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'deleted" a) =>
                Lens.Family2.LensLike' f s a
maybe'deleted
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'deleted")
maybe'deletedvclock ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "maybe'deletedvclock" a) =>
                      Lens.Family2.LensLike' f s a
maybe'deletedvclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'deletedvclock")
maybe'df ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'df" a) =>
           Lens.Family2.LensLike' f s a
maybe'df
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'df")
maybe'done ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'done" a) =>
             Lens.Family2.LensLike' f s a
maybe'done
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'done")
maybe'doubleValue ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'doubleValue" a) =>
                    Lens.Family2.LensLike' f s a
maybe'doubleValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'doubleValue")
maybe'dw ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'dw" a) =>
           Lens.Family2.LensLike' f s a
maybe'dw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'dw")
maybe'endIncl ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'endIncl" a) =>
                Lens.Family2.LensLike' f s a
maybe'endIncl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'endIncl")
maybe'endKey ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'endKey" a) =>
               Lens.Family2.LensLike' f s a
maybe'endKey
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'endKey")
maybe'filter ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'filter" a) =>
               Lens.Family2.LensLike' f s a
maybe'filter
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'filter")
maybe'flagOp ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'flagOp" a) =>
               Lens.Family2.LensLike' f s a
maybe'flagOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'flagOp")
maybe'flagValue ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'flagValue" a) =>
                  Lens.Family2.LensLike' f s a
maybe'flagValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'flagValue")
maybe'gsetOp ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'gsetOp" a) =>
               Lens.Family2.LensLike' f s a
maybe'gsetOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'gsetOp")
maybe'hasPostcommit ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "maybe'hasPostcommit" a) =>
                      Lens.Family2.LensLike' f s a
maybe'hasPostcommit
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'hasPostcommit")
maybe'hasPrecommit ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'hasPrecommit" a) =>
                     Lens.Family2.LensLike' f s a
maybe'hasPrecommit
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'hasPrecommit")
maybe'head ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'head" a) =>
             Lens.Family2.LensLike' f s a
maybe'head
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'head")
maybe'hllOp ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'hllOp" a) =>
              Lens.Family2.LensLike' f s a
maybe'hllOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'hllOp")
maybe'hllPrecision ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'hllPrecision" a) =>
                     Lens.Family2.LensLike' f s a
maybe'hllPrecision
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'hllPrecision")
maybe'hllValue ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'hllValue" a) =>
                 Lens.Family2.LensLike' f s a
maybe'hllValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'hllValue")
maybe'ifModified ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'ifModified" a) =>
                   Lens.Family2.LensLike' f s a
maybe'ifModified
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'ifModified")
maybe'ifNoneMatch ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'ifNoneMatch" a) =>
                    Lens.Family2.LensLike' f s a
maybe'ifNoneMatch
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'ifNoneMatch")
maybe'ifNotModified ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "maybe'ifNotModified" a) =>
                      Lens.Family2.LensLike' f s a
maybe'ifNotModified
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'ifNotModified")
maybe'includeContext ::
                     forall f s a .
                       (Prelude.Functor f,
                        Lens.Labels.HasLens' s "maybe'includeContext" a) =>
                       Lens.Family2.LensLike' f s a
maybe'includeContext
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'includeContext")
maybe'increment ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'increment" a) =>
                  Lens.Family2.LensLike' f s a
maybe'increment
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'increment")
maybe'key ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'key" a) =>
            Lens.Family2.LensLike' f s a
maybe'key
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'key")
maybe'keyspaceDesc ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'keyspaceDesc" a) =>
                     Lens.Family2.LensLike' f s a
maybe'keyspaceDesc
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'keyspaceDesc")
maybe'lastMod ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'lastMod" a) =>
                Lens.Family2.LensLike' f s a
maybe'lastMod
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'lastMod")
maybe'lastModUsecs ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'lastModUsecs" a) =>
                     Lens.Family2.LensLike' f s a
maybe'lastModUsecs
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'lastModUsecs")
maybe'lastWriteWins ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "maybe'lastWriteWins" a) =>
                      Lens.Family2.LensLike' f s a
maybe'lastWriteWins
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'lastWriteWins")
maybe'linkfun ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'linkfun" a) =>
                Lens.Family2.LensLike' f s a
maybe'linkfun
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'linkfun")
maybe'mapOp ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'mapOp" a) =>
              Lens.Family2.LensLike' f s a
maybe'mapOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'mapOp")
maybe'maxResults ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'maxResults" a) =>
                   Lens.Family2.LensLike' f s a
maybe'maxResults
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'maxResults")
maybe'maxScore ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'maxScore" a) =>
                 Lens.Family2.LensLike' f s a
maybe'maxScore
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'maxScore")
maybe'minPartitions ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "maybe'minPartitions" a) =>
                      Lens.Family2.LensLike' f s a
maybe'minPartitions
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'minPartitions")
maybe'modfun ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'modfun" a) =>
               Lens.Family2.LensLike' f s a
maybe'modfun
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'modfun")
maybe'nVal ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'nVal" a) =>
             Lens.Family2.LensLike' f s a
maybe'nVal
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'nVal")
maybe'name ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'name" a) =>
             Lens.Family2.LensLike' f s a
maybe'name
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")
maybe'node ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'node" a) =>
             Lens.Family2.LensLike' f s a
maybe'node
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'node")
maybe'notfoundOk ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'notfoundOk" a) =>
                   Lens.Family2.LensLike' f s a
maybe'notfoundOk
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'notfoundOk")
maybe'numFound ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'numFound" a) =>
                 Lens.Family2.LensLike' f s a
maybe'numFound
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'numFound")
maybe'oldVclock ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'oldVclock" a) =>
                  Lens.Family2.LensLike' f s a
maybe'oldVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'oldVclock")
maybe'op ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'op" a) =>
           Lens.Family2.LensLike' f s a
maybe'op
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'op")
maybe'paginationSort ::
                     forall f s a .
                       (Prelude.Functor f,
                        Lens.Labels.HasLens' s "maybe'paginationSort" a) =>
                       Lens.Family2.LensLike' f s a
maybe'paginationSort
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'paginationSort")
maybe'phase ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'phase" a) =>
              Lens.Family2.LensLike' f s a
maybe'phase
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'phase")
maybe'pr ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'pr" a) =>
           Lens.Family2.LensLike' f s a
maybe'pr
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pr")
maybe'presort ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'presort" a) =>
                Lens.Family2.LensLike' f s a
maybe'presort
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'presort")
maybe'pw ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'pw" a) =>
           Lens.Family2.LensLike' f s a
maybe'pw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pw")
maybe'query ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'query" a) =>
              Lens.Family2.LensLike' f s a
maybe'query
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'query")
maybe'r ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'r" a) =>
          Lens.Family2.LensLike' f s a
maybe'r
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'r")
maybe'range ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'range" a) =>
              Lens.Family2.LensLike' f s a
maybe'range
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'range")
maybe'rangeMax ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'rangeMax" a) =>
                 Lens.Family2.LensLike' f s a
maybe'rangeMax
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rangeMax")
maybe'rangeMin ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'rangeMin" a) =>
                 Lens.Family2.LensLike' f s a
maybe'rangeMin
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rangeMin")
maybe'registerOp ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'registerOp" a) =>
                   Lens.Family2.LensLike' f s a
maybe'registerOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'registerOp")
maybe'registerValue ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "maybe'registerValue" a) =>
                      Lens.Family2.LensLike' f s a
maybe'registerValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'registerValue")
maybe'repl ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'repl" a) =>
             Lens.Family2.LensLike' f s a
maybe'repl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'repl")
maybe'replaceCover ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'replaceCover" a) =>
                     Lens.Family2.LensLike' f s a
maybe'replaceCover
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'replaceCover")
maybe'response ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'response" a) =>
                 Lens.Family2.LensLike' f s a
maybe'response
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'response")
maybe'returnBody ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'returnBody" a) =>
                   Lens.Family2.LensLike' f s a
maybe'returnBody
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'returnBody")
maybe'returnHead ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'returnHead" a) =>
                   Lens.Family2.LensLike' f s a
maybe'returnHead
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'returnHead")
maybe'returnTerms ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'returnTerms" a) =>
                    Lens.Family2.LensLike' f s a
maybe'returnTerms
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'returnTerms")
maybe'returnvalue ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'returnvalue" a) =>
                    Lens.Family2.LensLike' f s a
maybe'returnvalue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'returnvalue")
maybe'rows ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'rows" a) =>
             Lens.Family2.LensLike' f s a
maybe'rows
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rows")
maybe'rw ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'rw" a) =>
           Lens.Family2.LensLike' f s a
maybe'rw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rw")
maybe'schema ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'schema" a) =>
               Lens.Family2.LensLike' f s a
maybe'schema
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'schema")
maybe'search ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'search" a) =>
               Lens.Family2.LensLike' f s a
maybe'search
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'search")
maybe'searchIndex ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'searchIndex" a) =>
                    Lens.Family2.LensLike' f s a
maybe'searchIndex
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'searchIndex")
maybe'serverVersion ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "maybe'serverVersion" a) =>
                      Lens.Family2.LensLike' f s a
maybe'serverVersion
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'serverVersion")
maybe'setOp ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'setOp" a) =>
              Lens.Family2.LensLike' f s a
maybe'setOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'setOp")
maybe'sint64Value ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'sint64Value" a) =>
                    Lens.Family2.LensLike' f s a
maybe'sint64Value
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'sint64Value")
maybe'sloppyQuorum ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'sloppyQuorum" a) =>
                     Lens.Family2.LensLike' f s a
maybe'sloppyQuorum
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'sloppyQuorum")
maybe'smallVclock ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'smallVclock" a) =>
                    Lens.Family2.LensLike' f s a
maybe'smallVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'smallVclock")
maybe'sort ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'sort" a) =>
             Lens.Family2.LensLike' f s a
maybe'sort
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'sort")
maybe'start ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'start" a) =>
              Lens.Family2.LensLike' f s a
maybe'start
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'start")
maybe'startIncl ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'startIncl" a) =>
                  Lens.Family2.LensLike' f s a
maybe'startIncl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'startIncl")
maybe'stream ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'stream" a) =>
               Lens.Family2.LensLike' f s a
maybe'stream
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'stream")
maybe'tag ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'tag" a) =>
            Lens.Family2.LensLike' f s a
maybe'tag
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'tag")
maybe'termRegex ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'termRegex" a) =>
                  Lens.Family2.LensLike' f s a
maybe'termRegex
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'termRegex")
maybe'timeout ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'timeout" a) =>
                Lens.Family2.LensLike' f s a
maybe'timeout
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")
maybe'timestampValue ::
                     forall f s a .
                       (Prelude.Functor f,
                        Lens.Labels.HasLens' s "maybe'timestampValue" a) =>
                       Lens.Family2.LensLike' f s a
maybe'timestampValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'timestampValue")
maybe'ttl ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'ttl" a) =>
            Lens.Family2.LensLike' f s a
maybe'ttl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'ttl")
maybe'type' ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'type'" a) =>
              Lens.Family2.LensLike' f s a
maybe'type'
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")
maybe'unchanged ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'unchanged" a) =>
                  Lens.Family2.LensLike' f s a
maybe'unchanged
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'unchanged")
maybe'value ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'value" a) =>
              Lens.Family2.LensLike' f s a
maybe'value
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'value")
maybe'varcharValue ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'varcharValue" a) =>
                     Lens.Family2.LensLike' f s a
maybe'varcharValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'varcharValue")
maybe'vclock ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'vclock" a) =>
               Lens.Family2.LensLike' f s a
maybe'vclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'vclock")
maybe'vtag ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'vtag" a) =>
             Lens.Family2.LensLike' f s a
maybe'vtag
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'vtag")
maybe'w ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'w" a) =>
          Lens.Family2.LensLike' f s a
maybe'w
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'w")
maybe'writeOnce ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'writeOnce" a) =>
                  Lens.Family2.LensLike' f s a
maybe'writeOnce
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'writeOnce")
maybe'youngVclock ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'youngVclock" a) =>
                    Lens.Family2.LensLike' f s a
maybe'youngVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'youngVclock")
minPartitions ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "minPartitions" a) =>
                Lens.Family2.LensLike' f s a
minPartitions
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "minPartitions")
modfun ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "modfun" a) =>
         Lens.Family2.LensLike' f s a
modfun
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "modfun")
module' ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "module'" a) =>
          Lens.Family2.LensLike' f s a
module'
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "module'")
nVal ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "nVal" a) =>
       Lens.Family2.LensLike' f s a
nVal
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "nVal")
name ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "name" a) =>
       Lens.Family2.LensLike' f s a
name
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")
node ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "node" a) =>
       Lens.Family2.LensLike' f s a
node
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "node")
notfoundOk ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "notfoundOk" a) =>
             Lens.Family2.LensLike' f s a
notfoundOk
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "notfoundOk")
numFound ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "numFound" a) =>
           Lens.Family2.LensLike' f s a
numFound
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "numFound")
object ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "object" a) =>
         Lens.Family2.LensLike' f s a
object
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "object")
objects ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "objects" a) =>
          Lens.Family2.LensLike' f s a
objects
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "objects")
oldVclock ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "oldVclock" a) =>
            Lens.Family2.LensLike' f s a
oldVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "oldVclock")
op ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "op" a) =>
     Lens.Family2.LensLike' f s a
op
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "op")
paginationSort ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "paginationSort" a) =>
                 Lens.Family2.LensLike' f s a
paginationSort
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "paginationSort")
partition ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "partition" a) =>
            Lens.Family2.LensLike' f s a
partition
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "partition")
password ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "password" a) =>
           Lens.Family2.LensLike' f s a
password
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "password")
phase ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "phase" a) =>
        Lens.Family2.LensLike' f s a
phase
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "phase")
port ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "port" a) =>
       Lens.Family2.LensLike' f s a
port
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "port")
postcommit ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "postcommit" a) =>
             Lens.Family2.LensLike' f s a
postcommit
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "postcommit")
pr ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "pr" a) =>
     Lens.Family2.LensLike' f s a
pr
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "pr")
precommit ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "precommit" a) =>
            Lens.Family2.LensLike' f s a
precommit
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "precommit")
preflist ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "preflist" a) =>
           Lens.Family2.LensLike' f s a
preflist
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "preflist")
presort ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "presort" a) =>
          Lens.Family2.LensLike' f s a
presort
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "presort")
primary ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "primary" a) =>
          Lens.Family2.LensLike' f s a
primary
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "primary")
props ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "props" a) =>
        Lens.Family2.LensLike' f s a
props
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "props")
pw ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "pw" a) =>
     Lens.Family2.LensLike' f s a
pw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "pw")
q ::
  forall f s a . (Prelude.Functor f, Lens.Labels.HasLens' s "q" a) =>
    Lens.Family2.LensLike' f s a
q = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "q")
qtype ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "qtype" a) =>
        Lens.Family2.LensLike' f s a
qtype
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "qtype")
query ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "query" a) =>
        Lens.Family2.LensLike' f s a
query
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "query")
r ::
  forall f s a . (Prelude.Functor f, Lens.Labels.HasLens' s "r" a) =>
    Lens.Family2.LensLike' f s a
r = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "r")
range ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "range" a) =>
        Lens.Family2.LensLike' f s a
range
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "range")
rangeMax ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "rangeMax" a) =>
           Lens.Family2.LensLike' f s a
rangeMax
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "rangeMax")
rangeMin ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "rangeMin" a) =>
           Lens.Family2.LensLike' f s a
rangeMin
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "rangeMin")
registerOp ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "registerOp" a) =>
             Lens.Family2.LensLike' f s a
registerOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "registerOp")
registerValue ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "registerValue" a) =>
                Lens.Family2.LensLike' f s a
registerValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "registerValue")
removes ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "removes" a) =>
          Lens.Family2.LensLike' f s a
removes
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "removes")
repl ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "repl" a) =>
       Lens.Family2.LensLike' f s a
repl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "repl")
replaceCover ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "replaceCover" a) =>
               Lens.Family2.LensLike' f s a
replaceCover
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "replaceCover")
request ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "request" a) =>
          Lens.Family2.LensLike' f s a
request
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "request")
response ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "response" a) =>
           Lens.Family2.LensLike' f s a
response
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "response")
results ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "results" a) =>
          Lens.Family2.LensLike' f s a
results
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "results")
returnBody ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "returnBody" a) =>
             Lens.Family2.LensLike' f s a
returnBody
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "returnBody")
returnHead ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "returnHead" a) =>
             Lens.Family2.LensLike' f s a
returnHead
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "returnHead")
returnTerms ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "returnTerms" a) =>
              Lens.Family2.LensLike' f s a
returnTerms
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "returnTerms")
returnvalue ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "returnvalue" a) =>
              Lens.Family2.LensLike' f s a
returnvalue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "returnvalue")
rows ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "rows" a) =>
       Lens.Family2.LensLike' f s a
rows
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "rows")
rw ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "rw" a) =>
     Lens.Family2.LensLike' f s a
rw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "rw")
schema ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "schema" a) =>
         Lens.Family2.LensLike' f s a
schema
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "schema")
search ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "search" a) =>
         Lens.Family2.LensLike' f s a
search
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "search")
searchIndex ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "searchIndex" a) =>
              Lens.Family2.LensLike' f s a
searchIndex
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "searchIndex")
serverVersion ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "serverVersion" a) =>
                Lens.Family2.LensLike' f s a
serverVersion
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "serverVersion")
setOp ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "setOp" a) =>
        Lens.Family2.LensLike' f s a
setOp
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "setOp")
setValue ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "setValue" a) =>
           Lens.Family2.LensLike' f s a
setValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "setValue")
sint64Value ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "sint64Value" a) =>
              Lens.Family2.LensLike' f s a
sint64Value
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "sint64Value")
sloppyQuorum ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "sloppyQuorum" a) =>
               Lens.Family2.LensLike' f s a
sloppyQuorum
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "sloppyQuorum")
smallVclock ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "smallVclock" a) =>
              Lens.Family2.LensLike' f s a
smallVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "smallVclock")
sort ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "sort" a) =>
       Lens.Family2.LensLike' f s a
sort
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "sort")
start ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "start" a) =>
        Lens.Family2.LensLike' f s a
start
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "start")
startIncl ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "startIncl" a) =>
            Lens.Family2.LensLike' f s a
startIncl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "startIncl")
startKey ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "startKey" a) =>
           Lens.Family2.LensLike' f s a
startKey
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "startKey")
stream ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "stream" a) =>
         Lens.Family2.LensLike' f s a
stream
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "stream")
table ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "table" a) =>
        Lens.Family2.LensLike' f s a
table
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "table")
tag ::
    forall f s a .
      (Prelude.Functor f, Lens.Labels.HasLens' s "tag" a) =>
      Lens.Family2.LensLike' f s a
tag
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "tag")
termRegex ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "termRegex" a) =>
            Lens.Family2.LensLike' f s a
termRegex
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "termRegex")
timeout ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "timeout" a) =>
          Lens.Family2.LensLike' f s a
timeout
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "timeout")
timestampValue ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "timestampValue" a) =>
                 Lens.Family2.LensLike' f s a
timestampValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "timestampValue")
ttl ::
    forall f s a .
      (Prelude.Functor f, Lens.Labels.HasLens' s "ttl" a) =>
      Lens.Family2.LensLike' f s a
ttl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ttl")
type' ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "type'" a) =>
        Lens.Family2.LensLike' f s a
type'
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")
unavailableCover ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "unavailableCover" a) =>
                   Lens.Family2.LensLike' f s a
unavailableCover
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "unavailableCover")
unchanged ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "unchanged" a) =>
            Lens.Family2.LensLike' f s a
unchanged
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "unchanged")
updates ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "updates" a) =>
          Lens.Family2.LensLike' f s a
updates
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "updates")
upperBound ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "upperBound" a) =>
             Lens.Family2.LensLike' f s a
upperBound
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "upperBound")
upperBoundInclusive ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "upperBoundInclusive" a) =>
                      Lens.Family2.LensLike' f s a
upperBoundInclusive
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "upperBoundInclusive")
user ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "user" a) =>
       Lens.Family2.LensLike' f s a
user
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "user")
usermeta ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "usermeta" a) =>
           Lens.Family2.LensLike' f s a
usermeta
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "usermeta")
value ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "value" a) =>
        Lens.Family2.LensLike' f s a
value
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "value")
varcharValue ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "varcharValue" a) =>
               Lens.Family2.LensLike' f s a
varcharValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "varcharValue")
vclock ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "vclock" a) =>
         Lens.Family2.LensLike' f s a
vclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "vclock")
vtag ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "vtag" a) =>
       Lens.Family2.LensLike' f s a
vtag
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "vtag")
w ::
  forall f s a . (Prelude.Functor f, Lens.Labels.HasLens' s "w" a) =>
    Lens.Family2.LensLike' f s a
w = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "w")
writeOnce ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "writeOnce" a) =>
            Lens.Family2.LensLike' f s a
writeOnce
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "writeOnce")
youngVclock ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "youngVclock" a) =>
              Lens.Family2.LensLike' f s a
youngVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "youngVclock")