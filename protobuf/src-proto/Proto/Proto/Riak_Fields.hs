{- This file was auto-generated from proto/riak.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.Proto.Riak_Fields where
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

allowMult ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "allowMult" a) =>
            Lens.Family2.LensLike' f s a
allowMult
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "allowMult")
backend ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "backend" a) =>
          Lens.Family2.LensLike' f s a
backend
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "backend")
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
bucket ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "bucket" a) =>
         Lens.Family2.LensLike' f s a
bucket
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")
chashKeyfun ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "chashKeyfun" a) =>
              Lens.Family2.LensLike' f s a
chashKeyfun
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "chashKeyfun")
consistent ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "consistent" a) =>
             Lens.Family2.LensLike' f s a
consistent
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "consistent")
datatype ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "datatype" a) =>
           Lens.Family2.LensLike' f s a
datatype
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "datatype")
dw ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "dw" a) =>
     Lens.Family2.LensLike' f s a
dw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "dw")
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
function ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "function" a) =>
           Lens.Family2.LensLike' f s a
function
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "function")
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
hllPrecision ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "hllPrecision" a) =>
               Lens.Family2.LensLike' f s a
hllPrecision
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "hllPrecision")
key ::
    forall f s a .
      (Prelude.Functor f, Lens.Labels.HasLens' s "key" a) =>
      Lens.Family2.LensLike' f s a
key
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")
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
maybe'allowMult ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'allowMult" a) =>
                  Lens.Family2.LensLike' f s a
maybe'allowMult
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'allowMult")
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
maybe'datatype ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'datatype" a) =>
                 Lens.Family2.LensLike' f s a
maybe'datatype
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'datatype")
maybe'dw ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'dw" a) =>
           Lens.Family2.LensLike' f s a
maybe'dw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'dw")
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
maybe'hllPrecision ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'hllPrecision" a) =>
                     Lens.Family2.LensLike' f s a
maybe'hllPrecision
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'hllPrecision")
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
maybe'oldVclock ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'oldVclock" a) =>
                  Lens.Family2.LensLike' f s a
maybe'oldVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'oldVclock")
maybe'pr ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'pr" a) =>
           Lens.Family2.LensLike' f s a
maybe'pr
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pr")
maybe'pw ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'pw" a) =>
           Lens.Family2.LensLike' f s a
maybe'pw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pw")
maybe'r ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'r" a) =>
          Lens.Family2.LensLike' f s a
maybe'r
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'r")
maybe'repl ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'repl" a) =>
             Lens.Family2.LensLike' f s a
maybe'repl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'repl")
maybe'rw ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'rw" a) =>
           Lens.Family2.LensLike' f s a
maybe'rw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rw")
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
maybe'smallVclock ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'smallVclock" a) =>
                    Lens.Family2.LensLike' f s a
maybe'smallVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'smallVclock")
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
maybe'value ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'value" a) =>
              Lens.Family2.LensLike' f s a
maybe'value
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'value")
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
oldVclock ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "oldVclock" a) =>
            Lens.Family2.LensLike' f s a
oldVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "oldVclock")
password ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "password" a) =>
           Lens.Family2.LensLike' f s a
password
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "password")
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
r ::
  forall f s a . (Prelude.Functor f, Lens.Labels.HasLens' s "r" a) =>
    Lens.Family2.LensLike' f s a
r = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "r")
repl ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "repl" a) =>
       Lens.Family2.LensLike' f s a
repl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "repl")
rw ::
   forall f s a .
     (Prelude.Functor f, Lens.Labels.HasLens' s "rw" a) =>
     Lens.Family2.LensLike' f s a
rw
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "rw")
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
smallVclock ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "smallVclock" a) =>
              Lens.Family2.LensLike' f s a
smallVclock
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "smallVclock")
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
user ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "user" a) =>
       Lens.Family2.LensLike' f s a
user
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "user")
value ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "value" a) =>
        Lens.Family2.LensLike' f s a
value
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "value")
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