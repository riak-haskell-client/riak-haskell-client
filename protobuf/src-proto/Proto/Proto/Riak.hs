{- This file was auto-generated from proto/riak.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.Proto.Riak
       (RpbAuthReq(), RpbBucketProps(), RpbBucketProps'RpbReplMode(..),
        RpbBucketProps'RpbReplMode(), RpbCommitHook(), RpbErrorResp(),
        RpbGetBucketReq(), RpbGetBucketResp(), RpbGetBucketTypeReq(),
        RpbGetServerInfoResp(), RpbModFun(), RpbPair(),
        RpbResetBucketReq(), RpbSetBucketReq(), RpbSetBucketTypeReq())
       where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq
       as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Lens.Labels.Prism
       as Lens.Labels.Prism
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

{- | Fields :

    * 'Proto.Proto.Riak_Fields.user' @:: Lens' RpbAuthReq Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.password' @:: Lens' RpbAuthReq Data.ByteString.ByteString@
 -}
data RpbAuthReq = RpbAuthReq{_RpbAuthReq'user ::
                             !Data.ByteString.ByteString,
                             _RpbAuthReq'password :: !Data.ByteString.ByteString,
                             _RpbAuthReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbAuthReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbAuthReq "user"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbAuthReq'user
                 (\ x__ y__ -> x__{_RpbAuthReq'user = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbAuthReq "password"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbAuthReq'password
                 (\ x__ y__ -> x__{_RpbAuthReq'password = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbAuthReq where
        messageName _ = Data.Text.pack "RpbAuthReq"
        fieldsByTag
          = let user__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "user"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "user")))
                      :: Data.ProtoLens.FieldDescriptor RpbAuthReq
                password__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "password"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "password")))
                      :: Data.ProtoLens.FieldDescriptor RpbAuthReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, user__field_descriptor),
                 (Data.ProtoLens.Tag 2, password__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbAuthReq'_unknownFields
              (\ x__ y__ -> x__{_RpbAuthReq'_unknownFields = y__})
        defMessage
          = RpbAuthReq{_RpbAuthReq'user = Data.ProtoLens.fieldDefault,
                       _RpbAuthReq'password = Data.ProtoLens.fieldDefault,
                       _RpbAuthReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbAuthReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbAuthReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbAuthReq'user x__)
                   (Control.DeepSeq.deepseq (_RpbAuthReq'password x__) (())))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.nVal' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'nVal' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.allowMult' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Proto.Riak_Fields.maybe'allowMult' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Proto.Riak_Fields.lastWriteWins' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Proto.Riak_Fields.maybe'lastWriteWins' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Proto.Riak_Fields.precommit' @:: Lens' RpbBucketProps [RpbCommitHook]@
    * 'Proto.Proto.Riak_Fields.hasPrecommit' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Proto.Riak_Fields.maybe'hasPrecommit' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Proto.Riak_Fields.postcommit' @:: Lens' RpbBucketProps [RpbCommitHook]@
    * 'Proto.Proto.Riak_Fields.hasPostcommit' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Proto.Riak_Fields.maybe'hasPostcommit' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Proto.Riak_Fields.chashKeyfun' @:: Lens' RpbBucketProps RpbModFun@
    * 'Proto.Proto.Riak_Fields.maybe'chashKeyfun' @:: Lens' RpbBucketProps (Prelude.Maybe RpbModFun)@
    * 'Proto.Proto.Riak_Fields.linkfun' @:: Lens' RpbBucketProps RpbModFun@
    * 'Proto.Proto.Riak_Fields.maybe'linkfun' @:: Lens' RpbBucketProps (Prelude.Maybe RpbModFun)@
    * 'Proto.Proto.Riak_Fields.oldVclock' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'oldVclock' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.youngVclock' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'youngVclock' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.bigVclock' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'bigVclock' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.smallVclock' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'smallVclock' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.pr' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'pr' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.r' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'r' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.w' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'w' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.pw' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'pw' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.dw' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'dw' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.rw' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'rw' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.basicQuorum' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Proto.Riak_Fields.maybe'basicQuorum' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Proto.Riak_Fields.notfoundOk' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Proto.Riak_Fields.maybe'notfoundOk' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Proto.Riak_Fields.backend' @:: Lens' RpbBucketProps Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'backend' @:: Lens' RpbBucketProps (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Proto.Riak_Fields.search' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Proto.Riak_Fields.maybe'search' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Proto.Riak_Fields.repl' @:: Lens' RpbBucketProps RpbBucketProps'RpbReplMode@
    * 'Proto.Proto.Riak_Fields.maybe'repl' @:: Lens' RpbBucketProps (Prelude.Maybe RpbBucketProps'RpbReplMode)@
    * 'Proto.Proto.Riak_Fields.searchIndex' @:: Lens' RpbBucketProps Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'searchIndex' @:: Lens' RpbBucketProps (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Proto.Riak_Fields.datatype' @:: Lens' RpbBucketProps Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'datatype' @:: Lens' RpbBucketProps (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Proto.Riak_Fields.consistent' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Proto.Riak_Fields.maybe'consistent' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Proto.Riak_Fields.writeOnce' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Proto.Riak_Fields.maybe'writeOnce' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Proto.Riak_Fields.hllPrecision' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'hllPrecision' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Proto.Riak_Fields.ttl' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Proto.Riak_Fields.maybe'ttl' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
 -}
data RpbBucketProps = RpbBucketProps{_RpbBucketProps'nVal ::
                                     !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'allowMult :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbBucketProps'lastWriteWins :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbBucketProps'precommit :: ![RpbCommitHook],
                                     _RpbBucketProps'hasPrecommit :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbBucketProps'postcommit :: ![RpbCommitHook],
                                     _RpbBucketProps'hasPostcommit :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbBucketProps'chashKeyfun :: !(Prelude.Maybe RpbModFun),
                                     _RpbBucketProps'linkfun :: !(Prelude.Maybe RpbModFun),
                                     _RpbBucketProps'oldVclock :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'youngVclock ::
                                     !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'bigVclock :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'smallVclock ::
                                     !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'pr :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'r :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'w :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'pw :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'dw :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'rw :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'basicQuorum :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbBucketProps'notfoundOk :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbBucketProps'backend ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbBucketProps'search :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbBucketProps'repl ::
                                     !(Prelude.Maybe RpbBucketProps'RpbReplMode),
                                     _RpbBucketProps'searchIndex ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbBucketProps'datatype ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbBucketProps'consistent :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbBucketProps'writeOnce :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbBucketProps'hllPrecision ::
                                     !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'ttl :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbBucketProps'_unknownFields :: !Data.ProtoLens.FieldSet}
                        deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbBucketProps where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbBucketProps "nVal"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'nVal
                 (\ x__ y__ -> x__{_RpbBucketProps'nVal = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'nVal"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'nVal
                 (\ x__ y__ -> x__{_RpbBucketProps'nVal = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "allowMult"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'allowMult
                 (\ x__ y__ -> x__{_RpbBucketProps'allowMult = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'allowMult"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'allowMult
                 (\ x__ y__ -> x__{_RpbBucketProps'allowMult = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "lastWriteWins"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'lastWriteWins
                 (\ x__ y__ -> x__{_RpbBucketProps'lastWriteWins = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'lastWriteWins"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'lastWriteWins
                 (\ x__ y__ -> x__{_RpbBucketProps'lastWriteWins = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "precommit"
           ([RpbCommitHook])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'precommit
                 (\ x__ y__ -> x__{_RpbBucketProps'precommit = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "hasPrecommit"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'hasPrecommit
                 (\ x__ y__ -> x__{_RpbBucketProps'hasPrecommit = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'hasPrecommit"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'hasPrecommit
                 (\ x__ y__ -> x__{_RpbBucketProps'hasPrecommit = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "postcommit"
           ([RpbCommitHook])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'postcommit
                 (\ x__ y__ -> x__{_RpbBucketProps'postcommit = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "hasPostcommit"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'hasPostcommit
                 (\ x__ y__ -> x__{_RpbBucketProps'hasPostcommit = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'hasPostcommit"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'hasPostcommit
                 (\ x__ y__ -> x__{_RpbBucketProps'hasPostcommit = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "chashKeyfun"
           (RpbModFun)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'chashKeyfun
                 (\ x__ y__ -> x__{_RpbBucketProps'chashKeyfun = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'chashKeyfun"
           (Prelude.Maybe RpbModFun)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'chashKeyfun
                 (\ x__ y__ -> x__{_RpbBucketProps'chashKeyfun = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "linkfun" (RpbModFun)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'linkfun
                 (\ x__ y__ -> x__{_RpbBucketProps'linkfun = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'linkfun"
           (Prelude.Maybe RpbModFun)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'linkfun
                 (\ x__ y__ -> x__{_RpbBucketProps'linkfun = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "oldVclock"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'oldVclock
                 (\ x__ y__ -> x__{_RpbBucketProps'oldVclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'oldVclock"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'oldVclock
                 (\ x__ y__ -> x__{_RpbBucketProps'oldVclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "youngVclock"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'youngVclock
                 (\ x__ y__ -> x__{_RpbBucketProps'youngVclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'youngVclock"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'youngVclock
                 (\ x__ y__ -> x__{_RpbBucketProps'youngVclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "bigVclock"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'bigVclock
                 (\ x__ y__ -> x__{_RpbBucketProps'bigVclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'bigVclock"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'bigVclock
                 (\ x__ y__ -> x__{_RpbBucketProps'bigVclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "smallVclock"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'smallVclock
                 (\ x__ y__ -> x__{_RpbBucketProps'smallVclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'smallVclock"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'smallVclock
                 (\ x__ y__ -> x__{_RpbBucketProps'smallVclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "pr"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'pr
                 (\ x__ y__ -> x__{_RpbBucketProps'pr = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'pr"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'pr
                 (\ x__ y__ -> x__{_RpbBucketProps'pr = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "r" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'r
                 (\ x__ y__ -> x__{_RpbBucketProps'r = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'r"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'r
                 (\ x__ y__ -> x__{_RpbBucketProps'r = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "w" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'w
                 (\ x__ y__ -> x__{_RpbBucketProps'w = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'w"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'w
                 (\ x__ y__ -> x__{_RpbBucketProps'w = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "pw"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'pw
                 (\ x__ y__ -> x__{_RpbBucketProps'pw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'pw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'pw
                 (\ x__ y__ -> x__{_RpbBucketProps'pw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "dw"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'dw
                 (\ x__ y__ -> x__{_RpbBucketProps'dw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'dw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'dw
                 (\ x__ y__ -> x__{_RpbBucketProps'dw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "rw"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'rw
                 (\ x__ y__ -> x__{_RpbBucketProps'rw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'rw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'rw
                 (\ x__ y__ -> x__{_RpbBucketProps'rw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "basicQuorum"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'basicQuorum
                 (\ x__ y__ -> x__{_RpbBucketProps'basicQuorum = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'basicQuorum"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'basicQuorum
                 (\ x__ y__ -> x__{_RpbBucketProps'basicQuorum = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "notfoundOk"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'notfoundOk
                 (\ x__ y__ -> x__{_RpbBucketProps'notfoundOk = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'notfoundOk"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'notfoundOk
                 (\ x__ y__ -> x__{_RpbBucketProps'notfoundOk = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "backend"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'backend
                 (\ x__ y__ -> x__{_RpbBucketProps'backend = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'backend"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'backend
                 (\ x__ y__ -> x__{_RpbBucketProps'backend = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "search"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'search
                 (\ x__ y__ -> x__{_RpbBucketProps'search = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'search"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'search
                 (\ x__ y__ -> x__{_RpbBucketProps'search = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "repl"
           (RpbBucketProps'RpbReplMode)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'repl
                 (\ x__ y__ -> x__{_RpbBucketProps'repl = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'repl"
           (Prelude.Maybe RpbBucketProps'RpbReplMode)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'repl
                 (\ x__ y__ -> x__{_RpbBucketProps'repl = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "searchIndex"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'searchIndex
                 (\ x__ y__ -> x__{_RpbBucketProps'searchIndex = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'searchIndex"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'searchIndex
                 (\ x__ y__ -> x__{_RpbBucketProps'searchIndex = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "datatype"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'datatype
                 (\ x__ y__ -> x__{_RpbBucketProps'datatype = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'datatype"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'datatype
                 (\ x__ y__ -> x__{_RpbBucketProps'datatype = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "consistent"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'consistent
                 (\ x__ y__ -> x__{_RpbBucketProps'consistent = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'consistent"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'consistent
                 (\ x__ y__ -> x__{_RpbBucketProps'consistent = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "writeOnce"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'writeOnce
                 (\ x__ y__ -> x__{_RpbBucketProps'writeOnce = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'writeOnce"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'writeOnce
                 (\ x__ y__ -> x__{_RpbBucketProps'writeOnce = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "hllPrecision"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'hllPrecision
                 (\ x__ y__ -> x__{_RpbBucketProps'hllPrecision = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'hllPrecision"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'hllPrecision
                 (\ x__ y__ -> x__{_RpbBucketProps'hllPrecision = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketProps "ttl"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'ttl
                 (\ x__ y__ -> x__{_RpbBucketProps'ttl = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbBucketProps "maybe'ttl"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketProps'ttl
                 (\ x__ y__ -> x__{_RpbBucketProps'ttl = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbBucketProps where
        messageName _ = Data.Text.pack "RpbBucketProps"
        fieldsByTag
          = let nVal__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "n_val"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'nVal")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                allowMult__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "allow_mult"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'allowMult")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                lastWriteWins__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "last_write_wins"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'lastWriteWins")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                precommit__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "precommit"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbCommitHook)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "precommit")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                hasPrecommit__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "has_precommit"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'hasPrecommit")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                postcommit__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "postcommit"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbCommitHook)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "postcommit")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                hasPostcommit__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "has_postcommit"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'hasPostcommit")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                chashKeyfun__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "chash_keyfun"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbModFun)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'chashKeyfun")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                linkfun__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "linkfun"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbModFun)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'linkfun")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                oldVclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "old_vclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'oldVclock")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                youngVclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "young_vclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'youngVclock")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                bigVclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "big_vclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'bigVclock")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                smallVclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "small_vclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'smallVclock")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                pr__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pr"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pr")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                r__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "r"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'r")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                w__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "w"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'w")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                pw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pw")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                dw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "dw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'dw")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                rw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "rw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rw")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                basicQuorum__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "basic_quorum"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'basicQuorum")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                notfoundOk__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "notfound_ok"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'notfoundOk")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                backend__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "backend"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'backend")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                search__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "search"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'search")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                repl__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "repl"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor RpbBucketProps'RpbReplMode)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'repl")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                searchIndex__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "search_index"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'searchIndex")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                datatype__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "datatype"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'datatype")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                consistent__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "consistent"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'consistent")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                writeOnce__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "write_once"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'writeOnce")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                hllPrecision__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "hll_precision"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'hllPrecision")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
                ttl__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "ttl"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'ttl")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketProps
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, nVal__field_descriptor),
                 (Data.ProtoLens.Tag 2, allowMult__field_descriptor),
                 (Data.ProtoLens.Tag 3, lastWriteWins__field_descriptor),
                 (Data.ProtoLens.Tag 4, precommit__field_descriptor),
                 (Data.ProtoLens.Tag 5, hasPrecommit__field_descriptor),
                 (Data.ProtoLens.Tag 6, postcommit__field_descriptor),
                 (Data.ProtoLens.Tag 7, hasPostcommit__field_descriptor),
                 (Data.ProtoLens.Tag 8, chashKeyfun__field_descriptor),
                 (Data.ProtoLens.Tag 9, linkfun__field_descriptor),
                 (Data.ProtoLens.Tag 10, oldVclock__field_descriptor),
                 (Data.ProtoLens.Tag 11, youngVclock__field_descriptor),
                 (Data.ProtoLens.Tag 12, bigVclock__field_descriptor),
                 (Data.ProtoLens.Tag 13, smallVclock__field_descriptor),
                 (Data.ProtoLens.Tag 14, pr__field_descriptor),
                 (Data.ProtoLens.Tag 15, r__field_descriptor),
                 (Data.ProtoLens.Tag 16, w__field_descriptor),
                 (Data.ProtoLens.Tag 17, pw__field_descriptor),
                 (Data.ProtoLens.Tag 18, dw__field_descriptor),
                 (Data.ProtoLens.Tag 19, rw__field_descriptor),
                 (Data.ProtoLens.Tag 20, basicQuorum__field_descriptor),
                 (Data.ProtoLens.Tag 21, notfoundOk__field_descriptor),
                 (Data.ProtoLens.Tag 22, backend__field_descriptor),
                 (Data.ProtoLens.Tag 23, search__field_descriptor),
                 (Data.ProtoLens.Tag 24, repl__field_descriptor),
                 (Data.ProtoLens.Tag 25, searchIndex__field_descriptor),
                 (Data.ProtoLens.Tag 26, datatype__field_descriptor),
                 (Data.ProtoLens.Tag 27, consistent__field_descriptor),
                 (Data.ProtoLens.Tag 28, writeOnce__field_descriptor),
                 (Data.ProtoLens.Tag 29, hllPrecision__field_descriptor),
                 (Data.ProtoLens.Tag 30, ttl__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbBucketProps'_unknownFields
              (\ x__ y__ -> x__{_RpbBucketProps'_unknownFields = y__})
        defMessage
          = RpbBucketProps{_RpbBucketProps'nVal = Prelude.Nothing,
                           _RpbBucketProps'allowMult = Prelude.Nothing,
                           _RpbBucketProps'lastWriteWins = Prelude.Nothing,
                           _RpbBucketProps'precommit = [],
                           _RpbBucketProps'hasPrecommit = Prelude.Nothing,
                           _RpbBucketProps'postcommit = [],
                           _RpbBucketProps'hasPostcommit = Prelude.Nothing,
                           _RpbBucketProps'chashKeyfun = Prelude.Nothing,
                           _RpbBucketProps'linkfun = Prelude.Nothing,
                           _RpbBucketProps'oldVclock = Prelude.Nothing,
                           _RpbBucketProps'youngVclock = Prelude.Nothing,
                           _RpbBucketProps'bigVclock = Prelude.Nothing,
                           _RpbBucketProps'smallVclock = Prelude.Nothing,
                           _RpbBucketProps'pr = Prelude.Nothing,
                           _RpbBucketProps'r = Prelude.Nothing,
                           _RpbBucketProps'w = Prelude.Nothing,
                           _RpbBucketProps'pw = Prelude.Nothing,
                           _RpbBucketProps'dw = Prelude.Nothing,
                           _RpbBucketProps'rw = Prelude.Nothing,
                           _RpbBucketProps'basicQuorum = Prelude.Nothing,
                           _RpbBucketProps'notfoundOk = Prelude.Nothing,
                           _RpbBucketProps'backend = Prelude.Nothing,
                           _RpbBucketProps'search = Prelude.Nothing,
                           _RpbBucketProps'repl = Prelude.Nothing,
                           _RpbBucketProps'searchIndex = Prelude.Nothing,
                           _RpbBucketProps'datatype = Prelude.Nothing,
                           _RpbBucketProps'consistent = Prelude.Nothing,
                           _RpbBucketProps'writeOnce = Prelude.Nothing,
                           _RpbBucketProps'hllPrecision = Prelude.Nothing,
                           _RpbBucketProps'ttl = Prelude.Nothing,
                           _RpbBucketProps'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbBucketProps where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbBucketProps'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbBucketProps'nVal x__)
                   (Control.DeepSeq.deepseq (_RpbBucketProps'allowMult x__)
                      (Control.DeepSeq.deepseq (_RpbBucketProps'lastWriteWins x__)
                         (Control.DeepSeq.deepseq (_RpbBucketProps'precommit x__)
                            (Control.DeepSeq.deepseq (_RpbBucketProps'hasPrecommit x__)
                               (Control.DeepSeq.deepseq (_RpbBucketProps'postcommit x__)
                                  (Control.DeepSeq.deepseq (_RpbBucketProps'hasPostcommit x__)
                                     (Control.DeepSeq.deepseq (_RpbBucketProps'chashKeyfun x__)
                                        (Control.DeepSeq.deepseq (_RpbBucketProps'linkfun x__)
                                           (Control.DeepSeq.deepseq (_RpbBucketProps'oldVclock x__)
                                              (Control.DeepSeq.deepseq
                                                 (_RpbBucketProps'youngVclock x__)
                                                 (Control.DeepSeq.deepseq
                                                    (_RpbBucketProps'bigVclock x__)
                                                    (Control.DeepSeq.deepseq
                                                       (_RpbBucketProps'smallVclock x__)
                                                       (Control.DeepSeq.deepseq
                                                          (_RpbBucketProps'pr x__)
                                                          (Control.DeepSeq.deepseq
                                                             (_RpbBucketProps'r x__)
                                                             (Control.DeepSeq.deepseq
                                                                (_RpbBucketProps'w x__)
                                                                (Control.DeepSeq.deepseq
                                                                   (_RpbBucketProps'pw x__)
                                                                   (Control.DeepSeq.deepseq
                                                                      (_RpbBucketProps'dw x__)
                                                                      (Control.DeepSeq.deepseq
                                                                         (_RpbBucketProps'rw x__)
                                                                         (Control.DeepSeq.deepseq
                                                                            (_RpbBucketProps'basicQuorum
                                                                               x__)
                                                                            (Control.DeepSeq.deepseq
                                                                               (_RpbBucketProps'notfoundOk
                                                                                  x__)
                                                                               (Control.DeepSeq.deepseq
                                                                                  (_RpbBucketProps'backend
                                                                                     x__)
                                                                                  (Control.DeepSeq.deepseq
                                                                                     (_RpbBucketProps'search
                                                                                        x__)
                                                                                     (Control.DeepSeq.deepseq
                                                                                        (_RpbBucketProps'repl
                                                                                           x__)
                                                                                        (Control.DeepSeq.deepseq
                                                                                           (_RpbBucketProps'searchIndex
                                                                                              x__)
                                                                                           (Control.DeepSeq.deepseq
                                                                                              (_RpbBucketProps'datatype
                                                                                                 x__)
                                                                                              (Control.DeepSeq.deepseq
                                                                                                 (_RpbBucketProps'consistent
                                                                                                    x__)
                                                                                                 (Control.DeepSeq.deepseq
                                                                                                    (_RpbBucketProps'writeOnce
                                                                                                       x__)
                                                                                                    (Control.DeepSeq.deepseq
                                                                                                       (_RpbBucketProps'hllPrecision
                                                                                                          x__)
                                                                                                       (Control.DeepSeq.deepseq
                                                                                                          (_RpbBucketProps'ttl
                                                                                                             x__)
                                                                                                          (())))))))))))))))))))))))))))))))
data RpbBucketProps'RpbReplMode = RpbBucketProps'FALSE
                                | RpbBucketProps'REALTIME
                                | RpbBucketProps'FULLSYNC
                                | RpbBucketProps'TRUE
                                    deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.FieldDefault RpbBucketProps'RpbReplMode
         where
        fieldDefault = RpbBucketProps'FALSE
instance Data.ProtoLens.MessageEnum RpbBucketProps'RpbReplMode
         where
        maybeToEnum 0 = Prelude.Just RpbBucketProps'FALSE
        maybeToEnum 1 = Prelude.Just RpbBucketProps'REALTIME
        maybeToEnum 2 = Prelude.Just RpbBucketProps'FULLSYNC
        maybeToEnum 3 = Prelude.Just RpbBucketProps'TRUE
        maybeToEnum _ = Prelude.Nothing
        showEnum RpbBucketProps'FALSE = "FALSE"
        showEnum RpbBucketProps'REALTIME = "REALTIME"
        showEnum RpbBucketProps'FULLSYNC = "FULLSYNC"
        showEnum RpbBucketProps'TRUE = "TRUE"
        readEnum "FALSE" = Prelude.Just RpbBucketProps'FALSE
        readEnum "REALTIME" = Prelude.Just RpbBucketProps'REALTIME
        readEnum "FULLSYNC" = Prelude.Just RpbBucketProps'FULLSYNC
        readEnum "TRUE" = Prelude.Just RpbBucketProps'TRUE
        readEnum _ = Prelude.Nothing
instance Prelude.Enum RpbBucketProps'RpbReplMode where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum RpbReplMode: "
                    (Prelude.show k__)))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum RpbBucketProps'FALSE = 0
        fromEnum RpbBucketProps'REALTIME = 1
        fromEnum RpbBucketProps'FULLSYNC = 2
        fromEnum RpbBucketProps'TRUE = 3
        succ RpbBucketProps'TRUE
          = Prelude.error
              "RpbBucketProps'RpbReplMode.succ: bad argument RpbBucketProps'TRUE. This value would be out of bounds."
        succ RpbBucketProps'FALSE = RpbBucketProps'REALTIME
        succ RpbBucketProps'REALTIME = RpbBucketProps'FULLSYNC
        succ RpbBucketProps'FULLSYNC = RpbBucketProps'TRUE
        pred RpbBucketProps'FALSE
          = Prelude.error
              "RpbBucketProps'RpbReplMode.pred: bad argument RpbBucketProps'FALSE. This value would be out of bounds."
        pred RpbBucketProps'REALTIME = RpbBucketProps'FALSE
        pred RpbBucketProps'FULLSYNC = RpbBucketProps'REALTIME
        pred RpbBucketProps'TRUE = RpbBucketProps'FULLSYNC
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Prelude.Bounded RpbBucketProps'RpbReplMode where
        minBound = RpbBucketProps'FALSE
        maxBound = RpbBucketProps'TRUE
instance Control.DeepSeq.NFData RpbBucketProps'RpbReplMode where
        rnf x__ = Prelude.seq x__ (())
{- | Fields :

    * 'Proto.Proto.Riak_Fields.modfun' @:: Lens' RpbCommitHook RpbModFun@
    * 'Proto.Proto.Riak_Fields.maybe'modfun' @:: Lens' RpbCommitHook (Prelude.Maybe RpbModFun)@
    * 'Proto.Proto.Riak_Fields.name' @:: Lens' RpbCommitHook Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'name' @:: Lens' RpbCommitHook (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbCommitHook = RpbCommitHook{_RpbCommitHook'modfun ::
                                   !(Prelude.Maybe RpbModFun),
                                   _RpbCommitHook'name ::
                                   !(Prelude.Maybe Data.ByteString.ByteString),
                                   _RpbCommitHook'_unknownFields :: !Data.ProtoLens.FieldSet}
                       deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCommitHook where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCommitHook "modfun" (RpbModFun)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCommitHook'modfun
                 (\ x__ y__ -> x__{_RpbCommitHook'modfun = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' RpbCommitHook "maybe'modfun"
           (Prelude.Maybe RpbModFun)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCommitHook'modfun
                 (\ x__ y__ -> x__{_RpbCommitHook'modfun = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCommitHook "name"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCommitHook'name
                 (\ x__ y__ -> x__{_RpbCommitHook'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCommitHook "maybe'name"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCommitHook'name
                 (\ x__ y__ -> x__{_RpbCommitHook'name = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCommitHook where
        messageName _ = Data.Text.pack "RpbCommitHook"
        fieldsByTag
          = let modfun__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "modfun"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbModFun)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'modfun")))
                      :: Data.ProtoLens.FieldDescriptor RpbCommitHook
                name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")))
                      :: Data.ProtoLens.FieldDescriptor RpbCommitHook
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, modfun__field_descriptor),
                 (Data.ProtoLens.Tag 2, name__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCommitHook'_unknownFields
              (\ x__ y__ -> x__{_RpbCommitHook'_unknownFields = y__})
        defMessage
          = RpbCommitHook{_RpbCommitHook'modfun = Prelude.Nothing,
                          _RpbCommitHook'name = Prelude.Nothing,
                          _RpbCommitHook'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCommitHook where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCommitHook'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCommitHook'modfun x__)
                   (Control.DeepSeq.deepseq (_RpbCommitHook'name x__) (())))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.errmsg' @:: Lens' RpbErrorResp Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.errcode' @:: Lens' RpbErrorResp Data.Word.Word32@
 -}
data RpbErrorResp = RpbErrorResp{_RpbErrorResp'errmsg ::
                                 !Data.ByteString.ByteString,
                                 _RpbErrorResp'errcode :: !Data.Word.Word32,
                                 _RpbErrorResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                      deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbErrorResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbErrorResp "errmsg"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbErrorResp'errmsg
                 (\ x__ y__ -> x__{_RpbErrorResp'errmsg = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbErrorResp "errcode"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbErrorResp'errcode
                 (\ x__ y__ -> x__{_RpbErrorResp'errcode = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbErrorResp where
        messageName _ = Data.Text.pack "RpbErrorResp"
        fieldsByTag
          = let errmsg__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "errmsg"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "errmsg")))
                      :: Data.ProtoLens.FieldDescriptor RpbErrorResp
                errcode__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "errcode"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "errcode")))
                      :: Data.ProtoLens.FieldDescriptor RpbErrorResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, errmsg__field_descriptor),
                 (Data.ProtoLens.Tag 2, errcode__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbErrorResp'_unknownFields
              (\ x__ y__ -> x__{_RpbErrorResp'_unknownFields = y__})
        defMessage
          = RpbErrorResp{_RpbErrorResp'errmsg = Data.ProtoLens.fieldDefault,
                         _RpbErrorResp'errcode = Data.ProtoLens.fieldDefault,
                         _RpbErrorResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbErrorResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbErrorResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbErrorResp'errmsg x__)
                   (Control.DeepSeq.deepseq (_RpbErrorResp'errcode x__) (())))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.bucket' @:: Lens' RpbGetBucketReq Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.type'' @:: Lens' RpbGetBucketReq Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'type'' @:: Lens' RpbGetBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbGetBucketReq = RpbGetBucketReq{_RpbGetBucketReq'bucket ::
                                       !Data.ByteString.ByteString,
                                       _RpbGetBucketReq'type' ::
                                       !(Prelude.Maybe Data.ByteString.ByteString),
                                       _RpbGetBucketReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                         deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetBucketReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbGetBucketReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketReq'bucket
                 (\ x__ y__ -> x__{_RpbGetBucketReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetBucketReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketReq'type'
                 (\ x__ y__ -> x__{_RpbGetBucketReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetBucketReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketReq'type'
                 (\ x__ y__ -> x__{_RpbGetBucketReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbGetBucketReq where
        messageName _ = Data.Text.pack "RpbGetBucketReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetBucketReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetBucketReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbGetBucketReq'_unknownFields
              (\ x__ y__ -> x__{_RpbGetBucketReq'_unknownFields = y__})
        defMessage
          = RpbGetBucketReq{_RpbGetBucketReq'bucket =
                              Data.ProtoLens.fieldDefault,
                            _RpbGetBucketReq'type' = Prelude.Nothing,
                            _RpbGetBucketReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetBucketReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbGetBucketReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbGetBucketReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbGetBucketReq'type' x__) (())))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.props' @:: Lens' RpbGetBucketResp RpbBucketProps@
 -}
data RpbGetBucketResp = RpbGetBucketResp{_RpbGetBucketResp'props ::
                                         !RpbBucketProps,
                                         _RpbGetBucketResp'_unknownFields ::
                                         !Data.ProtoLens.FieldSet}
                          deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetBucketResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbGetBucketResp "props"
           (RpbBucketProps)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketResp'props
                 (\ x__ y__ -> x__{_RpbGetBucketResp'props = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbGetBucketResp where
        messageName _ = Data.Text.pack "RpbGetBucketResp"
        fieldsByTag
          = let props__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "props"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbBucketProps)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "props")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetBucketResp
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, props__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbGetBucketResp'_unknownFields
              (\ x__ y__ -> x__{_RpbGetBucketResp'_unknownFields = y__})
        defMessage
          = RpbGetBucketResp{_RpbGetBucketResp'props =
                               Data.ProtoLens.defMessage,
                             _RpbGetBucketResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetBucketResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbGetBucketResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbGetBucketResp'props x__) (()))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.type'' @:: Lens' RpbGetBucketTypeReq Data.ByteString.ByteString@
 -}
data RpbGetBucketTypeReq = RpbGetBucketTypeReq{_RpbGetBucketTypeReq'type'
                                               :: !Data.ByteString.ByteString,
                                               _RpbGetBucketTypeReq'_unknownFields ::
                                               !Data.ProtoLens.FieldSet}
                             deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetBucketTypeReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbGetBucketTypeReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketTypeReq'type'
                 (\ x__ y__ -> x__{_RpbGetBucketTypeReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbGetBucketTypeReq where
        messageName _ = Data.Text.pack "RpbGetBucketTypeReq"
        fieldsByTag
          = let type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetBucketTypeReq
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbGetBucketTypeReq'_unknownFields
              (\ x__ y__ -> x__{_RpbGetBucketTypeReq'_unknownFields = y__})
        defMessage
          = RpbGetBucketTypeReq{_RpbGetBucketTypeReq'type' =
                                  Data.ProtoLens.fieldDefault,
                                _RpbGetBucketTypeReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetBucketTypeReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbGetBucketTypeReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbGetBucketTypeReq'type' x__) (()))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.node' @:: Lens' RpbGetServerInfoResp Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'node' @:: Lens' RpbGetServerInfoResp
  (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Proto.Riak_Fields.serverVersion' @:: Lens' RpbGetServerInfoResp Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'serverVersion' @:: Lens' RpbGetServerInfoResp
  (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbGetServerInfoResp = RpbGetServerInfoResp{_RpbGetServerInfoResp'node
                                                 :: !(Prelude.Maybe Data.ByteString.ByteString),
                                                 _RpbGetServerInfoResp'serverVersion ::
                                                 !(Prelude.Maybe Data.ByteString.ByteString),
                                                 _RpbGetServerInfoResp'_unknownFields ::
                                                 !Data.ProtoLens.FieldSet}
                              deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetServerInfoResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbGetServerInfoResp "node"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetServerInfoResp'node
                 (\ x__ y__ -> x__{_RpbGetServerInfoResp'node = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetServerInfoResp "maybe'node"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetServerInfoResp'node
                 (\ x__ y__ -> x__{_RpbGetServerInfoResp'node = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetServerInfoResp "serverVersion"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetServerInfoResp'serverVersion
                 (\ x__ y__ -> x__{_RpbGetServerInfoResp'serverVersion = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetServerInfoResp
           "maybe'serverVersion"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetServerInfoResp'serverVersion
                 (\ x__ y__ -> x__{_RpbGetServerInfoResp'serverVersion = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbGetServerInfoResp where
        messageName _ = Data.Text.pack "RpbGetServerInfoResp"
        fieldsByTag
          = let node__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "node"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'node")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetServerInfoResp
                serverVersion__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "server_version"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'serverVersion")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetServerInfoResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, node__field_descriptor),
                 (Data.ProtoLens.Tag 2, serverVersion__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbGetServerInfoResp'_unknownFields
              (\ x__ y__ -> x__{_RpbGetServerInfoResp'_unknownFields = y__})
        defMessage
          = RpbGetServerInfoResp{_RpbGetServerInfoResp'node =
                                   Prelude.Nothing,
                                 _RpbGetServerInfoResp'serverVersion = Prelude.Nothing,
                                 _RpbGetServerInfoResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetServerInfoResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbGetServerInfoResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbGetServerInfoResp'node x__)
                   (Control.DeepSeq.deepseq (_RpbGetServerInfoResp'serverVersion x__)
                      (())))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.module'' @:: Lens' RpbModFun Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.function' @:: Lens' RpbModFun Data.ByteString.ByteString@
 -}
data RpbModFun = RpbModFun{_RpbModFun'module' ::
                           !Data.ByteString.ByteString,
                           _RpbModFun'function :: !Data.ByteString.ByteString,
                           _RpbModFun'_unknownFields :: !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbModFun where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbModFun "module'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbModFun'module'
                 (\ x__ y__ -> x__{_RpbModFun'module' = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbModFun "function"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbModFun'function
                 (\ x__ y__ -> x__{_RpbModFun'function = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbModFun where
        messageName _ = Data.Text.pack "RpbModFun"
        fieldsByTag
          = let module'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "module"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "module'")))
                      :: Data.ProtoLens.FieldDescriptor RpbModFun
                function__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "function"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "function")))
                      :: Data.ProtoLens.FieldDescriptor RpbModFun
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, module'__field_descriptor),
                 (Data.ProtoLens.Tag 2, function__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbModFun'_unknownFields
              (\ x__ y__ -> x__{_RpbModFun'_unknownFields = y__})
        defMessage
          = RpbModFun{_RpbModFun'module' = Data.ProtoLens.fieldDefault,
                      _RpbModFun'function = Data.ProtoLens.fieldDefault,
                      _RpbModFun'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbModFun where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbModFun'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbModFun'module' x__)
                   (Control.DeepSeq.deepseq (_RpbModFun'function x__) (())))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.key' @:: Lens' RpbPair Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.value' @:: Lens' RpbPair Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'value' @:: Lens' RpbPair (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbPair = RpbPair{_RpbPair'key :: !Data.ByteString.ByteString,
                       _RpbPair'value :: !(Prelude.Maybe Data.ByteString.ByteString),
                       _RpbPair'_unknownFields :: !Data.ProtoLens.FieldSet}
                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbPair where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbPair "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPair'key
                 (\ x__ y__ -> x__{_RpbPair'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPair "value"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPair'value
                 (\ x__ y__ -> x__{_RpbPair'value = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPair "maybe'value"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPair'value
                 (\ x__ y__ -> x__{_RpbPair'value = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbPair where
        messageName _ = Data.Text.pack "RpbPair"
        fieldsByTag
          = let key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor RpbPair
                value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'value")))
                      :: Data.ProtoLens.FieldDescriptor RpbPair
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, key__field_descriptor),
                 (Data.ProtoLens.Tag 2, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbPair'_unknownFields
              (\ x__ y__ -> x__{_RpbPair'_unknownFields = y__})
        defMessage
          = RpbPair{_RpbPair'key = Data.ProtoLens.fieldDefault,
                    _RpbPair'value = Prelude.Nothing, _RpbPair'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbPair where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbPair'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbPair'key x__)
                   (Control.DeepSeq.deepseq (_RpbPair'value x__) (())))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.bucket' @:: Lens' RpbResetBucketReq Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.type'' @:: Lens' RpbResetBucketReq Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'type'' @:: Lens' RpbResetBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbResetBucketReq = RpbResetBucketReq{_RpbResetBucketReq'bucket
                                           :: !Data.ByteString.ByteString,
                                           _RpbResetBucketReq'type' ::
                                           !(Prelude.Maybe Data.ByteString.ByteString),
                                           _RpbResetBucketReq'_unknownFields ::
                                           !Data.ProtoLens.FieldSet}
                           deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbResetBucketReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbResetBucketReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbResetBucketReq'bucket
                 (\ x__ y__ -> x__{_RpbResetBucketReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbResetBucketReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbResetBucketReq'type'
                 (\ x__ y__ -> x__{_RpbResetBucketReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbResetBucketReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbResetBucketReq'type'
                 (\ x__ y__ -> x__{_RpbResetBucketReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbResetBucketReq where
        messageName _ = Data.Text.pack "RpbResetBucketReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbResetBucketReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbResetBucketReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbResetBucketReq'_unknownFields
              (\ x__ y__ -> x__{_RpbResetBucketReq'_unknownFields = y__})
        defMessage
          = RpbResetBucketReq{_RpbResetBucketReq'bucket =
                                Data.ProtoLens.fieldDefault,
                              _RpbResetBucketReq'type' = Prelude.Nothing,
                              _RpbResetBucketReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbResetBucketReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbResetBucketReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbResetBucketReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbResetBucketReq'type' x__) (())))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.bucket' @:: Lens' RpbSetBucketReq Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.props' @:: Lens' RpbSetBucketReq RpbBucketProps@
    * 'Proto.Proto.Riak_Fields.type'' @:: Lens' RpbSetBucketReq Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.maybe'type'' @:: Lens' RpbSetBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbSetBucketReq = RpbSetBucketReq{_RpbSetBucketReq'bucket ::
                                       !Data.ByteString.ByteString,
                                       _RpbSetBucketReq'props :: !RpbBucketProps,
                                       _RpbSetBucketReq'type' ::
                                       !(Prelude.Maybe Data.ByteString.ByteString),
                                       _RpbSetBucketReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                         deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbSetBucketReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbSetBucketReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSetBucketReq'bucket
                 (\ x__ y__ -> x__{_RpbSetBucketReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSetBucketReq "props"
           (RpbBucketProps)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSetBucketReq'props
                 (\ x__ y__ -> x__{_RpbSetBucketReq'props = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSetBucketReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSetBucketReq'type'
                 (\ x__ y__ -> x__{_RpbSetBucketReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSetBucketReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSetBucketReq'type'
                 (\ x__ y__ -> x__{_RpbSetBucketReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbSetBucketReq where
        messageName _ = Data.Text.pack "RpbSetBucketReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbSetBucketReq
                props__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "props"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbBucketProps)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "props")))
                      :: Data.ProtoLens.FieldDescriptor RpbSetBucketReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbSetBucketReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, props__field_descriptor),
                 (Data.ProtoLens.Tag 3, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbSetBucketReq'_unknownFields
              (\ x__ y__ -> x__{_RpbSetBucketReq'_unknownFields = y__})
        defMessage
          = RpbSetBucketReq{_RpbSetBucketReq'bucket =
                              Data.ProtoLens.fieldDefault,
                            _RpbSetBucketReq'props = Data.ProtoLens.defMessage,
                            _RpbSetBucketReq'type' = Prelude.Nothing,
                            _RpbSetBucketReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbSetBucketReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbSetBucketReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbSetBucketReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbSetBucketReq'props x__)
                      (Control.DeepSeq.deepseq (_RpbSetBucketReq'type' x__) (()))))
{- | Fields :

    * 'Proto.Proto.Riak_Fields.type'' @:: Lens' RpbSetBucketTypeReq Data.ByteString.ByteString@
    * 'Proto.Proto.Riak_Fields.props' @:: Lens' RpbSetBucketTypeReq RpbBucketProps@
 -}
data RpbSetBucketTypeReq = RpbSetBucketTypeReq{_RpbSetBucketTypeReq'type'
                                               :: !Data.ByteString.ByteString,
                                               _RpbSetBucketTypeReq'props :: !RpbBucketProps,
                                               _RpbSetBucketTypeReq'_unknownFields ::
                                               !Data.ProtoLens.FieldSet}
                             deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbSetBucketTypeReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbSetBucketTypeReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSetBucketTypeReq'type'
                 (\ x__ y__ -> x__{_RpbSetBucketTypeReq'type' = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSetBucketTypeReq "props"
           (RpbBucketProps)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSetBucketTypeReq'props
                 (\ x__ y__ -> x__{_RpbSetBucketTypeReq'props = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbSetBucketTypeReq where
        messageName _ = Data.Text.pack "RpbSetBucketTypeReq"
        fieldsByTag
          = let type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbSetBucketTypeReq
                props__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "props"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbBucketProps)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "props")))
                      :: Data.ProtoLens.FieldDescriptor RpbSetBucketTypeReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, type'__field_descriptor),
                 (Data.ProtoLens.Tag 2, props__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbSetBucketTypeReq'_unknownFields
              (\ x__ y__ -> x__{_RpbSetBucketTypeReq'_unknownFields = y__})
        defMessage
          = RpbSetBucketTypeReq{_RpbSetBucketTypeReq'type' =
                                  Data.ProtoLens.fieldDefault,
                                _RpbSetBucketTypeReq'props = Data.ProtoLens.defMessage,
                                _RpbSetBucketTypeReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbSetBucketTypeReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbSetBucketTypeReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbSetBucketTypeReq'type' x__)
                   (Control.DeepSeq.deepseq (_RpbSetBucketTypeReq'props x__) (())))