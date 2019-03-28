{- This file was auto-generated from riak.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.Riak
       (CounterOp(), DtFetchReq(), DtFetchResp(),
        DtFetchResp'DataType(..), DtFetchResp'DataType(), DtOp(),
        DtUpdateReq(), DtUpdateResp(), DtValue(), GSetOp(), HllOp(),
        MapEntry(), MapField(), MapField'MapFieldType(..),
        MapField'MapFieldType(), MapOp(), MapUpdate(),
        MapUpdate'FlagOp(..), MapUpdate'FlagOp(), RpbAuthReq(),
        RpbAuthResp(), RpbBucketKeyPreflistItem(), RpbBucketProps(),
        RpbBucketProps'RpbReplMode(..), RpbBucketProps'RpbReplMode(),
        RpbCSBucketReq(), RpbCSBucketResp(), RpbCommitHook(), RpbContent(),
        RpbCounterGetReq(), RpbCounterGetResp(), RpbCounterUpdateReq(),
        RpbCounterUpdateResp(), RpbCoverageEntry(), RpbCoverageReq(),
        RpbCoverageResp(), RpbDelReq(), RpbDelResp(), RpbErrorResp(),
        RpbGetBucketKeyPreflistReq(), RpbGetBucketKeyPreflistResp(),
        RpbGetBucketReq(), RpbGetBucketResp(), RpbGetBucketTypeReq(),
        RpbGetClientIdReq(), RpbGetClientIdResp(), RpbGetReq(),
        RpbGetResp(), RpbGetServerInfoReq(), RpbGetServerInfoResp(),
        RpbIndexBodyResp(), RpbIndexObject(), RpbIndexReq(),
        RpbIndexReq'IndexQueryType(..), RpbIndexReq'IndexQueryType(),
        RpbIndexResp(), RpbLink(), RpbListBucketsReq(),
        RpbListBucketsResp(), RpbListKeysReq(), RpbListKeysResp(),
        RpbMapRedReq(), RpbMapRedResp(), RpbModFun(), RpbPair(),
        RpbPingReq(), RpbPingResp(), RpbPutReq(), RpbPutResp(),
        RpbResetBucketReq(), RpbResetBucketResp(), RpbSearchDoc(),
        RpbSearchQueryReq(), RpbSearchQueryResp(), RpbSetBucketReq(),
        RpbSetBucketResp(), RpbSetBucketTypeReq(), RpbSetClientIdReq(),
        RpbYokozunaIndex(), RpbYokozunaIndexDeleteReq(),
        RpbYokozunaIndexGetReq(), RpbYokozunaIndexGetResp(),
        RpbYokozunaIndexPutReq(), RpbYokozunaSchema(),
        RpbYokozunaSchemaGetReq(), RpbYokozunaSchemaGetResp(),
        RpbYokozunaSchemaPutReq(), SetOp(), TsCell(),
        TsColumnDescription(), TsColumnType(..), TsColumnType(),
        TsCoverageEntry(), TsCoverageReq(), TsCoverageResp(), TsDelReq(),
        TsDelResp(), TsGetReq(), TsGetResp(), TsInterpolation(),
        TsListKeysReq(), TsListKeysResp(), TsPutReq(), TsPutResp(),
        TsQueryReq(), TsQueryResp(), TsRange(), TsRow())
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

    * 'Proto.Riak_Fields.increment' @:: Lens' CounterOp Data.Int.Int64@
    * 'Proto.Riak_Fields.maybe'increment' @:: Lens' CounterOp (Prelude.Maybe Data.Int.Int64)@
 -}
data CounterOp = CounterOp{_CounterOp'increment ::
                           !(Prelude.Maybe Data.Int.Int64),
                           _CounterOp'_unknownFields :: !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CounterOp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' CounterOp "increment"
           (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CounterOp'increment
                 (\ x__ y__ -> x__{_CounterOp'increment = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' CounterOp "maybe'increment"
           (Prelude.Maybe Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CounterOp'increment
                 (\ x__ y__ -> x__{_CounterOp'increment = y__}))
              Prelude.id
instance Data.ProtoLens.Message CounterOp where
        messageName _ = Data.Text.pack "CounterOp"
        fieldsByTag
          = let increment__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "increment"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'increment")))
                      :: Data.ProtoLens.FieldDescriptor CounterOp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, increment__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _CounterOp'_unknownFields
              (\ x__ y__ -> x__{_CounterOp'_unknownFields = y__})
        defMessage
          = CounterOp{_CounterOp'increment = Prelude.Nothing,
                      _CounterOp'_unknownFields = ([])}
instance Control.DeepSeq.NFData CounterOp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_CounterOp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_CounterOp'increment x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' DtFetchReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' DtFetchReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.type'' @:: Lens' DtFetchReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.r' @:: Lens' DtFetchReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'r' @:: Lens' DtFetchReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.pr' @:: Lens' DtFetchReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pr' @:: Lens' DtFetchReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.basicQuorum' @:: Lens' DtFetchReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'basicQuorum' @:: Lens' DtFetchReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.notfoundOk' @:: Lens' DtFetchReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'notfoundOk' @:: Lens' DtFetchReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.timeout' @:: Lens' DtFetchReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' DtFetchReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.sloppyQuorum' @:: Lens' DtFetchReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'sloppyQuorum' @:: Lens' DtFetchReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.nVal' @:: Lens' DtFetchReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'nVal' @:: Lens' DtFetchReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.includeContext' @:: Lens' DtFetchReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'includeContext' @:: Lens' DtFetchReq (Prelude.Maybe Prelude.Bool)@
 -}
data DtFetchReq = DtFetchReq{_DtFetchReq'bucket ::
                             !Data.ByteString.ByteString,
                             _DtFetchReq'key :: !Data.ByteString.ByteString,
                             _DtFetchReq'type' :: !Data.ByteString.ByteString,
                             _DtFetchReq'r :: !(Prelude.Maybe Data.Word.Word32),
                             _DtFetchReq'pr :: !(Prelude.Maybe Data.Word.Word32),
                             _DtFetchReq'basicQuorum :: !(Prelude.Maybe Prelude.Bool),
                             _DtFetchReq'notfoundOk :: !(Prelude.Maybe Prelude.Bool),
                             _DtFetchReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                             _DtFetchReq'sloppyQuorum :: !(Prelude.Maybe Prelude.Bool),
                             _DtFetchReq'nVal :: !(Prelude.Maybe Data.Word.Word32),
                             _DtFetchReq'includeContext :: !(Prelude.Maybe Prelude.Bool),
                             _DtFetchReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DtFetchReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' DtFetchReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'bucket
                 (\ x__ y__ -> x__{_DtFetchReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'key
                 (\ x__ y__ -> x__{_DtFetchReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'type'
                 (\ x__ y__ -> x__{_DtFetchReq'type' = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "r" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'r
                 (\ x__ y__ -> x__{_DtFetchReq'r = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtFetchReq "maybe'r"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'r
                 (\ x__ y__ -> x__{_DtFetchReq'r = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "pr" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'pr
                 (\ x__ y__ -> x__{_DtFetchReq'pr = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtFetchReq "maybe'pr"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'pr
                 (\ x__ y__ -> x__{_DtFetchReq'pr = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "basicQuorum"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'basicQuorum
                 (\ x__ y__ -> x__{_DtFetchReq'basicQuorum = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtFetchReq "maybe'basicQuorum"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'basicQuorum
                 (\ x__ y__ -> x__{_DtFetchReq'basicQuorum = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "notfoundOk"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'notfoundOk
                 (\ x__ y__ -> x__{_DtFetchReq'notfoundOk = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtFetchReq "maybe'notfoundOk"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'notfoundOk
                 (\ x__ y__ -> x__{_DtFetchReq'notfoundOk = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'timeout
                 (\ x__ y__ -> x__{_DtFetchReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtFetchReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'timeout
                 (\ x__ y__ -> x__{_DtFetchReq'timeout = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "sloppyQuorum"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'sloppyQuorum
                 (\ x__ y__ -> x__{_DtFetchReq'sloppyQuorum = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtFetchReq "maybe'sloppyQuorum"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'sloppyQuorum
                 (\ x__ y__ -> x__{_DtFetchReq'sloppyQuorum = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "nVal" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'nVal
                 (\ x__ y__ -> x__{_DtFetchReq'nVal = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtFetchReq "maybe'nVal"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'nVal
                 (\ x__ y__ -> x__{_DtFetchReq'nVal = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchReq "includeContext"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'includeContext
                 (\ x__ y__ -> x__{_DtFetchReq'includeContext = y__}))
              (Data.ProtoLens.maybeLens Prelude.True)
instance Lens.Labels.HasLens' DtFetchReq "maybe'includeContext"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchReq'includeContext
                 (\ x__ y__ -> x__{_DtFetchReq'includeContext = y__}))
              Prelude.id
instance Data.ProtoLens.Message DtFetchReq where
        messageName _ = Data.Text.pack "DtFetchReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                r__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "r"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'r")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                pr__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pr"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pr")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                basicQuorum__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "basic_quorum"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'basicQuorum")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                notfoundOk__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "notfound_ok"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'notfoundOk")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                sloppyQuorum__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "sloppy_quorum"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'sloppyQuorum")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                nVal__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "n_val"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'nVal")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
                includeContext__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "include_context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'includeContext")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, type'__field_descriptor),
                 (Data.ProtoLens.Tag 4, r__field_descriptor),
                 (Data.ProtoLens.Tag 5, pr__field_descriptor),
                 (Data.ProtoLens.Tag 6, basicQuorum__field_descriptor),
                 (Data.ProtoLens.Tag 7, notfoundOk__field_descriptor),
                 (Data.ProtoLens.Tag 8, timeout__field_descriptor),
                 (Data.ProtoLens.Tag 9, sloppyQuorum__field_descriptor),
                 (Data.ProtoLens.Tag 10, nVal__field_descriptor),
                 (Data.ProtoLens.Tag 11, includeContext__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _DtFetchReq'_unknownFields
              (\ x__ y__ -> x__{_DtFetchReq'_unknownFields = y__})
        defMessage
          = DtFetchReq{_DtFetchReq'bucket = Data.ProtoLens.fieldDefault,
                       _DtFetchReq'key = Data.ProtoLens.fieldDefault,
                       _DtFetchReq'type' = Data.ProtoLens.fieldDefault,
                       _DtFetchReq'r = Prelude.Nothing, _DtFetchReq'pr = Prelude.Nothing,
                       _DtFetchReq'basicQuorum = Prelude.Nothing,
                       _DtFetchReq'notfoundOk = Prelude.Nothing,
                       _DtFetchReq'timeout = Prelude.Nothing,
                       _DtFetchReq'sloppyQuorum = Prelude.Nothing,
                       _DtFetchReq'nVal = Prelude.Nothing,
                       _DtFetchReq'includeContext = Prelude.Nothing,
                       _DtFetchReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData DtFetchReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_DtFetchReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_DtFetchReq'bucket x__)
                   (Control.DeepSeq.deepseq (_DtFetchReq'key x__)
                      (Control.DeepSeq.deepseq (_DtFetchReq'type' x__)
                         (Control.DeepSeq.deepseq (_DtFetchReq'r x__)
                            (Control.DeepSeq.deepseq (_DtFetchReq'pr x__)
                               (Control.DeepSeq.deepseq (_DtFetchReq'basicQuorum x__)
                                  (Control.DeepSeq.deepseq (_DtFetchReq'notfoundOk x__)
                                     (Control.DeepSeq.deepseq (_DtFetchReq'timeout x__)
                                        (Control.DeepSeq.deepseq (_DtFetchReq'sloppyQuorum x__)
                                           (Control.DeepSeq.deepseq (_DtFetchReq'nVal x__)
                                              (Control.DeepSeq.deepseq
                                                 (_DtFetchReq'includeContext x__)
                                                 (()))))))))))))
{- | Fields :

    * 'Proto.Riak_Fields.context' @:: Lens' DtFetchResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'context' @:: Lens' DtFetchResp (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.type'' @:: Lens' DtFetchResp DtFetchResp'DataType@
    * 'Proto.Riak_Fields.value' @:: Lens' DtFetchResp DtValue@
    * 'Proto.Riak_Fields.maybe'value' @:: Lens' DtFetchResp (Prelude.Maybe DtValue)@
 -}
data DtFetchResp = DtFetchResp{_DtFetchResp'context ::
                               !(Prelude.Maybe Data.ByteString.ByteString),
                               _DtFetchResp'type' :: !DtFetchResp'DataType,
                               _DtFetchResp'value :: !(Prelude.Maybe DtValue),
                               _DtFetchResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DtFetchResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' DtFetchResp "context"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchResp'context
                 (\ x__ y__ -> x__{_DtFetchResp'context = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtFetchResp "maybe'context"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchResp'context
                 (\ x__ y__ -> x__{_DtFetchResp'context = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchResp "type'"
           (DtFetchResp'DataType)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchResp'type'
                 (\ x__ y__ -> x__{_DtFetchResp'type' = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtFetchResp "value" (DtValue) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchResp'value
                 (\ x__ y__ -> x__{_DtFetchResp'value = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' DtFetchResp "maybe'value"
           (Prelude.Maybe DtValue)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtFetchResp'value
                 (\ x__ y__ -> x__{_DtFetchResp'value = y__}))
              Prelude.id
instance Data.ProtoLens.Message DtFetchResp where
        messageName _ = Data.Text.pack "DtFetchResp"
        fieldsByTag
          = let context__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'context")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchResp
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor DtFetchResp'DataType)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchResp
                value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor DtValue)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'value")))
                      :: Data.ProtoLens.FieldDescriptor DtFetchResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, context__field_descriptor),
                 (Data.ProtoLens.Tag 2, type'__field_descriptor),
                 (Data.ProtoLens.Tag 3, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _DtFetchResp'_unknownFields
              (\ x__ y__ -> x__{_DtFetchResp'_unknownFields = y__})
        defMessage
          = DtFetchResp{_DtFetchResp'context = Prelude.Nothing,
                        _DtFetchResp'type' = Data.ProtoLens.fieldDefault,
                        _DtFetchResp'value = Prelude.Nothing,
                        _DtFetchResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData DtFetchResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_DtFetchResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_DtFetchResp'context x__)
                   (Control.DeepSeq.deepseq (_DtFetchResp'type' x__)
                      (Control.DeepSeq.deepseq (_DtFetchResp'value x__) (()))))
data DtFetchResp'DataType = DtFetchResp'COUNTER
                          | DtFetchResp'SET
                          | DtFetchResp'MAP
                          | DtFetchResp'HLL
                          | DtFetchResp'GSET
                              deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.FieldDefault DtFetchResp'DataType where
        fieldDefault = DtFetchResp'COUNTER
instance Data.ProtoLens.MessageEnum DtFetchResp'DataType where
        maybeToEnum 1 = Prelude.Just DtFetchResp'COUNTER
        maybeToEnum 2 = Prelude.Just DtFetchResp'SET
        maybeToEnum 3 = Prelude.Just DtFetchResp'MAP
        maybeToEnum 4 = Prelude.Just DtFetchResp'HLL
        maybeToEnum 5 = Prelude.Just DtFetchResp'GSET
        maybeToEnum _ = Prelude.Nothing
        showEnum DtFetchResp'COUNTER = "COUNTER"
        showEnum DtFetchResp'SET = "SET"
        showEnum DtFetchResp'MAP = "MAP"
        showEnum DtFetchResp'HLL = "HLL"
        showEnum DtFetchResp'GSET = "GSET"
        readEnum "COUNTER" = Prelude.Just DtFetchResp'COUNTER
        readEnum "SET" = Prelude.Just DtFetchResp'SET
        readEnum "MAP" = Prelude.Just DtFetchResp'MAP
        readEnum "HLL" = Prelude.Just DtFetchResp'HLL
        readEnum "GSET" = Prelude.Just DtFetchResp'GSET
        readEnum _ = Prelude.Nothing
instance Prelude.Enum DtFetchResp'DataType where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum DataType: "
                    (Prelude.show k__)))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum DtFetchResp'COUNTER = 1
        fromEnum DtFetchResp'SET = 2
        fromEnum DtFetchResp'MAP = 3
        fromEnum DtFetchResp'HLL = 4
        fromEnum DtFetchResp'GSET = 5
        succ DtFetchResp'GSET
          = Prelude.error
              "DtFetchResp'DataType.succ: bad argument DtFetchResp'GSET. This value would be out of bounds."
        succ DtFetchResp'COUNTER = DtFetchResp'SET
        succ DtFetchResp'SET = DtFetchResp'MAP
        succ DtFetchResp'MAP = DtFetchResp'HLL
        succ DtFetchResp'HLL = DtFetchResp'GSET
        pred DtFetchResp'COUNTER
          = Prelude.error
              "DtFetchResp'DataType.pred: bad argument DtFetchResp'COUNTER. This value would be out of bounds."
        pred DtFetchResp'SET = DtFetchResp'COUNTER
        pred DtFetchResp'MAP = DtFetchResp'SET
        pred DtFetchResp'HLL = DtFetchResp'MAP
        pred DtFetchResp'GSET = DtFetchResp'HLL
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Prelude.Bounded DtFetchResp'DataType where
        minBound = DtFetchResp'COUNTER
        maxBound = DtFetchResp'GSET
instance Control.DeepSeq.NFData DtFetchResp'DataType where
        rnf x__ = Prelude.seq x__ (())
{- | Fields :

    * 'Proto.Riak_Fields.counterOp' @:: Lens' DtOp CounterOp@
    * 'Proto.Riak_Fields.maybe'counterOp' @:: Lens' DtOp (Prelude.Maybe CounterOp)@
    * 'Proto.Riak_Fields.setOp' @:: Lens' DtOp SetOp@
    * 'Proto.Riak_Fields.maybe'setOp' @:: Lens' DtOp (Prelude.Maybe SetOp)@
    * 'Proto.Riak_Fields.mapOp' @:: Lens' DtOp MapOp@
    * 'Proto.Riak_Fields.maybe'mapOp' @:: Lens' DtOp (Prelude.Maybe MapOp)@
    * 'Proto.Riak_Fields.hllOp' @:: Lens' DtOp HllOp@
    * 'Proto.Riak_Fields.maybe'hllOp' @:: Lens' DtOp (Prelude.Maybe HllOp)@
    * 'Proto.Riak_Fields.gsetOp' @:: Lens' DtOp GSetOp@
    * 'Proto.Riak_Fields.maybe'gsetOp' @:: Lens' DtOp (Prelude.Maybe GSetOp)@
 -}
data DtOp = DtOp{_DtOp'counterOp :: !(Prelude.Maybe CounterOp),
                 _DtOp'setOp :: !(Prelude.Maybe SetOp),
                 _DtOp'mapOp :: !(Prelude.Maybe MapOp),
                 _DtOp'hllOp :: !(Prelude.Maybe HllOp),
                 _DtOp'gsetOp :: !(Prelude.Maybe GSetOp),
                 _DtOp'_unknownFields :: !Data.ProtoLens.FieldSet}
              deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DtOp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' DtOp "counterOp" (CounterOp) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'counterOp
                 (\ x__ y__ -> x__{_DtOp'counterOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' DtOp "maybe'counterOp"
           (Prelude.Maybe CounterOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'counterOp
                 (\ x__ y__ -> x__{_DtOp'counterOp = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtOp "setOp" (SetOp) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'setOp
                 (\ x__ y__ -> x__{_DtOp'setOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' DtOp "maybe'setOp"
           (Prelude.Maybe SetOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'setOp
                 (\ x__ y__ -> x__{_DtOp'setOp = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtOp "mapOp" (MapOp) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'mapOp
                 (\ x__ y__ -> x__{_DtOp'mapOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' DtOp "maybe'mapOp"
           (Prelude.Maybe MapOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'mapOp
                 (\ x__ y__ -> x__{_DtOp'mapOp = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtOp "hllOp" (HllOp) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'hllOp
                 (\ x__ y__ -> x__{_DtOp'hllOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' DtOp "maybe'hllOp"
           (Prelude.Maybe HllOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'hllOp
                 (\ x__ y__ -> x__{_DtOp'hllOp = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtOp "gsetOp" (GSetOp) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'gsetOp
                 (\ x__ y__ -> x__{_DtOp'gsetOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' DtOp "maybe'gsetOp"
           (Prelude.Maybe GSetOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtOp'gsetOp
                 (\ x__ y__ -> x__{_DtOp'gsetOp = y__}))
              Prelude.id
instance Data.ProtoLens.Message DtOp where
        messageName _ = Data.Text.pack "DtOp"
        fieldsByTag
          = let counterOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "counter_op"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor CounterOp)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'counterOp")))
                      :: Data.ProtoLens.FieldDescriptor DtOp
                setOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "set_op"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor SetOp)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'setOp")))
                      :: Data.ProtoLens.FieldDescriptor DtOp
                mapOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "map_op"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor MapOp)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'mapOp")))
                      :: Data.ProtoLens.FieldDescriptor DtOp
                hllOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "hll_op"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor HllOp)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'hllOp")))
                      :: Data.ProtoLens.FieldDescriptor DtOp
                gsetOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "gset_op"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor GSetOp)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'gsetOp")))
                      :: Data.ProtoLens.FieldDescriptor DtOp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, counterOp__field_descriptor),
                 (Data.ProtoLens.Tag 2, setOp__field_descriptor),
                 (Data.ProtoLens.Tag 3, mapOp__field_descriptor),
                 (Data.ProtoLens.Tag 4, hllOp__field_descriptor),
                 (Data.ProtoLens.Tag 5, gsetOp__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _DtOp'_unknownFields
              (\ x__ y__ -> x__{_DtOp'_unknownFields = y__})
        defMessage
          = DtOp{_DtOp'counterOp = Prelude.Nothing,
                 _DtOp'setOp = Prelude.Nothing, _DtOp'mapOp = Prelude.Nothing,
                 _DtOp'hllOp = Prelude.Nothing, _DtOp'gsetOp = Prelude.Nothing,
                 _DtOp'_unknownFields = ([])}
instance Control.DeepSeq.NFData DtOp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_DtOp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_DtOp'counterOp x__)
                   (Control.DeepSeq.deepseq (_DtOp'setOp x__)
                      (Control.DeepSeq.deepseq (_DtOp'mapOp x__)
                         (Control.DeepSeq.deepseq (_DtOp'hllOp x__)
                            (Control.DeepSeq.deepseq (_DtOp'gsetOp x__) (()))))))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' DtUpdateReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' DtUpdateReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'key' @:: Lens' DtUpdateReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.type'' @:: Lens' DtUpdateReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.context' @:: Lens' DtUpdateReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'context' @:: Lens' DtUpdateReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.op' @:: Lens' DtUpdateReq DtOp@
    * 'Proto.Riak_Fields.w' @:: Lens' DtUpdateReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'w' @:: Lens' DtUpdateReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.dw' @:: Lens' DtUpdateReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'dw' @:: Lens' DtUpdateReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.pw' @:: Lens' DtUpdateReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pw' @:: Lens' DtUpdateReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.returnBody' @:: Lens' DtUpdateReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'returnBody' @:: Lens' DtUpdateReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.timeout' @:: Lens' DtUpdateReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' DtUpdateReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.sloppyQuorum' @:: Lens' DtUpdateReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'sloppyQuorum' @:: Lens' DtUpdateReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.nVal' @:: Lens' DtUpdateReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'nVal' @:: Lens' DtUpdateReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.includeContext' @:: Lens' DtUpdateReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'includeContext' @:: Lens' DtUpdateReq (Prelude.Maybe Prelude.Bool)@
 -}
data DtUpdateReq = DtUpdateReq{_DtUpdateReq'bucket ::
                               !Data.ByteString.ByteString,
                               _DtUpdateReq'key :: !(Prelude.Maybe Data.ByteString.ByteString),
                               _DtUpdateReq'type' :: !Data.ByteString.ByteString,
                               _DtUpdateReq'context ::
                               !(Prelude.Maybe Data.ByteString.ByteString),
                               _DtUpdateReq'op :: !DtOp,
                               _DtUpdateReq'w :: !(Prelude.Maybe Data.Word.Word32),
                               _DtUpdateReq'dw :: !(Prelude.Maybe Data.Word.Word32),
                               _DtUpdateReq'pw :: !(Prelude.Maybe Data.Word.Word32),
                               _DtUpdateReq'returnBody :: !(Prelude.Maybe Prelude.Bool),
                               _DtUpdateReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                               _DtUpdateReq'sloppyQuorum :: !(Prelude.Maybe Prelude.Bool),
                               _DtUpdateReq'nVal :: !(Prelude.Maybe Data.Word.Word32),
                               _DtUpdateReq'includeContext :: !(Prelude.Maybe Prelude.Bool),
                               _DtUpdateReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DtUpdateReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' DtUpdateReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'bucket
                 (\ x__ y__ -> x__{_DtUpdateReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'key
                 (\ x__ y__ -> x__{_DtUpdateReq'key = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'key"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'key
                 (\ x__ y__ -> x__{_DtUpdateReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'type'
                 (\ x__ y__ -> x__{_DtUpdateReq'type' = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "context"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'context
                 (\ x__ y__ -> x__{_DtUpdateReq'context = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'context"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'context
                 (\ x__ y__ -> x__{_DtUpdateReq'context = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "op" (DtOp) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'op
                 (\ x__ y__ -> x__{_DtUpdateReq'op = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "w" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'w
                 (\ x__ y__ -> x__{_DtUpdateReq'w = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'w"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'w
                 (\ x__ y__ -> x__{_DtUpdateReq'w = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "dw" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'dw
                 (\ x__ y__ -> x__{_DtUpdateReq'dw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'dw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'dw
                 (\ x__ y__ -> x__{_DtUpdateReq'dw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "pw" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'pw
                 (\ x__ y__ -> x__{_DtUpdateReq'pw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'pw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'pw
                 (\ x__ y__ -> x__{_DtUpdateReq'pw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "returnBody"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'returnBody
                 (\ x__ y__ -> x__{_DtUpdateReq'returnBody = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'returnBody"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'returnBody
                 (\ x__ y__ -> x__{_DtUpdateReq'returnBody = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'timeout
                 (\ x__ y__ -> x__{_DtUpdateReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'timeout
                 (\ x__ y__ -> x__{_DtUpdateReq'timeout = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "sloppyQuorum"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'sloppyQuorum
                 (\ x__ y__ -> x__{_DtUpdateReq'sloppyQuorum = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'sloppyQuorum"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'sloppyQuorum
                 (\ x__ y__ -> x__{_DtUpdateReq'sloppyQuorum = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "nVal" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'nVal
                 (\ x__ y__ -> x__{_DtUpdateReq'nVal = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'nVal"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'nVal
                 (\ x__ y__ -> x__{_DtUpdateReq'nVal = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateReq "includeContext"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'includeContext
                 (\ x__ y__ -> x__{_DtUpdateReq'includeContext = y__}))
              (Data.ProtoLens.maybeLens Prelude.True)
instance Lens.Labels.HasLens' DtUpdateReq "maybe'includeContext"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateReq'includeContext
                 (\ x__ y__ -> x__{_DtUpdateReq'includeContext = y__}))
              Prelude.id
instance Data.ProtoLens.Message DtUpdateReq where
        messageName _ = Data.Text.pack "DtUpdateReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'key")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                context__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'context")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                op__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "op"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor DtOp)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "op")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                w__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "w"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'w")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                dw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "dw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'dw")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                pw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pw")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                returnBody__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "return_body"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'returnBody")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                sloppyQuorum__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "sloppy_quorum"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'sloppyQuorum")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                nVal__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "n_val"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'nVal")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
                includeContext__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "include_context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'includeContext")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, type'__field_descriptor),
                 (Data.ProtoLens.Tag 4, context__field_descriptor),
                 (Data.ProtoLens.Tag 5, op__field_descriptor),
                 (Data.ProtoLens.Tag 6, w__field_descriptor),
                 (Data.ProtoLens.Tag 7, dw__field_descriptor),
                 (Data.ProtoLens.Tag 8, pw__field_descriptor),
                 (Data.ProtoLens.Tag 9, returnBody__field_descriptor),
                 (Data.ProtoLens.Tag 10, timeout__field_descriptor),
                 (Data.ProtoLens.Tag 11, sloppyQuorum__field_descriptor),
                 (Data.ProtoLens.Tag 12, nVal__field_descriptor),
                 (Data.ProtoLens.Tag 13, includeContext__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _DtUpdateReq'_unknownFields
              (\ x__ y__ -> x__{_DtUpdateReq'_unknownFields = y__})
        defMessage
          = DtUpdateReq{_DtUpdateReq'bucket = Data.ProtoLens.fieldDefault,
                        _DtUpdateReq'key = Prelude.Nothing,
                        _DtUpdateReq'type' = Data.ProtoLens.fieldDefault,
                        _DtUpdateReq'context = Prelude.Nothing,
                        _DtUpdateReq'op = Data.ProtoLens.defMessage,
                        _DtUpdateReq'w = Prelude.Nothing,
                        _DtUpdateReq'dw = Prelude.Nothing,
                        _DtUpdateReq'pw = Prelude.Nothing,
                        _DtUpdateReq'returnBody = Prelude.Nothing,
                        _DtUpdateReq'timeout = Prelude.Nothing,
                        _DtUpdateReq'sloppyQuorum = Prelude.Nothing,
                        _DtUpdateReq'nVal = Prelude.Nothing,
                        _DtUpdateReq'includeContext = Prelude.Nothing,
                        _DtUpdateReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData DtUpdateReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_DtUpdateReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_DtUpdateReq'bucket x__)
                   (Control.DeepSeq.deepseq (_DtUpdateReq'key x__)
                      (Control.DeepSeq.deepseq (_DtUpdateReq'type' x__)
                         (Control.DeepSeq.deepseq (_DtUpdateReq'context x__)
                            (Control.DeepSeq.deepseq (_DtUpdateReq'op x__)
                               (Control.DeepSeq.deepseq (_DtUpdateReq'w x__)
                                  (Control.DeepSeq.deepseq (_DtUpdateReq'dw x__)
                                     (Control.DeepSeq.deepseq (_DtUpdateReq'pw x__)
                                        (Control.DeepSeq.deepseq (_DtUpdateReq'returnBody x__)
                                           (Control.DeepSeq.deepseq (_DtUpdateReq'timeout x__)
                                              (Control.DeepSeq.deepseq
                                                 (_DtUpdateReq'sloppyQuorum x__)
                                                 (Control.DeepSeq.deepseq (_DtUpdateReq'nVal x__)
                                                    (Control.DeepSeq.deepseq
                                                       (_DtUpdateReq'includeContext x__)
                                                       (()))))))))))))))
{- | Fields :

    * 'Proto.Riak_Fields.key' @:: Lens' DtUpdateResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'key' @:: Lens' DtUpdateResp (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.context' @:: Lens' DtUpdateResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'context' @:: Lens' DtUpdateResp (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.counterValue' @:: Lens' DtUpdateResp Data.Int.Int64@
    * 'Proto.Riak_Fields.maybe'counterValue' @:: Lens' DtUpdateResp (Prelude.Maybe Data.Int.Int64)@
    * 'Proto.Riak_Fields.setValue' @:: Lens' DtUpdateResp [Data.ByteString.ByteString]@
    * 'Proto.Riak_Fields.mapValue' @:: Lens' DtUpdateResp [MapEntry]@
    * 'Proto.Riak_Fields.hllValue' @:: Lens' DtUpdateResp Data.Word.Word64@
    * 'Proto.Riak_Fields.maybe'hllValue' @:: Lens' DtUpdateResp (Prelude.Maybe Data.Word.Word64)@
    * 'Proto.Riak_Fields.gsetValue' @:: Lens' DtUpdateResp [Data.ByteString.ByteString]@
 -}
data DtUpdateResp = DtUpdateResp{_DtUpdateResp'key ::
                                 !(Prelude.Maybe Data.ByteString.ByteString),
                                 _DtUpdateResp'context ::
                                 !(Prelude.Maybe Data.ByteString.ByteString),
                                 _DtUpdateResp'counterValue :: !(Prelude.Maybe Data.Int.Int64),
                                 _DtUpdateResp'setValue :: ![Data.ByteString.ByteString],
                                 _DtUpdateResp'mapValue :: ![MapEntry],
                                 _DtUpdateResp'hllValue :: !(Prelude.Maybe Data.Word.Word64),
                                 _DtUpdateResp'gsetValue :: ![Data.ByteString.ByteString],
                                 _DtUpdateResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                      deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DtUpdateResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' DtUpdateResp "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'key
                 (\ x__ y__ -> x__{_DtUpdateResp'key = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateResp "maybe'key"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'key
                 (\ x__ y__ -> x__{_DtUpdateResp'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateResp "context"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'context
                 (\ x__ y__ -> x__{_DtUpdateResp'context = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateResp "maybe'context"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'context
                 (\ x__ y__ -> x__{_DtUpdateResp'context = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateResp "counterValue"
           (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'counterValue
                 (\ x__ y__ -> x__{_DtUpdateResp'counterValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateResp "maybe'counterValue"
           (Prelude.Maybe Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'counterValue
                 (\ x__ y__ -> x__{_DtUpdateResp'counterValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateResp "setValue"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'setValue
                 (\ x__ y__ -> x__{_DtUpdateResp'setValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateResp "mapValue" ([MapEntry])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'mapValue
                 (\ x__ y__ -> x__{_DtUpdateResp'mapValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateResp "hllValue"
           (Data.Word.Word64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'hllValue
                 (\ x__ y__ -> x__{_DtUpdateResp'hllValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtUpdateResp "maybe'hllValue"
           (Prelude.Maybe Data.Word.Word64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'hllValue
                 (\ x__ y__ -> x__{_DtUpdateResp'hllValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtUpdateResp "gsetValue"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtUpdateResp'gsetValue
                 (\ x__ y__ -> x__{_DtUpdateResp'gsetValue = y__}))
              Prelude.id
instance Data.ProtoLens.Message DtUpdateResp where
        messageName _ = Data.Text.pack "DtUpdateResp"
        fieldsByTag
          = let key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'key")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateResp
                context__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'context")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateResp
                counterValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "counter_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'counterValue")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateResp
                setValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "set_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "setValue")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateResp
                mapValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "map_value"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor MapEntry)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "mapValue")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateResp
                hllValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "hll_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'hllValue")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateResp
                gsetValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "gset_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "gsetValue")))
                      :: Data.ProtoLens.FieldDescriptor DtUpdateResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, key__field_descriptor),
                 (Data.ProtoLens.Tag 2, context__field_descriptor),
                 (Data.ProtoLens.Tag 3, counterValue__field_descriptor),
                 (Data.ProtoLens.Tag 4, setValue__field_descriptor),
                 (Data.ProtoLens.Tag 5, mapValue__field_descriptor),
                 (Data.ProtoLens.Tag 6, hllValue__field_descriptor),
                 (Data.ProtoLens.Tag 7, gsetValue__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _DtUpdateResp'_unknownFields
              (\ x__ y__ -> x__{_DtUpdateResp'_unknownFields = y__})
        defMessage
          = DtUpdateResp{_DtUpdateResp'key = Prelude.Nothing,
                         _DtUpdateResp'context = Prelude.Nothing,
                         _DtUpdateResp'counterValue = Prelude.Nothing,
                         _DtUpdateResp'setValue = [], _DtUpdateResp'mapValue = [],
                         _DtUpdateResp'hllValue = Prelude.Nothing,
                         _DtUpdateResp'gsetValue = [], _DtUpdateResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData DtUpdateResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_DtUpdateResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_DtUpdateResp'key x__)
                   (Control.DeepSeq.deepseq (_DtUpdateResp'context x__)
                      (Control.DeepSeq.deepseq (_DtUpdateResp'counterValue x__)
                         (Control.DeepSeq.deepseq (_DtUpdateResp'setValue x__)
                            (Control.DeepSeq.deepseq (_DtUpdateResp'mapValue x__)
                               (Control.DeepSeq.deepseq (_DtUpdateResp'hllValue x__)
                                  (Control.DeepSeq.deepseq (_DtUpdateResp'gsetValue x__) (()))))))))
{- | Fields :

    * 'Proto.Riak_Fields.counterValue' @:: Lens' DtValue Data.Int.Int64@
    * 'Proto.Riak_Fields.maybe'counterValue' @:: Lens' DtValue (Prelude.Maybe Data.Int.Int64)@
    * 'Proto.Riak_Fields.setValue' @:: Lens' DtValue [Data.ByteString.ByteString]@
    * 'Proto.Riak_Fields.mapValue' @:: Lens' DtValue [MapEntry]@
    * 'Proto.Riak_Fields.hllValue' @:: Lens' DtValue Data.Word.Word64@
    * 'Proto.Riak_Fields.maybe'hllValue' @:: Lens' DtValue (Prelude.Maybe Data.Word.Word64)@
    * 'Proto.Riak_Fields.gsetValue' @:: Lens' DtValue [Data.ByteString.ByteString]@
 -}
data DtValue = DtValue{_DtValue'counterValue ::
                       !(Prelude.Maybe Data.Int.Int64),
                       _DtValue'setValue :: ![Data.ByteString.ByteString],
                       _DtValue'mapValue :: ![MapEntry],
                       _DtValue'hllValue :: !(Prelude.Maybe Data.Word.Word64),
                       _DtValue'gsetValue :: ![Data.ByteString.ByteString],
                       _DtValue'_unknownFields :: !Data.ProtoLens.FieldSet}
                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DtValue where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' DtValue "counterValue"
           (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtValue'counterValue
                 (\ x__ y__ -> x__{_DtValue'counterValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtValue "maybe'counterValue"
           (Prelude.Maybe Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtValue'counterValue
                 (\ x__ y__ -> x__{_DtValue'counterValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtValue "setValue"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtValue'setValue
                 (\ x__ y__ -> x__{_DtValue'setValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtValue "mapValue" ([MapEntry]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtValue'mapValue
                 (\ x__ y__ -> x__{_DtValue'mapValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtValue "hllValue" (Data.Word.Word64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtValue'hllValue
                 (\ x__ y__ -> x__{_DtValue'hllValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' DtValue "maybe'hllValue"
           (Prelude.Maybe Data.Word.Word64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtValue'hllValue
                 (\ x__ y__ -> x__{_DtValue'hllValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' DtValue "gsetValue"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DtValue'gsetValue
                 (\ x__ y__ -> x__{_DtValue'gsetValue = y__}))
              Prelude.id
instance Data.ProtoLens.Message DtValue where
        messageName _ = Data.Text.pack "DtValue"
        fieldsByTag
          = let counterValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "counter_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'counterValue")))
                      :: Data.ProtoLens.FieldDescriptor DtValue
                setValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "set_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "setValue")))
                      :: Data.ProtoLens.FieldDescriptor DtValue
                mapValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "map_value"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor MapEntry)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "mapValue")))
                      :: Data.ProtoLens.FieldDescriptor DtValue
                hllValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "hll_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'hllValue")))
                      :: Data.ProtoLens.FieldDescriptor DtValue
                gsetValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "gset_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "gsetValue")))
                      :: Data.ProtoLens.FieldDescriptor DtValue
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, counterValue__field_descriptor),
                 (Data.ProtoLens.Tag 2, setValue__field_descriptor),
                 (Data.ProtoLens.Tag 3, mapValue__field_descriptor),
                 (Data.ProtoLens.Tag 4, hllValue__field_descriptor),
                 (Data.ProtoLens.Tag 5, gsetValue__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _DtValue'_unknownFields
              (\ x__ y__ -> x__{_DtValue'_unknownFields = y__})
        defMessage
          = DtValue{_DtValue'counterValue = Prelude.Nothing,
                    _DtValue'setValue = [], _DtValue'mapValue = [],
                    _DtValue'hllValue = Prelude.Nothing, _DtValue'gsetValue = [],
                    _DtValue'_unknownFields = ([])}
instance Control.DeepSeq.NFData DtValue where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_DtValue'_unknownFields x__)
                (Control.DeepSeq.deepseq (_DtValue'counterValue x__)
                   (Control.DeepSeq.deepseq (_DtValue'setValue x__)
                      (Control.DeepSeq.deepseq (_DtValue'mapValue x__)
                         (Control.DeepSeq.deepseq (_DtValue'hllValue x__)
                            (Control.DeepSeq.deepseq (_DtValue'gsetValue x__) (()))))))
{- | Fields :

    * 'Proto.Riak_Fields.adds' @:: Lens' GSetOp [Data.ByteString.ByteString]@
 -}
data GSetOp = GSetOp{_GSetOp'adds :: ![Data.ByteString.ByteString],
                     _GSetOp'_unknownFields :: !Data.ProtoLens.FieldSet}
                deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GSetOp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' GSetOp "adds"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _GSetOp'adds
                 (\ x__ y__ -> x__{_GSetOp'adds = y__}))
              Prelude.id
instance Data.ProtoLens.Message GSetOp where
        messageName _ = Data.Text.pack "GSetOp"
        fieldsByTag
          = let adds__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "adds"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "adds")))
                      :: Data.ProtoLens.FieldDescriptor GSetOp
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, adds__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _GSetOp'_unknownFields
              (\ x__ y__ -> x__{_GSetOp'_unknownFields = y__})
        defMessage
          = GSetOp{_GSetOp'adds = [], _GSetOp'_unknownFields = ([])}
instance Control.DeepSeq.NFData GSetOp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_GSetOp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_GSetOp'adds x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.adds' @:: Lens' HllOp [Data.ByteString.ByteString]@
 -}
data HllOp = HllOp{_HllOp'adds :: ![Data.ByteString.ByteString],
                   _HllOp'_unknownFields :: !Data.ProtoLens.FieldSet}
               deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show HllOp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' HllOp "adds"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _HllOp'adds
                 (\ x__ y__ -> x__{_HllOp'adds = y__}))
              Prelude.id
instance Data.ProtoLens.Message HllOp where
        messageName _ = Data.Text.pack "HllOp"
        fieldsByTag
          = let adds__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "adds"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "adds")))
                      :: Data.ProtoLens.FieldDescriptor HllOp
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, adds__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _HllOp'_unknownFields
              (\ x__ y__ -> x__{_HllOp'_unknownFields = y__})
        defMessage = HllOp{_HllOp'adds = [], _HllOp'_unknownFields = ([])}
instance Control.DeepSeq.NFData HllOp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_HllOp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_HllOp'adds x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.field' @:: Lens' MapEntry MapField@
    * 'Proto.Riak_Fields.counterValue' @:: Lens' MapEntry Data.Int.Int64@
    * 'Proto.Riak_Fields.maybe'counterValue' @:: Lens' MapEntry (Prelude.Maybe Data.Int.Int64)@
    * 'Proto.Riak_Fields.setValue' @:: Lens' MapEntry [Data.ByteString.ByteString]@
    * 'Proto.Riak_Fields.registerValue' @:: Lens' MapEntry Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'registerValue' @:: Lens' MapEntry (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.flagValue' @:: Lens' MapEntry Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'flagValue' @:: Lens' MapEntry (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.mapValue' @:: Lens' MapEntry [MapEntry]@
 -}
data MapEntry = MapEntry{_MapEntry'field :: !MapField,
                         _MapEntry'counterValue :: !(Prelude.Maybe Data.Int.Int64),
                         _MapEntry'setValue :: ![Data.ByteString.ByteString],
                         _MapEntry'registerValue ::
                         !(Prelude.Maybe Data.ByteString.ByteString),
                         _MapEntry'flagValue :: !(Prelude.Maybe Prelude.Bool),
                         _MapEntry'mapValue :: ![MapEntry],
                         _MapEntry'_unknownFields :: !Data.ProtoLens.FieldSet}
                  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MapEntry where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' MapEntry "field" (MapField) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapEntry'field
                 (\ x__ y__ -> x__{_MapEntry'field = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapEntry "counterValue"
           (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapEntry'counterValue
                 (\ x__ y__ -> x__{_MapEntry'counterValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' MapEntry "maybe'counterValue"
           (Prelude.Maybe Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapEntry'counterValue
                 (\ x__ y__ -> x__{_MapEntry'counterValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapEntry "setValue"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapEntry'setValue
                 (\ x__ y__ -> x__{_MapEntry'setValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapEntry "registerValue"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapEntry'registerValue
                 (\ x__ y__ -> x__{_MapEntry'registerValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' MapEntry "maybe'registerValue"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapEntry'registerValue
                 (\ x__ y__ -> x__{_MapEntry'registerValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapEntry "flagValue" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapEntry'flagValue
                 (\ x__ y__ -> x__{_MapEntry'flagValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' MapEntry "maybe'flagValue"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapEntry'flagValue
                 (\ x__ y__ -> x__{_MapEntry'flagValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapEntry "mapValue" ([MapEntry])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapEntry'mapValue
                 (\ x__ y__ -> x__{_MapEntry'mapValue = y__}))
              Prelude.id
instance Data.ProtoLens.Message MapEntry where
        messageName _ = Data.Text.pack "MapEntry"
        fieldsByTag
          = let field__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "field"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor MapField)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "field")))
                      :: Data.ProtoLens.FieldDescriptor MapEntry
                counterValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "counter_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'counterValue")))
                      :: Data.ProtoLens.FieldDescriptor MapEntry
                setValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "set_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "setValue")))
                      :: Data.ProtoLens.FieldDescriptor MapEntry
                registerValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "register_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'registerValue")))
                      :: Data.ProtoLens.FieldDescriptor MapEntry
                flagValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "flag_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'flagValue")))
                      :: Data.ProtoLens.FieldDescriptor MapEntry
                mapValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "map_value"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor MapEntry)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "mapValue")))
                      :: Data.ProtoLens.FieldDescriptor MapEntry
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, field__field_descriptor),
                 (Data.ProtoLens.Tag 2, counterValue__field_descriptor),
                 (Data.ProtoLens.Tag 3, setValue__field_descriptor),
                 (Data.ProtoLens.Tag 4, registerValue__field_descriptor),
                 (Data.ProtoLens.Tag 5, flagValue__field_descriptor),
                 (Data.ProtoLens.Tag 6, mapValue__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _MapEntry'_unknownFields
              (\ x__ y__ -> x__{_MapEntry'_unknownFields = y__})
        defMessage
          = MapEntry{_MapEntry'field = Data.ProtoLens.defMessage,
                     _MapEntry'counterValue = Prelude.Nothing, _MapEntry'setValue = [],
                     _MapEntry'registerValue = Prelude.Nothing,
                     _MapEntry'flagValue = Prelude.Nothing, _MapEntry'mapValue = [],
                     _MapEntry'_unknownFields = ([])}
instance Control.DeepSeq.NFData MapEntry where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_MapEntry'_unknownFields x__)
                (Control.DeepSeq.deepseq (_MapEntry'field x__)
                   (Control.DeepSeq.deepseq (_MapEntry'counterValue x__)
                      (Control.DeepSeq.deepseq (_MapEntry'setValue x__)
                         (Control.DeepSeq.deepseq (_MapEntry'registerValue x__)
                            (Control.DeepSeq.deepseq (_MapEntry'flagValue x__)
                               (Control.DeepSeq.deepseq (_MapEntry'mapValue x__) (())))))))
{- | Fields :

    * 'Proto.Riak_Fields.name' @:: Lens' MapField Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.type'' @:: Lens' MapField MapField'MapFieldType@
 -}
data MapField = MapField{_MapField'name ::
                         !Data.ByteString.ByteString,
                         _MapField'type' :: !MapField'MapFieldType,
                         _MapField'_unknownFields :: !Data.ProtoLens.FieldSet}
                  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MapField where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' MapField "name"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapField'name
                 (\ x__ y__ -> x__{_MapField'name = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapField "type'"
           (MapField'MapFieldType)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapField'type'
                 (\ x__ y__ -> x__{_MapField'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message MapField where
        messageName _ = Data.Text.pack "MapField"
        fieldsByTag
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")))
                      :: Data.ProtoLens.FieldDescriptor MapField
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor MapField'MapFieldType)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")))
                      :: Data.ProtoLens.FieldDescriptor MapField
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, name__field_descriptor),
                 (Data.ProtoLens.Tag 2, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _MapField'_unknownFields
              (\ x__ y__ -> x__{_MapField'_unknownFields = y__})
        defMessage
          = MapField{_MapField'name = Data.ProtoLens.fieldDefault,
                     _MapField'type' = Data.ProtoLens.fieldDefault,
                     _MapField'_unknownFields = ([])}
instance Control.DeepSeq.NFData MapField where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_MapField'_unknownFields x__)
                (Control.DeepSeq.deepseq (_MapField'name x__)
                   (Control.DeepSeq.deepseq (_MapField'type' x__) (())))
data MapField'MapFieldType = MapField'COUNTER
                           | MapField'SET
                           | MapField'REGISTER
                           | MapField'FLAG
                           | MapField'MAP
                               deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.FieldDefault MapField'MapFieldType where
        fieldDefault = MapField'COUNTER
instance Data.ProtoLens.MessageEnum MapField'MapFieldType where
        maybeToEnum 1 = Prelude.Just MapField'COUNTER
        maybeToEnum 2 = Prelude.Just MapField'SET
        maybeToEnum 3 = Prelude.Just MapField'REGISTER
        maybeToEnum 4 = Prelude.Just MapField'FLAG
        maybeToEnum 5 = Prelude.Just MapField'MAP
        maybeToEnum _ = Prelude.Nothing
        showEnum MapField'COUNTER = "COUNTER"
        showEnum MapField'SET = "SET"
        showEnum MapField'REGISTER = "REGISTER"
        showEnum MapField'FLAG = "FLAG"
        showEnum MapField'MAP = "MAP"
        readEnum "COUNTER" = Prelude.Just MapField'COUNTER
        readEnum "SET" = Prelude.Just MapField'SET
        readEnum "REGISTER" = Prelude.Just MapField'REGISTER
        readEnum "FLAG" = Prelude.Just MapField'FLAG
        readEnum "MAP" = Prelude.Just MapField'MAP
        readEnum _ = Prelude.Nothing
instance Prelude.Enum MapField'MapFieldType where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum MapFieldType: "
                    (Prelude.show k__)))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum MapField'COUNTER = 1
        fromEnum MapField'SET = 2
        fromEnum MapField'REGISTER = 3
        fromEnum MapField'FLAG = 4
        fromEnum MapField'MAP = 5
        succ MapField'MAP
          = Prelude.error
              "MapField'MapFieldType.succ: bad argument MapField'MAP. This value would be out of bounds."
        succ MapField'COUNTER = MapField'SET
        succ MapField'SET = MapField'REGISTER
        succ MapField'REGISTER = MapField'FLAG
        succ MapField'FLAG = MapField'MAP
        pred MapField'COUNTER
          = Prelude.error
              "MapField'MapFieldType.pred: bad argument MapField'COUNTER. This value would be out of bounds."
        pred MapField'SET = MapField'COUNTER
        pred MapField'REGISTER = MapField'SET
        pred MapField'FLAG = MapField'REGISTER
        pred MapField'MAP = MapField'FLAG
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Prelude.Bounded MapField'MapFieldType where
        minBound = MapField'COUNTER
        maxBound = MapField'MAP
instance Control.DeepSeq.NFData MapField'MapFieldType where
        rnf x__ = Prelude.seq x__ (())
{- | Fields :

    * 'Proto.Riak_Fields.removes' @:: Lens' MapOp [MapField]@
    * 'Proto.Riak_Fields.updates' @:: Lens' MapOp [MapUpdate]@
 -}
data MapOp = MapOp{_MapOp'removes :: ![MapField],
                   _MapOp'updates :: ![MapUpdate],
                   _MapOp'_unknownFields :: !Data.ProtoLens.FieldSet}
               deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MapOp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' MapOp "removes" ([MapField]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapOp'removes
                 (\ x__ y__ -> x__{_MapOp'removes = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapOp "updates" ([MapUpdate]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapOp'updates
                 (\ x__ y__ -> x__{_MapOp'updates = y__}))
              Prelude.id
instance Data.ProtoLens.Message MapOp where
        messageName _ = Data.Text.pack "MapOp"
        fieldsByTag
          = let removes__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "removes"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor MapField)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "removes")))
                      :: Data.ProtoLens.FieldDescriptor MapOp
                updates__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "updates"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor MapUpdate)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "updates")))
                      :: Data.ProtoLens.FieldDescriptor MapOp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, removes__field_descriptor),
                 (Data.ProtoLens.Tag 2, updates__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _MapOp'_unknownFields
              (\ x__ y__ -> x__{_MapOp'_unknownFields = y__})
        defMessage
          = MapOp{_MapOp'removes = [], _MapOp'updates = [],
                  _MapOp'_unknownFields = ([])}
instance Control.DeepSeq.NFData MapOp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_MapOp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_MapOp'removes x__)
                   (Control.DeepSeq.deepseq (_MapOp'updates x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.field' @:: Lens' MapUpdate MapField@
    * 'Proto.Riak_Fields.counterOp' @:: Lens' MapUpdate CounterOp@
    * 'Proto.Riak_Fields.maybe'counterOp' @:: Lens' MapUpdate (Prelude.Maybe CounterOp)@
    * 'Proto.Riak_Fields.setOp' @:: Lens' MapUpdate SetOp@
    * 'Proto.Riak_Fields.maybe'setOp' @:: Lens' MapUpdate (Prelude.Maybe SetOp)@
    * 'Proto.Riak_Fields.registerOp' @:: Lens' MapUpdate Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'registerOp' @:: Lens' MapUpdate (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.flagOp' @:: Lens' MapUpdate MapUpdate'FlagOp@
    * 'Proto.Riak_Fields.maybe'flagOp' @:: Lens' MapUpdate (Prelude.Maybe MapUpdate'FlagOp)@
    * 'Proto.Riak_Fields.mapOp' @:: Lens' MapUpdate MapOp@
    * 'Proto.Riak_Fields.maybe'mapOp' @:: Lens' MapUpdate (Prelude.Maybe MapOp)@
 -}
data MapUpdate = MapUpdate{_MapUpdate'field :: !MapField,
                           _MapUpdate'counterOp :: !(Prelude.Maybe CounterOp),
                           _MapUpdate'setOp :: !(Prelude.Maybe SetOp),
                           _MapUpdate'registerOp ::
                           !(Prelude.Maybe Data.ByteString.ByteString),
                           _MapUpdate'flagOp :: !(Prelude.Maybe MapUpdate'FlagOp),
                           _MapUpdate'mapOp :: !(Prelude.Maybe MapOp),
                           _MapUpdate'_unknownFields :: !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MapUpdate where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' MapUpdate "field" (MapField) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'field
                 (\ x__ y__ -> x__{_MapUpdate'field = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapUpdate "counterOp" (CounterOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'counterOp
                 (\ x__ y__ -> x__{_MapUpdate'counterOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' MapUpdate "maybe'counterOp"
           (Prelude.Maybe CounterOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'counterOp
                 (\ x__ y__ -> x__{_MapUpdate'counterOp = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapUpdate "setOp" (SetOp) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'setOp
                 (\ x__ y__ -> x__{_MapUpdate'setOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' MapUpdate "maybe'setOp"
           (Prelude.Maybe SetOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'setOp
                 (\ x__ y__ -> x__{_MapUpdate'setOp = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapUpdate "registerOp"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'registerOp
                 (\ x__ y__ -> x__{_MapUpdate'registerOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' MapUpdate "maybe'registerOp"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'registerOp
                 (\ x__ y__ -> x__{_MapUpdate'registerOp = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapUpdate "flagOp" (MapUpdate'FlagOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'flagOp
                 (\ x__ y__ -> x__{_MapUpdate'flagOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' MapUpdate "maybe'flagOp"
           (Prelude.Maybe MapUpdate'FlagOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'flagOp
                 (\ x__ y__ -> x__{_MapUpdate'flagOp = y__}))
              Prelude.id
instance Lens.Labels.HasLens' MapUpdate "mapOp" (MapOp) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'mapOp
                 (\ x__ y__ -> x__{_MapUpdate'mapOp = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' MapUpdate "maybe'mapOp"
           (Prelude.Maybe MapOp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MapUpdate'mapOp
                 (\ x__ y__ -> x__{_MapUpdate'mapOp = y__}))
              Prelude.id
instance Data.ProtoLens.Message MapUpdate where
        messageName _ = Data.Text.pack "MapUpdate"
        fieldsByTag
          = let field__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "field"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor MapField)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "field")))
                      :: Data.ProtoLens.FieldDescriptor MapUpdate
                counterOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "counter_op"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor CounterOp)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'counterOp")))
                      :: Data.ProtoLens.FieldDescriptor MapUpdate
                setOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "set_op"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor SetOp)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'setOp")))
                      :: Data.ProtoLens.FieldDescriptor MapUpdate
                registerOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "register_op"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'registerOp")))
                      :: Data.ProtoLens.FieldDescriptor MapUpdate
                flagOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "flag_op"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor MapUpdate'FlagOp)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'flagOp")))
                      :: Data.ProtoLens.FieldDescriptor MapUpdate
                mapOp__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "map_op"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor MapOp)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'mapOp")))
                      :: Data.ProtoLens.FieldDescriptor MapUpdate
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, field__field_descriptor),
                 (Data.ProtoLens.Tag 2, counterOp__field_descriptor),
                 (Data.ProtoLens.Tag 3, setOp__field_descriptor),
                 (Data.ProtoLens.Tag 4, registerOp__field_descriptor),
                 (Data.ProtoLens.Tag 5, flagOp__field_descriptor),
                 (Data.ProtoLens.Tag 6, mapOp__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _MapUpdate'_unknownFields
              (\ x__ y__ -> x__{_MapUpdate'_unknownFields = y__})
        defMessage
          = MapUpdate{_MapUpdate'field = Data.ProtoLens.defMessage,
                      _MapUpdate'counterOp = Prelude.Nothing,
                      _MapUpdate'setOp = Prelude.Nothing,
                      _MapUpdate'registerOp = Prelude.Nothing,
                      _MapUpdate'flagOp = Prelude.Nothing,
                      _MapUpdate'mapOp = Prelude.Nothing,
                      _MapUpdate'_unknownFields = ([])}
instance Control.DeepSeq.NFData MapUpdate where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_MapUpdate'_unknownFields x__)
                (Control.DeepSeq.deepseq (_MapUpdate'field x__)
                   (Control.DeepSeq.deepseq (_MapUpdate'counterOp x__)
                      (Control.DeepSeq.deepseq (_MapUpdate'setOp x__)
                         (Control.DeepSeq.deepseq (_MapUpdate'registerOp x__)
                            (Control.DeepSeq.deepseq (_MapUpdate'flagOp x__)
                               (Control.DeepSeq.deepseq (_MapUpdate'mapOp x__) (())))))))
data MapUpdate'FlagOp = MapUpdate'ENABLE
                      | MapUpdate'DISABLE
                          deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.FieldDefault MapUpdate'FlagOp where
        fieldDefault = MapUpdate'ENABLE
instance Data.ProtoLens.MessageEnum MapUpdate'FlagOp where
        maybeToEnum 1 = Prelude.Just MapUpdate'ENABLE
        maybeToEnum 2 = Prelude.Just MapUpdate'DISABLE
        maybeToEnum _ = Prelude.Nothing
        showEnum MapUpdate'ENABLE = "ENABLE"
        showEnum MapUpdate'DISABLE = "DISABLE"
        readEnum "ENABLE" = Prelude.Just MapUpdate'ENABLE
        readEnum "DISABLE" = Prelude.Just MapUpdate'DISABLE
        readEnum _ = Prelude.Nothing
instance Prelude.Enum MapUpdate'FlagOp where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum FlagOp: "
                    (Prelude.show k__)))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum MapUpdate'ENABLE = 1
        fromEnum MapUpdate'DISABLE = 2
        succ MapUpdate'DISABLE
          = Prelude.error
              "MapUpdate'FlagOp.succ: bad argument MapUpdate'DISABLE. This value would be out of bounds."
        succ MapUpdate'ENABLE = MapUpdate'DISABLE
        pred MapUpdate'ENABLE
          = Prelude.error
              "MapUpdate'FlagOp.pred: bad argument MapUpdate'ENABLE. This value would be out of bounds."
        pred MapUpdate'DISABLE = MapUpdate'ENABLE
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Prelude.Bounded MapUpdate'FlagOp where
        minBound = MapUpdate'ENABLE
        maxBound = MapUpdate'DISABLE
instance Control.DeepSeq.NFData MapUpdate'FlagOp where
        rnf x__ = Prelude.seq x__ (())
{- | Fields :

    * 'Proto.Riak_Fields.user' @:: Lens' RpbAuthReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.password' @:: Lens' RpbAuthReq Data.ByteString.ByteString@
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

 -}
data RpbAuthResp = RpbAuthResp{_RpbAuthResp'_unknownFields ::
                               !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbAuthResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message RpbAuthResp where
        messageName _ = Data.Text.pack "RpbAuthResp"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbAuthResp'_unknownFields
              (\ x__ y__ -> x__{_RpbAuthResp'_unknownFields = y__})
        defMessage = RpbAuthResp{_RpbAuthResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbAuthResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbAuthResp'_unknownFields x__) (())
{- | Fields :

    * 'Proto.Riak_Fields.partition' @:: Lens' RpbBucketKeyPreflistItem Data.Int.Int64@
    * 'Proto.Riak_Fields.node' @:: Lens' RpbBucketKeyPreflistItem Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.primary' @:: Lens' RpbBucketKeyPreflistItem Prelude.Bool@
 -}
data RpbBucketKeyPreflistItem = RpbBucketKeyPreflistItem{_RpbBucketKeyPreflistItem'partition
                                                         :: !Data.Int.Int64,
                                                         _RpbBucketKeyPreflistItem'node ::
                                                         !Data.ByteString.ByteString,
                                                         _RpbBucketKeyPreflistItem'primary ::
                                                         !Prelude.Bool,
                                                         _RpbBucketKeyPreflistItem'_unknownFields ::
                                                         !Data.ProtoLens.FieldSet}
                                  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbBucketKeyPreflistItem where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbBucketKeyPreflistItem "partition"
           (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketKeyPreflistItem'partition
                 (\ x__ y__ -> x__{_RpbBucketKeyPreflistItem'partition = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketKeyPreflistItem "node"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketKeyPreflistItem'node
                 (\ x__ y__ -> x__{_RpbBucketKeyPreflistItem'node = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbBucketKeyPreflistItem "primary"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbBucketKeyPreflistItem'primary
                 (\ x__ y__ -> x__{_RpbBucketKeyPreflistItem'primary = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbBucketKeyPreflistItem where
        messageName _ = Data.Text.pack "RpbBucketKeyPreflistItem"
        fieldsByTag
          = let partition__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "partition"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "partition")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketKeyPreflistItem
                node__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "node"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "node")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketKeyPreflistItem
                primary__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "primary"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "primary")))
                      :: Data.ProtoLens.FieldDescriptor RpbBucketKeyPreflistItem
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, partition__field_descriptor),
                 (Data.ProtoLens.Tag 2, node__field_descriptor),
                 (Data.ProtoLens.Tag 3, primary__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbBucketKeyPreflistItem'_unknownFields
              (\ x__ y__ -> x__{_RpbBucketKeyPreflistItem'_unknownFields = y__})
        defMessage
          = RpbBucketKeyPreflistItem{_RpbBucketKeyPreflistItem'partition =
                                       Data.ProtoLens.fieldDefault,
                                     _RpbBucketKeyPreflistItem'node = Data.ProtoLens.fieldDefault,
                                     _RpbBucketKeyPreflistItem'primary =
                                       Data.ProtoLens.fieldDefault,
                                     _RpbBucketKeyPreflistItem'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbBucketKeyPreflistItem where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbBucketKeyPreflistItem'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbBucketKeyPreflistItem'partition x__)
                   (Control.DeepSeq.deepseq (_RpbBucketKeyPreflistItem'node x__)
                      (Control.DeepSeq.deepseq (_RpbBucketKeyPreflistItem'primary x__)
                         (()))))
{- | Fields :

    * 'Proto.Riak_Fields.nVal' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'nVal' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.allowMult' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'allowMult' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.lastWriteWins' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'lastWriteWins' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.precommit' @:: Lens' RpbBucketProps [RpbCommitHook]@
    * 'Proto.Riak_Fields.hasPrecommit' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'hasPrecommit' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.postcommit' @:: Lens' RpbBucketProps [RpbCommitHook]@
    * 'Proto.Riak_Fields.hasPostcommit' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'hasPostcommit' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.chashKeyfun' @:: Lens' RpbBucketProps RpbModFun@
    * 'Proto.Riak_Fields.maybe'chashKeyfun' @:: Lens' RpbBucketProps (Prelude.Maybe RpbModFun)@
    * 'Proto.Riak_Fields.linkfun' @:: Lens' RpbBucketProps RpbModFun@
    * 'Proto.Riak_Fields.maybe'linkfun' @:: Lens' RpbBucketProps (Prelude.Maybe RpbModFun)@
    * 'Proto.Riak_Fields.oldVclock' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'oldVclock' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.youngVclock' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'youngVclock' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.bigVclock' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'bigVclock' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.smallVclock' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'smallVclock' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.pr' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pr' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.r' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'r' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.w' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'w' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.pw' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pw' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.dw' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'dw' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.rw' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'rw' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.basicQuorum' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'basicQuorum' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.notfoundOk' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'notfoundOk' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.backend' @:: Lens' RpbBucketProps Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'backend' @:: Lens' RpbBucketProps (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.search' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'search' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.repl' @:: Lens' RpbBucketProps RpbBucketProps'RpbReplMode@
    * 'Proto.Riak_Fields.maybe'repl' @:: Lens' RpbBucketProps (Prelude.Maybe RpbBucketProps'RpbReplMode)@
    * 'Proto.Riak_Fields.searchIndex' @:: Lens' RpbBucketProps Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'searchIndex' @:: Lens' RpbBucketProps (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.datatype' @:: Lens' RpbBucketProps Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'datatype' @:: Lens' RpbBucketProps (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.consistent' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'consistent' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.writeOnce' @:: Lens' RpbBucketProps Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'writeOnce' @:: Lens' RpbBucketProps (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.hllPrecision' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'hllPrecision' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.ttl' @:: Lens' RpbBucketProps Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'ttl' @:: Lens' RpbBucketProps (Prelude.Maybe Data.Word.Word32)@
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

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbCSBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.startKey' @:: Lens' RpbCSBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.endKey' @:: Lens' RpbCSBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'endKey' @:: Lens' RpbCSBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.startIncl' @:: Lens' RpbCSBucketReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'startIncl' @:: Lens' RpbCSBucketReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.endIncl' @:: Lens' RpbCSBucketReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'endIncl' @:: Lens' RpbCSBucketReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.continuation' @:: Lens' RpbCSBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'continuation' @:: Lens' RpbCSBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.maxResults' @:: Lens' RpbCSBucketReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'maxResults' @:: Lens' RpbCSBucketReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.timeout' @:: Lens' RpbCSBucketReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' RpbCSBucketReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbCSBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbCSBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.coverContext' @:: Lens' RpbCSBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'coverContext' @:: Lens' RpbCSBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbCSBucketReq = RpbCSBucketReq{_RpbCSBucketReq'bucket ::
                                     !Data.ByteString.ByteString,
                                     _RpbCSBucketReq'startKey :: !Data.ByteString.ByteString,
                                     _RpbCSBucketReq'endKey ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbCSBucketReq'startIncl :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbCSBucketReq'endIncl :: !(Prelude.Maybe Prelude.Bool),
                                     _RpbCSBucketReq'continuation ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbCSBucketReq'maxResults ::
                                     !(Prelude.Maybe Data.Word.Word32),
                                     _RpbCSBucketReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbCSBucketReq'type' ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbCSBucketReq'coverContext ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbCSBucketReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                        deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCSBucketReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCSBucketReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'bucket
                 (\ x__ y__ -> x__{_RpbCSBucketReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketReq "startKey"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'startKey
                 (\ x__ y__ -> x__{_RpbCSBucketReq'startKey = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketReq "endKey"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'endKey
                 (\ x__ y__ -> x__{_RpbCSBucketReq'endKey = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCSBucketReq "maybe'endKey"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'endKey
                 (\ x__ y__ -> x__{_RpbCSBucketReq'endKey = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketReq "startIncl"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'startIncl
                 (\ x__ y__ -> x__{_RpbCSBucketReq'startIncl = y__}))
              (Data.ProtoLens.maybeLens Prelude.True)
instance Lens.Labels.HasLens' RpbCSBucketReq "maybe'startIncl"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'startIncl
                 (\ x__ y__ -> x__{_RpbCSBucketReq'startIncl = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketReq "endIncl"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'endIncl
                 (\ x__ y__ -> x__{_RpbCSBucketReq'endIncl = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)
instance Lens.Labels.HasLens' RpbCSBucketReq "maybe'endIncl"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'endIncl
                 (\ x__ y__ -> x__{_RpbCSBucketReq'endIncl = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketReq "continuation"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'continuation
                 (\ x__ y__ -> x__{_RpbCSBucketReq'continuation = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCSBucketReq "maybe'continuation"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'continuation
                 (\ x__ y__ -> x__{_RpbCSBucketReq'continuation = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketReq "maxResults"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'maxResults
                 (\ x__ y__ -> x__{_RpbCSBucketReq'maxResults = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCSBucketReq "maybe'maxResults"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'maxResults
                 (\ x__ y__ -> x__{_RpbCSBucketReq'maxResults = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'timeout
                 (\ x__ y__ -> x__{_RpbCSBucketReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCSBucketReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'timeout
                 (\ x__ y__ -> x__{_RpbCSBucketReq'timeout = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'type'
                 (\ x__ y__ -> x__{_RpbCSBucketReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCSBucketReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'type'
                 (\ x__ y__ -> x__{_RpbCSBucketReq'type' = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketReq "coverContext"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'coverContext
                 (\ x__ y__ -> x__{_RpbCSBucketReq'coverContext = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCSBucketReq "maybe'coverContext"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketReq'coverContext
                 (\ x__ y__ -> x__{_RpbCSBucketReq'coverContext = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCSBucketReq where
        messageName _ = Data.Text.pack "RpbCSBucketReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
                startKey__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "start_key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "startKey")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
                endKey__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "end_key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'endKey")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
                startIncl__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "start_incl"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'startIncl")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
                endIncl__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "end_incl"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'endIncl")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
                continuation__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "continuation"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'continuation")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
                maxResults__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "max_results"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'maxResults")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
                coverContext__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cover_context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'coverContext")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, startKey__field_descriptor),
                 (Data.ProtoLens.Tag 3, endKey__field_descriptor),
                 (Data.ProtoLens.Tag 4, startIncl__field_descriptor),
                 (Data.ProtoLens.Tag 5, endIncl__field_descriptor),
                 (Data.ProtoLens.Tag 6, continuation__field_descriptor),
                 (Data.ProtoLens.Tag 7, maxResults__field_descriptor),
                 (Data.ProtoLens.Tag 8, timeout__field_descriptor),
                 (Data.ProtoLens.Tag 9, type'__field_descriptor),
                 (Data.ProtoLens.Tag 10, coverContext__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCSBucketReq'_unknownFields
              (\ x__ y__ -> x__{_RpbCSBucketReq'_unknownFields = y__})
        defMessage
          = RpbCSBucketReq{_RpbCSBucketReq'bucket =
                             Data.ProtoLens.fieldDefault,
                           _RpbCSBucketReq'startKey = Data.ProtoLens.fieldDefault,
                           _RpbCSBucketReq'endKey = Prelude.Nothing,
                           _RpbCSBucketReq'startIncl = Prelude.Nothing,
                           _RpbCSBucketReq'endIncl = Prelude.Nothing,
                           _RpbCSBucketReq'continuation = Prelude.Nothing,
                           _RpbCSBucketReq'maxResults = Prelude.Nothing,
                           _RpbCSBucketReq'timeout = Prelude.Nothing,
                           _RpbCSBucketReq'type' = Prelude.Nothing,
                           _RpbCSBucketReq'coverContext = Prelude.Nothing,
                           _RpbCSBucketReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCSBucketReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCSBucketReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCSBucketReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbCSBucketReq'startKey x__)
                      (Control.DeepSeq.deepseq (_RpbCSBucketReq'endKey x__)
                         (Control.DeepSeq.deepseq (_RpbCSBucketReq'startIncl x__)
                            (Control.DeepSeq.deepseq (_RpbCSBucketReq'endIncl x__)
                               (Control.DeepSeq.deepseq (_RpbCSBucketReq'continuation x__)
                                  (Control.DeepSeq.deepseq (_RpbCSBucketReq'maxResults x__)
                                     (Control.DeepSeq.deepseq (_RpbCSBucketReq'timeout x__)
                                        (Control.DeepSeq.deepseq (_RpbCSBucketReq'type' x__)
                                           (Control.DeepSeq.deepseq
                                              (_RpbCSBucketReq'coverContext x__)
                                              (())))))))))))
{- | Fields :

    * 'Proto.Riak_Fields.objects' @:: Lens' RpbCSBucketResp [RpbIndexObject]@
    * 'Proto.Riak_Fields.continuation' @:: Lens' RpbCSBucketResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'continuation' @:: Lens' RpbCSBucketResp (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.done' @:: Lens' RpbCSBucketResp Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'done' @:: Lens' RpbCSBucketResp (Prelude.Maybe Prelude.Bool)@
 -}
data RpbCSBucketResp = RpbCSBucketResp{_RpbCSBucketResp'objects ::
                                       ![RpbIndexObject],
                                       _RpbCSBucketResp'continuation ::
                                       !(Prelude.Maybe Data.ByteString.ByteString),
                                       _RpbCSBucketResp'done :: !(Prelude.Maybe Prelude.Bool),
                                       _RpbCSBucketResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                         deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCSBucketResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCSBucketResp "objects"
           ([RpbIndexObject])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketResp'objects
                 (\ x__ y__ -> x__{_RpbCSBucketResp'objects = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketResp "continuation"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketResp'continuation
                 (\ x__ y__ -> x__{_RpbCSBucketResp'continuation = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCSBucketResp "maybe'continuation"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketResp'continuation
                 (\ x__ y__ -> x__{_RpbCSBucketResp'continuation = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCSBucketResp "done" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketResp'done
                 (\ x__ y__ -> x__{_RpbCSBucketResp'done = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCSBucketResp "maybe'done"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCSBucketResp'done
                 (\ x__ y__ -> x__{_RpbCSBucketResp'done = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCSBucketResp where
        messageName _ = Data.Text.pack "RpbCSBucketResp"
        fieldsByTag
          = let objects__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "objects"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbIndexObject)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "objects")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketResp
                continuation__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "continuation"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'continuation")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketResp
                done__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "done"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'done")))
                      :: Data.ProtoLens.FieldDescriptor RpbCSBucketResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, objects__field_descriptor),
                 (Data.ProtoLens.Tag 2, continuation__field_descriptor),
                 (Data.ProtoLens.Tag 3, done__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCSBucketResp'_unknownFields
              (\ x__ y__ -> x__{_RpbCSBucketResp'_unknownFields = y__})
        defMessage
          = RpbCSBucketResp{_RpbCSBucketResp'objects = [],
                            _RpbCSBucketResp'continuation = Prelude.Nothing,
                            _RpbCSBucketResp'done = Prelude.Nothing,
                            _RpbCSBucketResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCSBucketResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCSBucketResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCSBucketResp'objects x__)
                   (Control.DeepSeq.deepseq (_RpbCSBucketResp'continuation x__)
                      (Control.DeepSeq.deepseq (_RpbCSBucketResp'done x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.modfun' @:: Lens' RpbCommitHook RpbModFun@
    * 'Proto.Riak_Fields.maybe'modfun' @:: Lens' RpbCommitHook (Prelude.Maybe RpbModFun)@
    * 'Proto.Riak_Fields.name' @:: Lens' RpbCommitHook Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'name' @:: Lens' RpbCommitHook (Prelude.Maybe Data.ByteString.ByteString)@
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

    * 'Proto.Riak_Fields.value' @:: Lens' RpbContent Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.contentType' @:: Lens' RpbContent Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'contentType' @:: Lens' RpbContent (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.charset' @:: Lens' RpbContent Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'charset' @:: Lens' RpbContent (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.contentEncoding' @:: Lens' RpbContent Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'contentEncoding' @:: Lens' RpbContent (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.vtag' @:: Lens' RpbContent Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'vtag' @:: Lens' RpbContent (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.links' @:: Lens' RpbContent [RpbLink]@
    * 'Proto.Riak_Fields.lastMod' @:: Lens' RpbContent Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'lastMod' @:: Lens' RpbContent (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.lastModUsecs' @:: Lens' RpbContent Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'lastModUsecs' @:: Lens' RpbContent (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.usermeta' @:: Lens' RpbContent [RpbPair]@
    * 'Proto.Riak_Fields.indexes' @:: Lens' RpbContent [RpbPair]@
    * 'Proto.Riak_Fields.deleted' @:: Lens' RpbContent Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'deleted' @:: Lens' RpbContent (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.ttl' @:: Lens' RpbContent Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'ttl' @:: Lens' RpbContent (Prelude.Maybe Data.Word.Word32)@
 -}
data RpbContent = RpbContent{_RpbContent'value ::
                             !Data.ByteString.ByteString,
                             _RpbContent'contentType ::
                             !(Prelude.Maybe Data.ByteString.ByteString),
                             _RpbContent'charset :: !(Prelude.Maybe Data.ByteString.ByteString),
                             _RpbContent'contentEncoding ::
                             !(Prelude.Maybe Data.ByteString.ByteString),
                             _RpbContent'vtag :: !(Prelude.Maybe Data.ByteString.ByteString),
                             _RpbContent'links :: ![RpbLink],
                             _RpbContent'lastMod :: !(Prelude.Maybe Data.Word.Word32),
                             _RpbContent'lastModUsecs :: !(Prelude.Maybe Data.Word.Word32),
                             _RpbContent'usermeta :: ![RpbPair],
                             _RpbContent'indexes :: ![RpbPair],
                             _RpbContent'deleted :: !(Prelude.Maybe Prelude.Bool),
                             _RpbContent'ttl :: !(Prelude.Maybe Data.Word.Word32),
                             _RpbContent'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbContent where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbContent "value"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'value
                 (\ x__ y__ -> x__{_RpbContent'value = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "contentType"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'contentType
                 (\ x__ y__ -> x__{_RpbContent'contentType = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbContent "maybe'contentType"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'contentType
                 (\ x__ y__ -> x__{_RpbContent'contentType = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "charset"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'charset
                 (\ x__ y__ -> x__{_RpbContent'charset = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbContent "maybe'charset"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'charset
                 (\ x__ y__ -> x__{_RpbContent'charset = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "contentEncoding"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'contentEncoding
                 (\ x__ y__ -> x__{_RpbContent'contentEncoding = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbContent "maybe'contentEncoding"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'contentEncoding
                 (\ x__ y__ -> x__{_RpbContent'contentEncoding = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "vtag"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'vtag
                 (\ x__ y__ -> x__{_RpbContent'vtag = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbContent "maybe'vtag"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'vtag
                 (\ x__ y__ -> x__{_RpbContent'vtag = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "links" ([RpbLink]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'links
                 (\ x__ y__ -> x__{_RpbContent'links = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "lastMod"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'lastMod
                 (\ x__ y__ -> x__{_RpbContent'lastMod = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbContent "maybe'lastMod"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'lastMod
                 (\ x__ y__ -> x__{_RpbContent'lastMod = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "lastModUsecs"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'lastModUsecs
                 (\ x__ y__ -> x__{_RpbContent'lastModUsecs = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbContent "maybe'lastModUsecs"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'lastModUsecs
                 (\ x__ y__ -> x__{_RpbContent'lastModUsecs = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "usermeta" ([RpbPair])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'usermeta
                 (\ x__ y__ -> x__{_RpbContent'usermeta = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "indexes" ([RpbPair])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'indexes
                 (\ x__ y__ -> x__{_RpbContent'indexes = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "deleted" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'deleted
                 (\ x__ y__ -> x__{_RpbContent'deleted = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbContent "maybe'deleted"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'deleted
                 (\ x__ y__ -> x__{_RpbContent'deleted = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbContent "ttl" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'ttl
                 (\ x__ y__ -> x__{_RpbContent'ttl = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbContent "maybe'ttl"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbContent'ttl
                 (\ x__ y__ -> x__{_RpbContent'ttl = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbContent where
        messageName _ = Data.Text.pack "RpbContent"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "value")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                contentType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content_type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'contentType")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                charset__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "charset"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'charset")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                contentEncoding__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content_encoding"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'contentEncoding")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                vtag__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "vtag"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'vtag")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                links__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "links"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbLink)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "links")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                lastMod__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "last_mod"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'lastMod")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                lastModUsecs__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "last_mod_usecs"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'lastModUsecs")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                usermeta__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "usermeta"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbPair)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "usermeta")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                indexes__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "indexes"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbPair)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "indexes")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                deleted__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deleted"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'deleted")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
                ttl__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "ttl"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'ttl")))
                      :: Data.ProtoLens.FieldDescriptor RpbContent
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, value__field_descriptor),
                 (Data.ProtoLens.Tag 2, contentType__field_descriptor),
                 (Data.ProtoLens.Tag 3, charset__field_descriptor),
                 (Data.ProtoLens.Tag 4, contentEncoding__field_descriptor),
                 (Data.ProtoLens.Tag 5, vtag__field_descriptor),
                 (Data.ProtoLens.Tag 6, links__field_descriptor),
                 (Data.ProtoLens.Tag 7, lastMod__field_descriptor),
                 (Data.ProtoLens.Tag 8, lastModUsecs__field_descriptor),
                 (Data.ProtoLens.Tag 9, usermeta__field_descriptor),
                 (Data.ProtoLens.Tag 10, indexes__field_descriptor),
                 (Data.ProtoLens.Tag 11, deleted__field_descriptor),
                 (Data.ProtoLens.Tag 12, ttl__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbContent'_unknownFields
              (\ x__ y__ -> x__{_RpbContent'_unknownFields = y__})
        defMessage
          = RpbContent{_RpbContent'value = Data.ProtoLens.fieldDefault,
                       _RpbContent'contentType = Prelude.Nothing,
                       _RpbContent'charset = Prelude.Nothing,
                       _RpbContent'contentEncoding = Prelude.Nothing,
                       _RpbContent'vtag = Prelude.Nothing, _RpbContent'links = [],
                       _RpbContent'lastMod = Prelude.Nothing,
                       _RpbContent'lastModUsecs = Prelude.Nothing,
                       _RpbContent'usermeta = [], _RpbContent'indexes = [],
                       _RpbContent'deleted = Prelude.Nothing,
                       _RpbContent'ttl = Prelude.Nothing,
                       _RpbContent'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbContent where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbContent'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbContent'value x__)
                   (Control.DeepSeq.deepseq (_RpbContent'contentType x__)
                      (Control.DeepSeq.deepseq (_RpbContent'charset x__)
                         (Control.DeepSeq.deepseq (_RpbContent'contentEncoding x__)
                            (Control.DeepSeq.deepseq (_RpbContent'vtag x__)
                               (Control.DeepSeq.deepseq (_RpbContent'links x__)
                                  (Control.DeepSeq.deepseq (_RpbContent'lastMod x__)
                                     (Control.DeepSeq.deepseq (_RpbContent'lastModUsecs x__)
                                        (Control.DeepSeq.deepseq (_RpbContent'usermeta x__)
                                           (Control.DeepSeq.deepseq (_RpbContent'indexes x__)
                                              (Control.DeepSeq.deepseq (_RpbContent'deleted x__)
                                                 (Control.DeepSeq.deepseq (_RpbContent'ttl x__)
                                                    (())))))))))))))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbCounterGetReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' RpbCounterGetReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.r' @:: Lens' RpbCounterGetReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'r' @:: Lens' RpbCounterGetReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.pr' @:: Lens' RpbCounterGetReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pr' @:: Lens' RpbCounterGetReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.basicQuorum' @:: Lens' RpbCounterGetReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'basicQuorum' @:: Lens' RpbCounterGetReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.notfoundOk' @:: Lens' RpbCounterGetReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'notfoundOk' @:: Lens' RpbCounterGetReq (Prelude.Maybe Prelude.Bool)@
 -}
data RpbCounterGetReq = RpbCounterGetReq{_RpbCounterGetReq'bucket
                                         :: !Data.ByteString.ByteString,
                                         _RpbCounterGetReq'key :: !Data.ByteString.ByteString,
                                         _RpbCounterGetReq'r :: !(Prelude.Maybe Data.Word.Word32),
                                         _RpbCounterGetReq'pr :: !(Prelude.Maybe Data.Word.Word32),
                                         _RpbCounterGetReq'basicQuorum ::
                                         !(Prelude.Maybe Prelude.Bool),
                                         _RpbCounterGetReq'notfoundOk ::
                                         !(Prelude.Maybe Prelude.Bool),
                                         _RpbCounterGetReq'_unknownFields ::
                                         !Data.ProtoLens.FieldSet}
                          deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCounterGetReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCounterGetReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'bucket
                 (\ x__ y__ -> x__{_RpbCounterGetReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterGetReq "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'key
                 (\ x__ y__ -> x__{_RpbCounterGetReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterGetReq "r"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'r
                 (\ x__ y__ -> x__{_RpbCounterGetReq'r = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterGetReq "maybe'r"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'r
                 (\ x__ y__ -> x__{_RpbCounterGetReq'r = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterGetReq "pr"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'pr
                 (\ x__ y__ -> x__{_RpbCounterGetReq'pr = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterGetReq "maybe'pr"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'pr
                 (\ x__ y__ -> x__{_RpbCounterGetReq'pr = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterGetReq "basicQuorum"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'basicQuorum
                 (\ x__ y__ -> x__{_RpbCounterGetReq'basicQuorum = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterGetReq "maybe'basicQuorum"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'basicQuorum
                 (\ x__ y__ -> x__{_RpbCounterGetReq'basicQuorum = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterGetReq "notfoundOk"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'notfoundOk
                 (\ x__ y__ -> x__{_RpbCounterGetReq'notfoundOk = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterGetReq "maybe'notfoundOk"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetReq'notfoundOk
                 (\ x__ y__ -> x__{_RpbCounterGetReq'notfoundOk = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCounterGetReq where
        messageName _ = Data.Text.pack "RpbCounterGetReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterGetReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterGetReq
                r__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "r"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'r")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterGetReq
                pr__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pr"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pr")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterGetReq
                basicQuorum__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "basic_quorum"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'basicQuorum")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterGetReq
                notfoundOk__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "notfound_ok"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'notfoundOk")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterGetReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, r__field_descriptor),
                 (Data.ProtoLens.Tag 4, pr__field_descriptor),
                 (Data.ProtoLens.Tag 5, basicQuorum__field_descriptor),
                 (Data.ProtoLens.Tag 6, notfoundOk__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCounterGetReq'_unknownFields
              (\ x__ y__ -> x__{_RpbCounterGetReq'_unknownFields = y__})
        defMessage
          = RpbCounterGetReq{_RpbCounterGetReq'bucket =
                               Data.ProtoLens.fieldDefault,
                             _RpbCounterGetReq'key = Data.ProtoLens.fieldDefault,
                             _RpbCounterGetReq'r = Prelude.Nothing,
                             _RpbCounterGetReq'pr = Prelude.Nothing,
                             _RpbCounterGetReq'basicQuorum = Prelude.Nothing,
                             _RpbCounterGetReq'notfoundOk = Prelude.Nothing,
                             _RpbCounterGetReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCounterGetReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCounterGetReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCounterGetReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbCounterGetReq'key x__)
                      (Control.DeepSeq.deepseq (_RpbCounterGetReq'r x__)
                         (Control.DeepSeq.deepseq (_RpbCounterGetReq'pr x__)
                            (Control.DeepSeq.deepseq (_RpbCounterGetReq'basicQuorum x__)
                               (Control.DeepSeq.deepseq (_RpbCounterGetReq'notfoundOk x__)
                                  (())))))))
{- | Fields :

    * 'Proto.Riak_Fields.value' @:: Lens' RpbCounterGetResp Data.Int.Int64@
    * 'Proto.Riak_Fields.maybe'value' @:: Lens' RpbCounterGetResp (Prelude.Maybe Data.Int.Int64)@
 -}
data RpbCounterGetResp = RpbCounterGetResp{_RpbCounterGetResp'value
                                           :: !(Prelude.Maybe Data.Int.Int64),
                                           _RpbCounterGetResp'_unknownFields ::
                                           !Data.ProtoLens.FieldSet}
                           deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCounterGetResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCounterGetResp "value"
           (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetResp'value
                 (\ x__ y__ -> x__{_RpbCounterGetResp'value = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterGetResp "maybe'value"
           (Prelude.Maybe Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterGetResp'value
                 (\ x__ y__ -> x__{_RpbCounterGetResp'value = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCounterGetResp where
        messageName _ = Data.Text.pack "RpbCounterGetResp"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'value")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterGetResp
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCounterGetResp'_unknownFields
              (\ x__ y__ -> x__{_RpbCounterGetResp'_unknownFields = y__})
        defMessage
          = RpbCounterGetResp{_RpbCounterGetResp'value = Prelude.Nothing,
                              _RpbCounterGetResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCounterGetResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCounterGetResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCounterGetResp'value x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbCounterUpdateReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' RpbCounterUpdateReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.amount' @:: Lens' RpbCounterUpdateReq Data.Int.Int64@
    * 'Proto.Riak_Fields.w' @:: Lens' RpbCounterUpdateReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'w' @:: Lens' RpbCounterUpdateReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.dw' @:: Lens' RpbCounterUpdateReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'dw' @:: Lens' RpbCounterUpdateReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.pw' @:: Lens' RpbCounterUpdateReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pw' @:: Lens' RpbCounterUpdateReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.returnvalue' @:: Lens' RpbCounterUpdateReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'returnvalue' @:: Lens' RpbCounterUpdateReq (Prelude.Maybe Prelude.Bool)@
 -}
data RpbCounterUpdateReq = RpbCounterUpdateReq{_RpbCounterUpdateReq'bucket
                                               :: !Data.ByteString.ByteString,
                                               _RpbCounterUpdateReq'key ::
                                               !Data.ByteString.ByteString,
                                               _RpbCounterUpdateReq'amount :: !Data.Int.Int64,
                                               _RpbCounterUpdateReq'w ::
                                               !(Prelude.Maybe Data.Word.Word32),
                                               _RpbCounterUpdateReq'dw ::
                                               !(Prelude.Maybe Data.Word.Word32),
                                               _RpbCounterUpdateReq'pw ::
                                               !(Prelude.Maybe Data.Word.Word32),
                                               _RpbCounterUpdateReq'returnvalue ::
                                               !(Prelude.Maybe Prelude.Bool),
                                               _RpbCounterUpdateReq'_unknownFields ::
                                               !Data.ProtoLens.FieldSet}
                             deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCounterUpdateReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCounterUpdateReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'bucket
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterUpdateReq "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'key
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterUpdateReq "amount"
           (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'amount
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'amount = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterUpdateReq "w"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'w
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'w = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterUpdateReq "maybe'w"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'w
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'w = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterUpdateReq "dw"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'dw
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'dw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterUpdateReq "maybe'dw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'dw
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'dw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterUpdateReq "pw"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'pw
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'pw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterUpdateReq "maybe'pw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'pw
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'pw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCounterUpdateReq "returnvalue"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'returnvalue
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'returnvalue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterUpdateReq
           "maybe'returnvalue"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'returnvalue
                 (\ x__ y__ -> x__{_RpbCounterUpdateReq'returnvalue = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCounterUpdateReq where
        messageName _ = Data.Text.pack "RpbCounterUpdateReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterUpdateReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterUpdateReq
                amount__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "amount"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "amount")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterUpdateReq
                w__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "w"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'w")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterUpdateReq
                dw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "dw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'dw")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterUpdateReq
                pw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pw")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterUpdateReq
                returnvalue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "returnvalue"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'returnvalue")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterUpdateReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, amount__field_descriptor),
                 (Data.ProtoLens.Tag 4, w__field_descriptor),
                 (Data.ProtoLens.Tag 5, dw__field_descriptor),
                 (Data.ProtoLens.Tag 6, pw__field_descriptor),
                 (Data.ProtoLens.Tag 7, returnvalue__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCounterUpdateReq'_unknownFields
              (\ x__ y__ -> x__{_RpbCounterUpdateReq'_unknownFields = y__})
        defMessage
          = RpbCounterUpdateReq{_RpbCounterUpdateReq'bucket =
                                  Data.ProtoLens.fieldDefault,
                                _RpbCounterUpdateReq'key = Data.ProtoLens.fieldDefault,
                                _RpbCounterUpdateReq'amount = Data.ProtoLens.fieldDefault,
                                _RpbCounterUpdateReq'w = Prelude.Nothing,
                                _RpbCounterUpdateReq'dw = Prelude.Nothing,
                                _RpbCounterUpdateReq'pw = Prelude.Nothing,
                                _RpbCounterUpdateReq'returnvalue = Prelude.Nothing,
                                _RpbCounterUpdateReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCounterUpdateReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCounterUpdateReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCounterUpdateReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbCounterUpdateReq'key x__)
                      (Control.DeepSeq.deepseq (_RpbCounterUpdateReq'amount x__)
                         (Control.DeepSeq.deepseq (_RpbCounterUpdateReq'w x__)
                            (Control.DeepSeq.deepseq (_RpbCounterUpdateReq'dw x__)
                               (Control.DeepSeq.deepseq (_RpbCounterUpdateReq'pw x__)
                                  (Control.DeepSeq.deepseq (_RpbCounterUpdateReq'returnvalue x__)
                                     (()))))))))
{- | Fields :

    * 'Proto.Riak_Fields.value' @:: Lens' RpbCounterUpdateResp Data.Int.Int64@
    * 'Proto.Riak_Fields.maybe'value' @:: Lens' RpbCounterUpdateResp (Prelude.Maybe Data.Int.Int64)@
 -}
data RpbCounterUpdateResp = RpbCounterUpdateResp{_RpbCounterUpdateResp'value
                                                 :: !(Prelude.Maybe Data.Int.Int64),
                                                 _RpbCounterUpdateResp'_unknownFields ::
                                                 !Data.ProtoLens.FieldSet}
                              deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCounterUpdateResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCounterUpdateResp "value"
           (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateResp'value
                 (\ x__ y__ -> x__{_RpbCounterUpdateResp'value = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCounterUpdateResp "maybe'value"
           (Prelude.Maybe Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCounterUpdateResp'value
                 (\ x__ y__ -> x__{_RpbCounterUpdateResp'value = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCounterUpdateResp where
        messageName _ = Data.Text.pack "RpbCounterUpdateResp"
        fieldsByTag
          = let value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'value")))
                      :: Data.ProtoLens.FieldDescriptor RpbCounterUpdateResp
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCounterUpdateResp'_unknownFields
              (\ x__ y__ -> x__{_RpbCounterUpdateResp'_unknownFields = y__})
        defMessage
          = RpbCounterUpdateResp{_RpbCounterUpdateResp'value =
                                   Prelude.Nothing,
                                 _RpbCounterUpdateResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCounterUpdateResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCounterUpdateResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCounterUpdateResp'value x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.ip' @:: Lens' RpbCoverageEntry Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.port' @:: Lens' RpbCoverageEntry Data.Word.Word32@
    * 'Proto.Riak_Fields.keyspaceDesc' @:: Lens' RpbCoverageEntry Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'keyspaceDesc' @:: Lens' RpbCoverageEntry (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.coverContext' @:: Lens' RpbCoverageEntry Data.ByteString.ByteString@
 -}
data RpbCoverageEntry = RpbCoverageEntry{_RpbCoverageEntry'ip ::
                                         !Data.ByteString.ByteString,
                                         _RpbCoverageEntry'port :: !Data.Word.Word32,
                                         _RpbCoverageEntry'keyspaceDesc ::
                                         !(Prelude.Maybe Data.ByteString.ByteString),
                                         _RpbCoverageEntry'coverContext ::
                                         !Data.ByteString.ByteString,
                                         _RpbCoverageEntry'_unknownFields ::
                                         !Data.ProtoLens.FieldSet}
                          deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCoverageEntry where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCoverageEntry "ip"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageEntry'ip
                 (\ x__ y__ -> x__{_RpbCoverageEntry'ip = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCoverageEntry "port"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageEntry'port
                 (\ x__ y__ -> x__{_RpbCoverageEntry'port = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCoverageEntry "keyspaceDesc"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageEntry'keyspaceDesc
                 (\ x__ y__ -> x__{_RpbCoverageEntry'keyspaceDesc = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCoverageEntry "maybe'keyspaceDesc"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageEntry'keyspaceDesc
                 (\ x__ y__ -> x__{_RpbCoverageEntry'keyspaceDesc = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCoverageEntry "coverContext"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageEntry'coverContext
                 (\ x__ y__ -> x__{_RpbCoverageEntry'coverContext = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCoverageEntry where
        messageName _ = Data.Text.pack "RpbCoverageEntry"
        fieldsByTag
          = let ip__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "ip"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ip")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageEntry
                port__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "port"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "port")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageEntry
                keyspaceDesc__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "keyspace_desc"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'keyspaceDesc")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageEntry
                coverContext__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cover_context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "coverContext")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageEntry
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, ip__field_descriptor),
                 (Data.ProtoLens.Tag 2, port__field_descriptor),
                 (Data.ProtoLens.Tag 3, keyspaceDesc__field_descriptor),
                 (Data.ProtoLens.Tag 4, coverContext__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCoverageEntry'_unknownFields
              (\ x__ y__ -> x__{_RpbCoverageEntry'_unknownFields = y__})
        defMessage
          = RpbCoverageEntry{_RpbCoverageEntry'ip =
                               Data.ProtoLens.fieldDefault,
                             _RpbCoverageEntry'port = Data.ProtoLens.fieldDefault,
                             _RpbCoverageEntry'keyspaceDesc = Prelude.Nothing,
                             _RpbCoverageEntry'coverContext = Data.ProtoLens.fieldDefault,
                             _RpbCoverageEntry'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCoverageEntry where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCoverageEntry'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCoverageEntry'ip x__)
                   (Control.DeepSeq.deepseq (_RpbCoverageEntry'port x__)
                      (Control.DeepSeq.deepseq (_RpbCoverageEntry'keyspaceDesc x__)
                         (Control.DeepSeq.deepseq (_RpbCoverageEntry'coverContext x__)
                            (())))))
{- | Fields :

    * 'Proto.Riak_Fields.type'' @:: Lens' RpbCoverageReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbCoverageReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbCoverageReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.minPartitions' @:: Lens' RpbCoverageReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'minPartitions' @:: Lens' RpbCoverageReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.replaceCover' @:: Lens' RpbCoverageReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'replaceCover' @:: Lens' RpbCoverageReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.unavailableCover' @:: Lens' RpbCoverageReq [Data.ByteString.ByteString]@
 -}
data RpbCoverageReq = RpbCoverageReq{_RpbCoverageReq'type' ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbCoverageReq'bucket :: !Data.ByteString.ByteString,
                                     _RpbCoverageReq'minPartitions ::
                                     !(Prelude.Maybe Data.Word.Word32),
                                     _RpbCoverageReq'replaceCover ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbCoverageReq'unavailableCover ::
                                     ![Data.ByteString.ByteString],
                                     _RpbCoverageReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                        deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCoverageReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCoverageReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageReq'type'
                 (\ x__ y__ -> x__{_RpbCoverageReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCoverageReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageReq'type'
                 (\ x__ y__ -> x__{_RpbCoverageReq'type' = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCoverageReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageReq'bucket
                 (\ x__ y__ -> x__{_RpbCoverageReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCoverageReq "minPartitions"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageReq'minPartitions
                 (\ x__ y__ -> x__{_RpbCoverageReq'minPartitions = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCoverageReq "maybe'minPartitions"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageReq'minPartitions
                 (\ x__ y__ -> x__{_RpbCoverageReq'minPartitions = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCoverageReq "replaceCover"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageReq'replaceCover
                 (\ x__ y__ -> x__{_RpbCoverageReq'replaceCover = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbCoverageReq "maybe'replaceCover"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageReq'replaceCover
                 (\ x__ y__ -> x__{_RpbCoverageReq'replaceCover = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbCoverageReq "unavailableCover"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageReq'unavailableCover
                 (\ x__ y__ -> x__{_RpbCoverageReq'unavailableCover = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCoverageReq where
        messageName _ = Data.Text.pack "RpbCoverageReq"
        fieldsByTag
          = let type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageReq
                bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageReq
                minPartitions__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "min_partitions"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'minPartitions")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageReq
                replaceCover__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "replace_cover"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'replaceCover")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageReq
                unavailableCover__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "unavailable_cover"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "unavailableCover")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, type'__field_descriptor),
                 (Data.ProtoLens.Tag 2, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 3, minPartitions__field_descriptor),
                 (Data.ProtoLens.Tag 4, replaceCover__field_descriptor),
                 (Data.ProtoLens.Tag 5, unavailableCover__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCoverageReq'_unknownFields
              (\ x__ y__ -> x__{_RpbCoverageReq'_unknownFields = y__})
        defMessage
          = RpbCoverageReq{_RpbCoverageReq'type' = Prelude.Nothing,
                           _RpbCoverageReq'bucket = Data.ProtoLens.fieldDefault,
                           _RpbCoverageReq'minPartitions = Prelude.Nothing,
                           _RpbCoverageReq'replaceCover = Prelude.Nothing,
                           _RpbCoverageReq'unavailableCover = [],
                           _RpbCoverageReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCoverageReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCoverageReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCoverageReq'type' x__)
                   (Control.DeepSeq.deepseq (_RpbCoverageReq'bucket x__)
                      (Control.DeepSeq.deepseq (_RpbCoverageReq'minPartitions x__)
                         (Control.DeepSeq.deepseq (_RpbCoverageReq'replaceCover x__)
                            (Control.DeepSeq.deepseq (_RpbCoverageReq'unavailableCover x__)
                               (()))))))
{- | Fields :

    * 'Proto.Riak_Fields.entries' @:: Lens' RpbCoverageResp [RpbCoverageEntry]@
 -}
data RpbCoverageResp = RpbCoverageResp{_RpbCoverageResp'entries ::
                                       ![RpbCoverageEntry],
                                       _RpbCoverageResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                         deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbCoverageResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbCoverageResp "entries"
           ([RpbCoverageEntry])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbCoverageResp'entries
                 (\ x__ y__ -> x__{_RpbCoverageResp'entries = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbCoverageResp where
        messageName _ = Data.Text.pack "RpbCoverageResp"
        fieldsByTag
          = let entries__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "entries"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbCoverageEntry)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "entries")))
                      :: Data.ProtoLens.FieldDescriptor RpbCoverageResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, entries__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbCoverageResp'_unknownFields
              (\ x__ y__ -> x__{_RpbCoverageResp'_unknownFields = y__})
        defMessage
          = RpbCoverageResp{_RpbCoverageResp'entries = [],
                            _RpbCoverageResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbCoverageResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbCoverageResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbCoverageResp'entries x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbDelReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' RpbDelReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.rw' @:: Lens' RpbDelReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'rw' @:: Lens' RpbDelReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.vclock' @:: Lens' RpbDelReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'vclock' @:: Lens' RpbDelReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.r' @:: Lens' RpbDelReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'r' @:: Lens' RpbDelReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.w' @:: Lens' RpbDelReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'w' @:: Lens' RpbDelReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.pr' @:: Lens' RpbDelReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pr' @:: Lens' RpbDelReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.pw' @:: Lens' RpbDelReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pw' @:: Lens' RpbDelReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.dw' @:: Lens' RpbDelReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'dw' @:: Lens' RpbDelReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.timeout' @:: Lens' RpbDelReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' RpbDelReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.sloppyQuorum' @:: Lens' RpbDelReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'sloppyQuorum' @:: Lens' RpbDelReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.nVal' @:: Lens' RpbDelReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'nVal' @:: Lens' RpbDelReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbDelReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbDelReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbDelReq = RpbDelReq{_RpbDelReq'bucket ::
                           !Data.ByteString.ByteString,
                           _RpbDelReq'key :: !Data.ByteString.ByteString,
                           _RpbDelReq'rw :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbDelReq'vclock :: !(Prelude.Maybe Data.ByteString.ByteString),
                           _RpbDelReq'r :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbDelReq'w :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbDelReq'pr :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbDelReq'pw :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbDelReq'dw :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbDelReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbDelReq'sloppyQuorum :: !(Prelude.Maybe Prelude.Bool),
                           _RpbDelReq'nVal :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbDelReq'type' :: !(Prelude.Maybe Data.ByteString.ByteString),
                           _RpbDelReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbDelReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbDelReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'bucket
                 (\ x__ y__ -> x__{_RpbDelReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'key
                 (\ x__ y__ -> x__{_RpbDelReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "rw" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'rw
                 (\ x__ y__ -> x__{_RpbDelReq'rw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'rw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'rw
                 (\ x__ y__ -> x__{_RpbDelReq'rw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "vclock"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'vclock
                 (\ x__ y__ -> x__{_RpbDelReq'vclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'vclock"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'vclock
                 (\ x__ y__ -> x__{_RpbDelReq'vclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "r" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'r
                 (\ x__ y__ -> x__{_RpbDelReq'r = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'r"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'r
                 (\ x__ y__ -> x__{_RpbDelReq'r = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "w" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'w
                 (\ x__ y__ -> x__{_RpbDelReq'w = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'w"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'w
                 (\ x__ y__ -> x__{_RpbDelReq'w = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "pr" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'pr
                 (\ x__ y__ -> x__{_RpbDelReq'pr = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'pr"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'pr
                 (\ x__ y__ -> x__{_RpbDelReq'pr = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "pw" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'pw
                 (\ x__ y__ -> x__{_RpbDelReq'pw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'pw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'pw
                 (\ x__ y__ -> x__{_RpbDelReq'pw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "dw" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'dw
                 (\ x__ y__ -> x__{_RpbDelReq'dw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'dw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'dw
                 (\ x__ y__ -> x__{_RpbDelReq'dw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'timeout
                 (\ x__ y__ -> x__{_RpbDelReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'timeout
                 (\ x__ y__ -> x__{_RpbDelReq'timeout = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "sloppyQuorum"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'sloppyQuorum
                 (\ x__ y__ -> x__{_RpbDelReq'sloppyQuorum = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'sloppyQuorum"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'sloppyQuorum
                 (\ x__ y__ -> x__{_RpbDelReq'sloppyQuorum = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "nVal" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'nVal
                 (\ x__ y__ -> x__{_RpbDelReq'nVal = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'nVal"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'nVal
                 (\ x__ y__ -> x__{_RpbDelReq'nVal = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbDelReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'type'
                 (\ x__ y__ -> x__{_RpbDelReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbDelReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbDelReq'type'
                 (\ x__ y__ -> x__{_RpbDelReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbDelReq where
        messageName _ = Data.Text.pack "RpbDelReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                rw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "rw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rw")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                vclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "vclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'vclock")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                r__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "r"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'r")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                w__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "w"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'w")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                pr__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pr"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pr")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                pw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pw")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                dw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "dw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'dw")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                sloppyQuorum__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "sloppy_quorum"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'sloppyQuorum")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                nVal__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "n_val"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'nVal")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbDelReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, rw__field_descriptor),
                 (Data.ProtoLens.Tag 4, vclock__field_descriptor),
                 (Data.ProtoLens.Tag 5, r__field_descriptor),
                 (Data.ProtoLens.Tag 6, w__field_descriptor),
                 (Data.ProtoLens.Tag 7, pr__field_descriptor),
                 (Data.ProtoLens.Tag 8, pw__field_descriptor),
                 (Data.ProtoLens.Tag 9, dw__field_descriptor),
                 (Data.ProtoLens.Tag 10, timeout__field_descriptor),
                 (Data.ProtoLens.Tag 11, sloppyQuorum__field_descriptor),
                 (Data.ProtoLens.Tag 12, nVal__field_descriptor),
                 (Data.ProtoLens.Tag 13, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbDelReq'_unknownFields
              (\ x__ y__ -> x__{_RpbDelReq'_unknownFields = y__})
        defMessage
          = RpbDelReq{_RpbDelReq'bucket = Data.ProtoLens.fieldDefault,
                      _RpbDelReq'key = Data.ProtoLens.fieldDefault,
                      _RpbDelReq'rw = Prelude.Nothing,
                      _RpbDelReq'vclock = Prelude.Nothing,
                      _RpbDelReq'r = Prelude.Nothing, _RpbDelReq'w = Prelude.Nothing,
                      _RpbDelReq'pr = Prelude.Nothing, _RpbDelReq'pw = Prelude.Nothing,
                      _RpbDelReq'dw = Prelude.Nothing,
                      _RpbDelReq'timeout = Prelude.Nothing,
                      _RpbDelReq'sloppyQuorum = Prelude.Nothing,
                      _RpbDelReq'nVal = Prelude.Nothing,
                      _RpbDelReq'type' = Prelude.Nothing,
                      _RpbDelReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbDelReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbDelReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbDelReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbDelReq'key x__)
                      (Control.DeepSeq.deepseq (_RpbDelReq'rw x__)
                         (Control.DeepSeq.deepseq (_RpbDelReq'vclock x__)
                            (Control.DeepSeq.deepseq (_RpbDelReq'r x__)
                               (Control.DeepSeq.deepseq (_RpbDelReq'w x__)
                                  (Control.DeepSeq.deepseq (_RpbDelReq'pr x__)
                                     (Control.DeepSeq.deepseq (_RpbDelReq'pw x__)
                                        (Control.DeepSeq.deepseq (_RpbDelReq'dw x__)
                                           (Control.DeepSeq.deepseq (_RpbDelReq'timeout x__)
                                              (Control.DeepSeq.deepseq (_RpbDelReq'sloppyQuorum x__)
                                                 (Control.DeepSeq.deepseq (_RpbDelReq'nVal x__)
                                                    (Control.DeepSeq.deepseq (_RpbDelReq'type' x__)
                                                       (()))))))))))))))
{- | Fields :

 -}
data RpbDelResp = RpbDelResp{_RpbDelResp'_unknownFields ::
                             !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbDelResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message RpbDelResp where
        messageName _ = Data.Text.pack "RpbDelResp"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbDelResp'_unknownFields
              (\ x__ y__ -> x__{_RpbDelResp'_unknownFields = y__})
        defMessage = RpbDelResp{_RpbDelResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbDelResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbDelResp'_unknownFields x__) (())
{- | Fields :

    * 'Proto.Riak_Fields.errmsg' @:: Lens' RpbErrorResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.errcode' @:: Lens' RpbErrorResp Data.Word.Word32@
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

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbGetBucketKeyPreflistReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' RpbGetBucketKeyPreflistReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbGetBucketKeyPreflistReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbGetBucketKeyPreflistReq
  (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbGetBucketKeyPreflistReq = RpbGetBucketKeyPreflistReq{_RpbGetBucketKeyPreflistReq'bucket
                                                             :: !Data.ByteString.ByteString,
                                                             _RpbGetBucketKeyPreflistReq'key ::
                                                             !Data.ByteString.ByteString,
                                                             _RpbGetBucketKeyPreflistReq'type' ::
                                                             !(Prelude.Maybe
                                                                 Data.ByteString.ByteString),
                                                             _RpbGetBucketKeyPreflistReq'_unknownFields
                                                             :: !Data.ProtoLens.FieldSet}
                                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetBucketKeyPreflistReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbGetBucketKeyPreflistReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketKeyPreflistReq'bucket
                 (\ x__ y__ -> x__{_RpbGetBucketKeyPreflistReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetBucketKeyPreflistReq "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketKeyPreflistReq'key
                 (\ x__ y__ -> x__{_RpbGetBucketKeyPreflistReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetBucketKeyPreflistReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketKeyPreflistReq'type'
                 (\ x__ y__ -> x__{_RpbGetBucketKeyPreflistReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetBucketKeyPreflistReq
           "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketKeyPreflistReq'type'
                 (\ x__ y__ -> x__{_RpbGetBucketKeyPreflistReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbGetBucketKeyPreflistReq where
        messageName _ = Data.Text.pack "RpbGetBucketKeyPreflistReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetBucketKeyPreflistReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetBucketKeyPreflistReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetBucketKeyPreflistReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbGetBucketKeyPreflistReq'_unknownFields
              (\ x__ y__ ->
                 x__{_RpbGetBucketKeyPreflistReq'_unknownFields = y__})
        defMessage
          = RpbGetBucketKeyPreflistReq{_RpbGetBucketKeyPreflistReq'bucket =
                                         Data.ProtoLens.fieldDefault,
                                       _RpbGetBucketKeyPreflistReq'key =
                                         Data.ProtoLens.fieldDefault,
                                       _RpbGetBucketKeyPreflistReq'type' = Prelude.Nothing,
                                       _RpbGetBucketKeyPreflistReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetBucketKeyPreflistReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbGetBucketKeyPreflistReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbGetBucketKeyPreflistReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbGetBucketKeyPreflistReq'key x__)
                      (Control.DeepSeq.deepseq (_RpbGetBucketKeyPreflistReq'type' x__)
                         (()))))
{- | Fields :

    * 'Proto.Riak_Fields.preflist' @:: Lens' RpbGetBucketKeyPreflistResp [RpbBucketKeyPreflistItem]@
 -}
data RpbGetBucketKeyPreflistResp = RpbGetBucketKeyPreflistResp{_RpbGetBucketKeyPreflistResp'preflist
                                                               :: ![RpbBucketKeyPreflistItem],
                                                               _RpbGetBucketKeyPreflistResp'_unknownFields
                                                               :: !Data.ProtoLens.FieldSet}
                                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetBucketKeyPreflistResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbGetBucketKeyPreflistResp
           "preflist"
           ([RpbBucketKeyPreflistItem])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetBucketKeyPreflistResp'preflist
                 (\ x__ y__ -> x__{_RpbGetBucketKeyPreflistResp'preflist = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbGetBucketKeyPreflistResp where
        messageName _ = Data.Text.pack "RpbGetBucketKeyPreflistResp"
        fieldsByTag
          = let preflist__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "preflist"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbBucketKeyPreflistItem)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "preflist")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetBucketKeyPreflistResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, preflist__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbGetBucketKeyPreflistResp'_unknownFields
              (\ x__ y__ ->
                 x__{_RpbGetBucketKeyPreflistResp'_unknownFields = y__})
        defMessage
          = RpbGetBucketKeyPreflistResp{_RpbGetBucketKeyPreflistResp'preflist
                                          = [],
                                        _RpbGetBucketKeyPreflistResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetBucketKeyPreflistResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbGetBucketKeyPreflistResp'_unknownFields x__)
                (Control.DeepSeq.deepseq
                   (_RpbGetBucketKeyPreflistResp'preflist x__)
                   (()))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbGetBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbGetBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbGetBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
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

    * 'Proto.Riak_Fields.props' @:: Lens' RpbGetBucketResp RpbBucketProps@
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

    * 'Proto.Riak_Fields.type'' @:: Lens' RpbGetBucketTypeReq Data.ByteString.ByteString@
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

 -}
data RpbGetClientIdReq = RpbGetClientIdReq{_RpbGetClientIdReq'_unknownFields
                                           :: !Data.ProtoLens.FieldSet}
                           deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetClientIdReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message RpbGetClientIdReq where
        messageName _ = Data.Text.pack "RpbGetClientIdReq"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbGetClientIdReq'_unknownFields
              (\ x__ y__ -> x__{_RpbGetClientIdReq'_unknownFields = y__})
        defMessage
          = RpbGetClientIdReq{_RpbGetClientIdReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetClientIdReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbGetClientIdReq'_unknownFields x__)
                (())
{- | Fields :

    * 'Proto.Riak_Fields.clientId' @:: Lens' RpbGetClientIdResp Data.ByteString.ByteString@
 -}
data RpbGetClientIdResp = RpbGetClientIdResp{_RpbGetClientIdResp'clientId
                                             :: !Data.ByteString.ByteString,
                                             _RpbGetClientIdResp'_unknownFields ::
                                             !Data.ProtoLens.FieldSet}
                            deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetClientIdResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbGetClientIdResp "clientId"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetClientIdResp'clientId
                 (\ x__ y__ -> x__{_RpbGetClientIdResp'clientId = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbGetClientIdResp where
        messageName _ = Data.Text.pack "RpbGetClientIdResp"
        fieldsByTag
          = let clientId__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "client_id"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "clientId")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetClientIdResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, clientId__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbGetClientIdResp'_unknownFields
              (\ x__ y__ -> x__{_RpbGetClientIdResp'_unknownFields = y__})
        defMessage
          = RpbGetClientIdResp{_RpbGetClientIdResp'clientId =
                                 Data.ProtoLens.fieldDefault,
                               _RpbGetClientIdResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetClientIdResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbGetClientIdResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbGetClientIdResp'clientId x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbGetReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' RpbGetReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.r' @:: Lens' RpbGetReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'r' @:: Lens' RpbGetReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.pr' @:: Lens' RpbGetReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pr' @:: Lens' RpbGetReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.basicQuorum' @:: Lens' RpbGetReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'basicQuorum' @:: Lens' RpbGetReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.notfoundOk' @:: Lens' RpbGetReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'notfoundOk' @:: Lens' RpbGetReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.ifModified' @:: Lens' RpbGetReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'ifModified' @:: Lens' RpbGetReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.head' @:: Lens' RpbGetReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'head' @:: Lens' RpbGetReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.deletedvclock' @:: Lens' RpbGetReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'deletedvclock' @:: Lens' RpbGetReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.timeout' @:: Lens' RpbGetReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' RpbGetReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.sloppyQuorum' @:: Lens' RpbGetReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'sloppyQuorum' @:: Lens' RpbGetReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.nVal' @:: Lens' RpbGetReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'nVal' @:: Lens' RpbGetReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbGetReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbGetReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbGetReq = RpbGetReq{_RpbGetReq'bucket ::
                           !Data.ByteString.ByteString,
                           _RpbGetReq'key :: !Data.ByteString.ByteString,
                           _RpbGetReq'r :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbGetReq'pr :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbGetReq'basicQuorum :: !(Prelude.Maybe Prelude.Bool),
                           _RpbGetReq'notfoundOk :: !(Prelude.Maybe Prelude.Bool),
                           _RpbGetReq'ifModified ::
                           !(Prelude.Maybe Data.ByteString.ByteString),
                           _RpbGetReq'head :: !(Prelude.Maybe Prelude.Bool),
                           _RpbGetReq'deletedvclock :: !(Prelude.Maybe Prelude.Bool),
                           _RpbGetReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbGetReq'sloppyQuorum :: !(Prelude.Maybe Prelude.Bool),
                           _RpbGetReq'nVal :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbGetReq'type' :: !(Prelude.Maybe Data.ByteString.ByteString),
                           _RpbGetReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbGetReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'bucket
                 (\ x__ y__ -> x__{_RpbGetReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'key
                 (\ x__ y__ -> x__{_RpbGetReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "r" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'r
                 (\ x__ y__ -> x__{_RpbGetReq'r = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'r"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'r
                 (\ x__ y__ -> x__{_RpbGetReq'r = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "pr" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'pr
                 (\ x__ y__ -> x__{_RpbGetReq'pr = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'pr"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'pr
                 (\ x__ y__ -> x__{_RpbGetReq'pr = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "basicQuorum"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'basicQuorum
                 (\ x__ y__ -> x__{_RpbGetReq'basicQuorum = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'basicQuorum"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'basicQuorum
                 (\ x__ y__ -> x__{_RpbGetReq'basicQuorum = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "notfoundOk" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'notfoundOk
                 (\ x__ y__ -> x__{_RpbGetReq'notfoundOk = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'notfoundOk"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'notfoundOk
                 (\ x__ y__ -> x__{_RpbGetReq'notfoundOk = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "ifModified"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'ifModified
                 (\ x__ y__ -> x__{_RpbGetReq'ifModified = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'ifModified"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'ifModified
                 (\ x__ y__ -> x__{_RpbGetReq'ifModified = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "head" (Prelude.Bool) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'head
                 (\ x__ y__ -> x__{_RpbGetReq'head = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'head"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'head
                 (\ x__ y__ -> x__{_RpbGetReq'head = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "deletedvclock"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'deletedvclock
                 (\ x__ y__ -> x__{_RpbGetReq'deletedvclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'deletedvclock"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'deletedvclock
                 (\ x__ y__ -> x__{_RpbGetReq'deletedvclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'timeout
                 (\ x__ y__ -> x__{_RpbGetReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'timeout
                 (\ x__ y__ -> x__{_RpbGetReq'timeout = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "sloppyQuorum"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'sloppyQuorum
                 (\ x__ y__ -> x__{_RpbGetReq'sloppyQuorum = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'sloppyQuorum"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'sloppyQuorum
                 (\ x__ y__ -> x__{_RpbGetReq'sloppyQuorum = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "nVal" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'nVal
                 (\ x__ y__ -> x__{_RpbGetReq'nVal = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'nVal"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'nVal
                 (\ x__ y__ -> x__{_RpbGetReq'nVal = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'type'
                 (\ x__ y__ -> x__{_RpbGetReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetReq'type'
                 (\ x__ y__ -> x__{_RpbGetReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbGetReq where
        messageName _ = Data.Text.pack "RpbGetReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                r__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "r"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'r")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                pr__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pr"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pr")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                basicQuorum__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "basic_quorum"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'basicQuorum")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                notfoundOk__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "notfound_ok"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'notfoundOk")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                ifModified__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "if_modified"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'ifModified")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                head__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "head"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'head")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                deletedvclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deletedvclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'deletedvclock")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                sloppyQuorum__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "sloppy_quorum"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'sloppyQuorum")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                nVal__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "n_val"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'nVal")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, r__field_descriptor),
                 (Data.ProtoLens.Tag 4, pr__field_descriptor),
                 (Data.ProtoLens.Tag 5, basicQuorum__field_descriptor),
                 (Data.ProtoLens.Tag 6, notfoundOk__field_descriptor),
                 (Data.ProtoLens.Tag 7, ifModified__field_descriptor),
                 (Data.ProtoLens.Tag 8, head__field_descriptor),
                 (Data.ProtoLens.Tag 9, deletedvclock__field_descriptor),
                 (Data.ProtoLens.Tag 10, timeout__field_descriptor),
                 (Data.ProtoLens.Tag 11, sloppyQuorum__field_descriptor),
                 (Data.ProtoLens.Tag 12, nVal__field_descriptor),
                 (Data.ProtoLens.Tag 13, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbGetReq'_unknownFields
              (\ x__ y__ -> x__{_RpbGetReq'_unknownFields = y__})
        defMessage
          = RpbGetReq{_RpbGetReq'bucket = Data.ProtoLens.fieldDefault,
                      _RpbGetReq'key = Data.ProtoLens.fieldDefault,
                      _RpbGetReq'r = Prelude.Nothing, _RpbGetReq'pr = Prelude.Nothing,
                      _RpbGetReq'basicQuorum = Prelude.Nothing,
                      _RpbGetReq'notfoundOk = Prelude.Nothing,
                      _RpbGetReq'ifModified = Prelude.Nothing,
                      _RpbGetReq'head = Prelude.Nothing,
                      _RpbGetReq'deletedvclock = Prelude.Nothing,
                      _RpbGetReq'timeout = Prelude.Nothing,
                      _RpbGetReq'sloppyQuorum = Prelude.Nothing,
                      _RpbGetReq'nVal = Prelude.Nothing,
                      _RpbGetReq'type' = Prelude.Nothing,
                      _RpbGetReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbGetReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbGetReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbGetReq'key x__)
                      (Control.DeepSeq.deepseq (_RpbGetReq'r x__)
                         (Control.DeepSeq.deepseq (_RpbGetReq'pr x__)
                            (Control.DeepSeq.deepseq (_RpbGetReq'basicQuorum x__)
                               (Control.DeepSeq.deepseq (_RpbGetReq'notfoundOk x__)
                                  (Control.DeepSeq.deepseq (_RpbGetReq'ifModified x__)
                                     (Control.DeepSeq.deepseq (_RpbGetReq'head x__)
                                        (Control.DeepSeq.deepseq (_RpbGetReq'deletedvclock x__)
                                           (Control.DeepSeq.deepseq (_RpbGetReq'timeout x__)
                                              (Control.DeepSeq.deepseq (_RpbGetReq'sloppyQuorum x__)
                                                 (Control.DeepSeq.deepseq (_RpbGetReq'nVal x__)
                                                    (Control.DeepSeq.deepseq (_RpbGetReq'type' x__)
                                                       (()))))))))))))))
{- | Fields :

    * 'Proto.Riak_Fields.content' @:: Lens' RpbGetResp [RpbContent]@
    * 'Proto.Riak_Fields.vclock' @:: Lens' RpbGetResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'vclock' @:: Lens' RpbGetResp (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.unchanged' @:: Lens' RpbGetResp Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'unchanged' @:: Lens' RpbGetResp (Prelude.Maybe Prelude.Bool)@
 -}
data RpbGetResp = RpbGetResp{_RpbGetResp'content :: ![RpbContent],
                             _RpbGetResp'vclock :: !(Prelude.Maybe Data.ByteString.ByteString),
                             _RpbGetResp'unchanged :: !(Prelude.Maybe Prelude.Bool),
                             _RpbGetResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbGetResp "content" ([RpbContent])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetResp'content
                 (\ x__ y__ -> x__{_RpbGetResp'content = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetResp "vclock"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetResp'vclock
                 (\ x__ y__ -> x__{_RpbGetResp'vclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetResp "maybe'vclock"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetResp'vclock
                 (\ x__ y__ -> x__{_RpbGetResp'vclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbGetResp "unchanged" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetResp'unchanged
                 (\ x__ y__ -> x__{_RpbGetResp'unchanged = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbGetResp "maybe'unchanged"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbGetResp'unchanged
                 (\ x__ y__ -> x__{_RpbGetResp'unchanged = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbGetResp where
        messageName _ = Data.Text.pack "RpbGetResp"
        fieldsByTag
          = let content__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbContent)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "content")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetResp
                vclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "vclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'vclock")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetResp
                unchanged__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "unchanged"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'unchanged")))
                      :: Data.ProtoLens.FieldDescriptor RpbGetResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, content__field_descriptor),
                 (Data.ProtoLens.Tag 2, vclock__field_descriptor),
                 (Data.ProtoLens.Tag 3, unchanged__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbGetResp'_unknownFields
              (\ x__ y__ -> x__{_RpbGetResp'_unknownFields = y__})
        defMessage
          = RpbGetResp{_RpbGetResp'content = [],
                       _RpbGetResp'vclock = Prelude.Nothing,
                       _RpbGetResp'unchanged = Prelude.Nothing,
                       _RpbGetResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbGetResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbGetResp'content x__)
                   (Control.DeepSeq.deepseq (_RpbGetResp'vclock x__)
                      (Control.DeepSeq.deepseq (_RpbGetResp'unchanged x__) (()))))
{- | Fields :

 -}
data RpbGetServerInfoReq = RpbGetServerInfoReq{_RpbGetServerInfoReq'_unknownFields
                                               :: !Data.ProtoLens.FieldSet}
                             deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbGetServerInfoReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message RpbGetServerInfoReq where
        messageName _ = Data.Text.pack "RpbGetServerInfoReq"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbGetServerInfoReq'_unknownFields
              (\ x__ y__ -> x__{_RpbGetServerInfoReq'_unknownFields = y__})
        defMessage
          = RpbGetServerInfoReq{_RpbGetServerInfoReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbGetServerInfoReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbGetServerInfoReq'_unknownFields x__)
                (())
{- | Fields :

    * 'Proto.Riak_Fields.node' @:: Lens' RpbGetServerInfoResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'node' @:: Lens' RpbGetServerInfoResp
  (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.serverVersion' @:: Lens' RpbGetServerInfoResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'serverVersion' @:: Lens' RpbGetServerInfoResp
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

    * 'Proto.Riak_Fields.objects' @:: Lens' RpbIndexBodyResp [RpbIndexObject]@
    * 'Proto.Riak_Fields.continuation' @:: Lens' RpbIndexBodyResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'continuation' @:: Lens' RpbIndexBodyResp (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.done' @:: Lens' RpbIndexBodyResp Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'done' @:: Lens' RpbIndexBodyResp (Prelude.Maybe Prelude.Bool)@
 -}
data RpbIndexBodyResp = RpbIndexBodyResp{_RpbIndexBodyResp'objects
                                         :: ![RpbIndexObject],
                                         _RpbIndexBodyResp'continuation ::
                                         !(Prelude.Maybe Data.ByteString.ByteString),
                                         _RpbIndexBodyResp'done :: !(Prelude.Maybe Prelude.Bool),
                                         _RpbIndexBodyResp'_unknownFields ::
                                         !Data.ProtoLens.FieldSet}
                          deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbIndexBodyResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbIndexBodyResp "objects"
           ([RpbIndexObject])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexBodyResp'objects
                 (\ x__ y__ -> x__{_RpbIndexBodyResp'objects = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexBodyResp "continuation"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexBodyResp'continuation
                 (\ x__ y__ -> x__{_RpbIndexBodyResp'continuation = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexBodyResp "maybe'continuation"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexBodyResp'continuation
                 (\ x__ y__ -> x__{_RpbIndexBodyResp'continuation = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexBodyResp "done"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexBodyResp'done
                 (\ x__ y__ -> x__{_RpbIndexBodyResp'done = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexBodyResp "maybe'done"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexBodyResp'done
                 (\ x__ y__ -> x__{_RpbIndexBodyResp'done = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbIndexBodyResp where
        messageName _ = Data.Text.pack "RpbIndexBodyResp"
        fieldsByTag
          = let objects__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "objects"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbIndexObject)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "objects")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexBodyResp
                continuation__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "continuation"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'continuation")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexBodyResp
                done__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "done"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'done")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexBodyResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, objects__field_descriptor),
                 (Data.ProtoLens.Tag 2, continuation__field_descriptor),
                 (Data.ProtoLens.Tag 3, done__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbIndexBodyResp'_unknownFields
              (\ x__ y__ -> x__{_RpbIndexBodyResp'_unknownFields = y__})
        defMessage
          = RpbIndexBodyResp{_RpbIndexBodyResp'objects = [],
                             _RpbIndexBodyResp'continuation = Prelude.Nothing,
                             _RpbIndexBodyResp'done = Prelude.Nothing,
                             _RpbIndexBodyResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbIndexBodyResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbIndexBodyResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbIndexBodyResp'objects x__)
                   (Control.DeepSeq.deepseq (_RpbIndexBodyResp'continuation x__)
                      (Control.DeepSeq.deepseq (_RpbIndexBodyResp'done x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.key' @:: Lens' RpbIndexObject Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.object' @:: Lens' RpbIndexObject RpbGetResp@
 -}
data RpbIndexObject = RpbIndexObject{_RpbIndexObject'key ::
                                     !Data.ByteString.ByteString,
                                     _RpbIndexObject'object :: !RpbGetResp,
                                     _RpbIndexObject'_unknownFields :: !Data.ProtoLens.FieldSet}
                        deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbIndexObject where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbIndexObject "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexObject'key
                 (\ x__ y__ -> x__{_RpbIndexObject'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexObject "object" (RpbGetResp)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexObject'object
                 (\ x__ y__ -> x__{_RpbIndexObject'object = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbIndexObject where
        messageName _ = Data.Text.pack "RpbIndexObject"
        fieldsByTag
          = let key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexObject
                object__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "object"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbGetResp)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "object")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexObject
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, key__field_descriptor),
                 (Data.ProtoLens.Tag 2, object__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbIndexObject'_unknownFields
              (\ x__ y__ -> x__{_RpbIndexObject'_unknownFields = y__})
        defMessage
          = RpbIndexObject{_RpbIndexObject'key = Data.ProtoLens.fieldDefault,
                           _RpbIndexObject'object = Data.ProtoLens.defMessage,
                           _RpbIndexObject'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbIndexObject where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbIndexObject'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbIndexObject'key x__)
                   (Control.DeepSeq.deepseq (_RpbIndexObject'object x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbIndexReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.index' @:: Lens' RpbIndexReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.qtype' @:: Lens' RpbIndexReq RpbIndexReq'IndexQueryType@
    * 'Proto.Riak_Fields.key' @:: Lens' RpbIndexReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'key' @:: Lens' RpbIndexReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.rangeMin' @:: Lens' RpbIndexReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'rangeMin' @:: Lens' RpbIndexReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.rangeMax' @:: Lens' RpbIndexReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'rangeMax' @:: Lens' RpbIndexReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.returnTerms' @:: Lens' RpbIndexReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'returnTerms' @:: Lens' RpbIndexReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.stream' @:: Lens' RpbIndexReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'stream' @:: Lens' RpbIndexReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.maxResults' @:: Lens' RpbIndexReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'maxResults' @:: Lens' RpbIndexReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.continuation' @:: Lens' RpbIndexReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'continuation' @:: Lens' RpbIndexReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.timeout' @:: Lens' RpbIndexReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' RpbIndexReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbIndexReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbIndexReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.termRegex' @:: Lens' RpbIndexReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'termRegex' @:: Lens' RpbIndexReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.paginationSort' @:: Lens' RpbIndexReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'paginationSort' @:: Lens' RpbIndexReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.coverContext' @:: Lens' RpbIndexReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'coverContext' @:: Lens' RpbIndexReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.returnBody' @:: Lens' RpbIndexReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'returnBody' @:: Lens' RpbIndexReq (Prelude.Maybe Prelude.Bool)@
 -}
data RpbIndexReq = RpbIndexReq{_RpbIndexReq'bucket ::
                               !Data.ByteString.ByteString,
                               _RpbIndexReq'index :: !Data.ByteString.ByteString,
                               _RpbIndexReq'qtype :: !RpbIndexReq'IndexQueryType,
                               _RpbIndexReq'key :: !(Prelude.Maybe Data.ByteString.ByteString),
                               _RpbIndexReq'rangeMin ::
                               !(Prelude.Maybe Data.ByteString.ByteString),
                               _RpbIndexReq'rangeMax ::
                               !(Prelude.Maybe Data.ByteString.ByteString),
                               _RpbIndexReq'returnTerms :: !(Prelude.Maybe Prelude.Bool),
                               _RpbIndexReq'stream :: !(Prelude.Maybe Prelude.Bool),
                               _RpbIndexReq'maxResults :: !(Prelude.Maybe Data.Word.Word32),
                               _RpbIndexReq'continuation ::
                               !(Prelude.Maybe Data.ByteString.ByteString),
                               _RpbIndexReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                               _RpbIndexReq'type' :: !(Prelude.Maybe Data.ByteString.ByteString),
                               _RpbIndexReq'termRegex ::
                               !(Prelude.Maybe Data.ByteString.ByteString),
                               _RpbIndexReq'paginationSort :: !(Prelude.Maybe Prelude.Bool),
                               _RpbIndexReq'coverContext ::
                               !(Prelude.Maybe Data.ByteString.ByteString),
                               _RpbIndexReq'returnBody :: !(Prelude.Maybe Prelude.Bool),
                               _RpbIndexReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbIndexReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbIndexReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'bucket
                 (\ x__ y__ -> x__{_RpbIndexReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "index"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'index
                 (\ x__ y__ -> x__{_RpbIndexReq'index = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "qtype"
           (RpbIndexReq'IndexQueryType)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'qtype
                 (\ x__ y__ -> x__{_RpbIndexReq'qtype = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'key
                 (\ x__ y__ -> x__{_RpbIndexReq'key = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'key"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'key
                 (\ x__ y__ -> x__{_RpbIndexReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "rangeMin"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'rangeMin
                 (\ x__ y__ -> x__{_RpbIndexReq'rangeMin = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'rangeMin"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'rangeMin
                 (\ x__ y__ -> x__{_RpbIndexReq'rangeMin = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "rangeMax"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'rangeMax
                 (\ x__ y__ -> x__{_RpbIndexReq'rangeMax = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'rangeMax"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'rangeMax
                 (\ x__ y__ -> x__{_RpbIndexReq'rangeMax = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "returnTerms"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'returnTerms
                 (\ x__ y__ -> x__{_RpbIndexReq'returnTerms = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'returnTerms"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'returnTerms
                 (\ x__ y__ -> x__{_RpbIndexReq'returnTerms = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "stream" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'stream
                 (\ x__ y__ -> x__{_RpbIndexReq'stream = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'stream"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'stream
                 (\ x__ y__ -> x__{_RpbIndexReq'stream = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "maxResults"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'maxResults
                 (\ x__ y__ -> x__{_RpbIndexReq'maxResults = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'maxResults"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'maxResults
                 (\ x__ y__ -> x__{_RpbIndexReq'maxResults = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "continuation"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'continuation
                 (\ x__ y__ -> x__{_RpbIndexReq'continuation = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'continuation"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'continuation
                 (\ x__ y__ -> x__{_RpbIndexReq'continuation = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'timeout
                 (\ x__ y__ -> x__{_RpbIndexReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'timeout
                 (\ x__ y__ -> x__{_RpbIndexReq'timeout = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'type'
                 (\ x__ y__ -> x__{_RpbIndexReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'type'
                 (\ x__ y__ -> x__{_RpbIndexReq'type' = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "termRegex"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'termRegex
                 (\ x__ y__ -> x__{_RpbIndexReq'termRegex = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'termRegex"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'termRegex
                 (\ x__ y__ -> x__{_RpbIndexReq'termRegex = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "paginationSort"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'paginationSort
                 (\ x__ y__ -> x__{_RpbIndexReq'paginationSort = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'paginationSort"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'paginationSort
                 (\ x__ y__ -> x__{_RpbIndexReq'paginationSort = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "coverContext"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'coverContext
                 (\ x__ y__ -> x__{_RpbIndexReq'coverContext = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'coverContext"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'coverContext
                 (\ x__ y__ -> x__{_RpbIndexReq'coverContext = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexReq "returnBody"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'returnBody
                 (\ x__ y__ -> x__{_RpbIndexReq'returnBody = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexReq "maybe'returnBody"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexReq'returnBody
                 (\ x__ y__ -> x__{_RpbIndexReq'returnBody = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbIndexReq where
        messageName _ = Data.Text.pack "RpbIndexReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                index__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "index"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "index")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                qtype__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "qtype"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor RpbIndexReq'IndexQueryType)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "qtype")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'key")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                rangeMin__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "range_min"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rangeMin")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                rangeMax__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "range_max"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rangeMax")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                returnTerms__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "return_terms"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'returnTerms")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                stream__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "stream"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'stream")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                maxResults__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "max_results"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'maxResults")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                continuation__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "continuation"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'continuation")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                termRegex__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "term_regex"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'termRegex")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                paginationSort__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pagination_sort"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'paginationSort")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                coverContext__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cover_context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'coverContext")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
                returnBody__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "return_body"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'returnBody")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, index__field_descriptor),
                 (Data.ProtoLens.Tag 3, qtype__field_descriptor),
                 (Data.ProtoLens.Tag 4, key__field_descriptor),
                 (Data.ProtoLens.Tag 5, rangeMin__field_descriptor),
                 (Data.ProtoLens.Tag 6, rangeMax__field_descriptor),
                 (Data.ProtoLens.Tag 7, returnTerms__field_descriptor),
                 (Data.ProtoLens.Tag 8, stream__field_descriptor),
                 (Data.ProtoLens.Tag 9, maxResults__field_descriptor),
                 (Data.ProtoLens.Tag 10, continuation__field_descriptor),
                 (Data.ProtoLens.Tag 11, timeout__field_descriptor),
                 (Data.ProtoLens.Tag 12, type'__field_descriptor),
                 (Data.ProtoLens.Tag 13, termRegex__field_descriptor),
                 (Data.ProtoLens.Tag 14, paginationSort__field_descriptor),
                 (Data.ProtoLens.Tag 15, coverContext__field_descriptor),
                 (Data.ProtoLens.Tag 16, returnBody__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbIndexReq'_unknownFields
              (\ x__ y__ -> x__{_RpbIndexReq'_unknownFields = y__})
        defMessage
          = RpbIndexReq{_RpbIndexReq'bucket = Data.ProtoLens.fieldDefault,
                        _RpbIndexReq'index = Data.ProtoLens.fieldDefault,
                        _RpbIndexReq'qtype = Data.ProtoLens.fieldDefault,
                        _RpbIndexReq'key = Prelude.Nothing,
                        _RpbIndexReq'rangeMin = Prelude.Nothing,
                        _RpbIndexReq'rangeMax = Prelude.Nothing,
                        _RpbIndexReq'returnTerms = Prelude.Nothing,
                        _RpbIndexReq'stream = Prelude.Nothing,
                        _RpbIndexReq'maxResults = Prelude.Nothing,
                        _RpbIndexReq'continuation = Prelude.Nothing,
                        _RpbIndexReq'timeout = Prelude.Nothing,
                        _RpbIndexReq'type' = Prelude.Nothing,
                        _RpbIndexReq'termRegex = Prelude.Nothing,
                        _RpbIndexReq'paginationSort = Prelude.Nothing,
                        _RpbIndexReq'coverContext = Prelude.Nothing,
                        _RpbIndexReq'returnBody = Prelude.Nothing,
                        _RpbIndexReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbIndexReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbIndexReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbIndexReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbIndexReq'index x__)
                      (Control.DeepSeq.deepseq (_RpbIndexReq'qtype x__)
                         (Control.DeepSeq.deepseq (_RpbIndexReq'key x__)
                            (Control.DeepSeq.deepseq (_RpbIndexReq'rangeMin x__)
                               (Control.DeepSeq.deepseq (_RpbIndexReq'rangeMax x__)
                                  (Control.DeepSeq.deepseq (_RpbIndexReq'returnTerms x__)
                                     (Control.DeepSeq.deepseq (_RpbIndexReq'stream x__)
                                        (Control.DeepSeq.deepseq (_RpbIndexReq'maxResults x__)
                                           (Control.DeepSeq.deepseq (_RpbIndexReq'continuation x__)
                                              (Control.DeepSeq.deepseq (_RpbIndexReq'timeout x__)
                                                 (Control.DeepSeq.deepseq (_RpbIndexReq'type' x__)
                                                    (Control.DeepSeq.deepseq
                                                       (_RpbIndexReq'termRegex x__)
                                                       (Control.DeepSeq.deepseq
                                                          (_RpbIndexReq'paginationSort x__)
                                                          (Control.DeepSeq.deepseq
                                                             (_RpbIndexReq'coverContext x__)
                                                             (Control.DeepSeq.deepseq
                                                                (_RpbIndexReq'returnBody x__)
                                                                (())))))))))))))))))
data RpbIndexReq'IndexQueryType = RpbIndexReq'eq
                                | RpbIndexReq'range
                                    deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.FieldDefault RpbIndexReq'IndexQueryType
         where
        fieldDefault = RpbIndexReq'eq
instance Data.ProtoLens.MessageEnum RpbIndexReq'IndexQueryType
         where
        maybeToEnum 0 = Prelude.Just RpbIndexReq'eq
        maybeToEnum 1 = Prelude.Just RpbIndexReq'range
        maybeToEnum _ = Prelude.Nothing
        showEnum RpbIndexReq'eq = "eq"
        showEnum RpbIndexReq'range = "range"
        readEnum "eq" = Prelude.Just RpbIndexReq'eq
        readEnum "range" = Prelude.Just RpbIndexReq'range
        readEnum _ = Prelude.Nothing
instance Prelude.Enum RpbIndexReq'IndexQueryType where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum IndexQueryType: "
                    (Prelude.show k__)))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum RpbIndexReq'eq = 0
        fromEnum RpbIndexReq'range = 1
        succ RpbIndexReq'range
          = Prelude.error
              "RpbIndexReq'IndexQueryType.succ: bad argument RpbIndexReq'range. This value would be out of bounds."
        succ RpbIndexReq'eq = RpbIndexReq'range
        pred RpbIndexReq'eq
          = Prelude.error
              "RpbIndexReq'IndexQueryType.pred: bad argument RpbIndexReq'eq. This value would be out of bounds."
        pred RpbIndexReq'range = RpbIndexReq'eq
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Prelude.Bounded RpbIndexReq'IndexQueryType where
        minBound = RpbIndexReq'eq
        maxBound = RpbIndexReq'range
instance Control.DeepSeq.NFData RpbIndexReq'IndexQueryType where
        rnf x__ = Prelude.seq x__ (())
{- | Fields :

    * 'Proto.Riak_Fields.keys' @:: Lens' RpbIndexResp [Data.ByteString.ByteString]@
    * 'Proto.Riak_Fields.results' @:: Lens' RpbIndexResp [RpbPair]@
    * 'Proto.Riak_Fields.continuation' @:: Lens' RpbIndexResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'continuation' @:: Lens' RpbIndexResp (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.done' @:: Lens' RpbIndexResp Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'done' @:: Lens' RpbIndexResp (Prelude.Maybe Prelude.Bool)@
 -}
data RpbIndexResp = RpbIndexResp{_RpbIndexResp'keys ::
                                 ![Data.ByteString.ByteString],
                                 _RpbIndexResp'results :: ![RpbPair],
                                 _RpbIndexResp'continuation ::
                                 !(Prelude.Maybe Data.ByteString.ByteString),
                                 _RpbIndexResp'done :: !(Prelude.Maybe Prelude.Bool),
                                 _RpbIndexResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                      deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbIndexResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbIndexResp "keys"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexResp'keys
                 (\ x__ y__ -> x__{_RpbIndexResp'keys = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexResp "results" ([RpbPair])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexResp'results
                 (\ x__ y__ -> x__{_RpbIndexResp'results = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexResp "continuation"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexResp'continuation
                 (\ x__ y__ -> x__{_RpbIndexResp'continuation = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexResp "maybe'continuation"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexResp'continuation
                 (\ x__ y__ -> x__{_RpbIndexResp'continuation = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbIndexResp "done" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexResp'done
                 (\ x__ y__ -> x__{_RpbIndexResp'done = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbIndexResp "maybe'done"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbIndexResp'done
                 (\ x__ y__ -> x__{_RpbIndexResp'done = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbIndexResp where
        messageName _ = Data.Text.pack "RpbIndexResp"
        fieldsByTag
          = let keys__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "keys"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "keys")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexResp
                results__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "results"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbPair)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "results")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexResp
                continuation__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "continuation"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'continuation")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexResp
                done__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "done"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'done")))
                      :: Data.ProtoLens.FieldDescriptor RpbIndexResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, keys__field_descriptor),
                 (Data.ProtoLens.Tag 2, results__field_descriptor),
                 (Data.ProtoLens.Tag 3, continuation__field_descriptor),
                 (Data.ProtoLens.Tag 4, done__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbIndexResp'_unknownFields
              (\ x__ y__ -> x__{_RpbIndexResp'_unknownFields = y__})
        defMessage
          = RpbIndexResp{_RpbIndexResp'keys = [], _RpbIndexResp'results = [],
                         _RpbIndexResp'continuation = Prelude.Nothing,
                         _RpbIndexResp'done = Prelude.Nothing,
                         _RpbIndexResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbIndexResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbIndexResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbIndexResp'keys x__)
                   (Control.DeepSeq.deepseq (_RpbIndexResp'results x__)
                      (Control.DeepSeq.deepseq (_RpbIndexResp'continuation x__)
                         (Control.DeepSeq.deepseq (_RpbIndexResp'done x__) (())))))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbLink Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'bucket' @:: Lens' RpbLink (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.key' @:: Lens' RpbLink Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'key' @:: Lens' RpbLink (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.tag' @:: Lens' RpbLink Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'tag' @:: Lens' RpbLink (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbLink = RpbLink{_RpbLink'bucket ::
                       !(Prelude.Maybe Data.ByteString.ByteString),
                       _RpbLink'key :: !(Prelude.Maybe Data.ByteString.ByteString),
                       _RpbLink'tag :: !(Prelude.Maybe Data.ByteString.ByteString),
                       _RpbLink'_unknownFields :: !Data.ProtoLens.FieldSet}
                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbLink where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbLink "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbLink'bucket
                 (\ x__ y__ -> x__{_RpbLink'bucket = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbLink "maybe'bucket"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbLink'bucket
                 (\ x__ y__ -> x__{_RpbLink'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbLink "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbLink'key
                 (\ x__ y__ -> x__{_RpbLink'key = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbLink "maybe'key"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbLink'key
                 (\ x__ y__ -> x__{_RpbLink'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbLink "tag"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbLink'tag
                 (\ x__ y__ -> x__{_RpbLink'tag = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbLink "maybe'tag"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbLink'tag
                 (\ x__ y__ -> x__{_RpbLink'tag = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbLink where
        messageName _ = Data.Text.pack "RpbLink"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbLink
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'key")))
                      :: Data.ProtoLens.FieldDescriptor RpbLink
                tag__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "tag"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'tag")))
                      :: Data.ProtoLens.FieldDescriptor RpbLink
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, tag__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbLink'_unknownFields
              (\ x__ y__ -> x__{_RpbLink'_unknownFields = y__})
        defMessage
          = RpbLink{_RpbLink'bucket = Prelude.Nothing,
                    _RpbLink'key = Prelude.Nothing, _RpbLink'tag = Prelude.Nothing,
                    _RpbLink'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbLink where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbLink'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbLink'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbLink'key x__)
                      (Control.DeepSeq.deepseq (_RpbLink'tag x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.timeout' @:: Lens' RpbListBucketsReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' RpbListBucketsReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.stream' @:: Lens' RpbListBucketsReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'stream' @:: Lens' RpbListBucketsReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbListBucketsReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbListBucketsReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbListBucketsReq = RpbListBucketsReq{_RpbListBucketsReq'timeout
                                           :: !(Prelude.Maybe Data.Word.Word32),
                                           _RpbListBucketsReq'stream ::
                                           !(Prelude.Maybe Prelude.Bool),
                                           _RpbListBucketsReq'type' ::
                                           !(Prelude.Maybe Data.ByteString.ByteString),
                                           _RpbListBucketsReq'_unknownFields ::
                                           !Data.ProtoLens.FieldSet}
                           deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbListBucketsReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbListBucketsReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListBucketsReq'timeout
                 (\ x__ y__ -> x__{_RpbListBucketsReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbListBucketsReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListBucketsReq'timeout
                 (\ x__ y__ -> x__{_RpbListBucketsReq'timeout = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbListBucketsReq "stream"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListBucketsReq'stream
                 (\ x__ y__ -> x__{_RpbListBucketsReq'stream = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbListBucketsReq "maybe'stream"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListBucketsReq'stream
                 (\ x__ y__ -> x__{_RpbListBucketsReq'stream = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbListBucketsReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListBucketsReq'type'
                 (\ x__ y__ -> x__{_RpbListBucketsReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbListBucketsReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListBucketsReq'type'
                 (\ x__ y__ -> x__{_RpbListBucketsReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbListBucketsReq where
        messageName _ = Data.Text.pack "RpbListBucketsReq"
        fieldsByTag
          = let timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor RpbListBucketsReq
                stream__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "stream"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'stream")))
                      :: Data.ProtoLens.FieldDescriptor RpbListBucketsReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbListBucketsReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, timeout__field_descriptor),
                 (Data.ProtoLens.Tag 2, stream__field_descriptor),
                 (Data.ProtoLens.Tag 3, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbListBucketsReq'_unknownFields
              (\ x__ y__ -> x__{_RpbListBucketsReq'_unknownFields = y__})
        defMessage
          = RpbListBucketsReq{_RpbListBucketsReq'timeout = Prelude.Nothing,
                              _RpbListBucketsReq'stream = Prelude.Nothing,
                              _RpbListBucketsReq'type' = Prelude.Nothing,
                              _RpbListBucketsReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbListBucketsReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbListBucketsReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbListBucketsReq'timeout x__)
                   (Control.DeepSeq.deepseq (_RpbListBucketsReq'stream x__)
                      (Control.DeepSeq.deepseq (_RpbListBucketsReq'type' x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.buckets' @:: Lens' RpbListBucketsResp [Data.ByteString.ByteString]@
    * 'Proto.Riak_Fields.done' @:: Lens' RpbListBucketsResp Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'done' @:: Lens' RpbListBucketsResp (Prelude.Maybe Prelude.Bool)@
 -}
data RpbListBucketsResp = RpbListBucketsResp{_RpbListBucketsResp'buckets
                                             :: ![Data.ByteString.ByteString],
                                             _RpbListBucketsResp'done ::
                                             !(Prelude.Maybe Prelude.Bool),
                                             _RpbListBucketsResp'_unknownFields ::
                                             !Data.ProtoLens.FieldSet}
                            deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbListBucketsResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbListBucketsResp "buckets"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListBucketsResp'buckets
                 (\ x__ y__ -> x__{_RpbListBucketsResp'buckets = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbListBucketsResp "done"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListBucketsResp'done
                 (\ x__ y__ -> x__{_RpbListBucketsResp'done = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbListBucketsResp "maybe'done"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListBucketsResp'done
                 (\ x__ y__ -> x__{_RpbListBucketsResp'done = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbListBucketsResp where
        messageName _ = Data.Text.pack "RpbListBucketsResp"
        fieldsByTag
          = let buckets__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "buckets"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "buckets")))
                      :: Data.ProtoLens.FieldDescriptor RpbListBucketsResp
                done__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "done"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'done")))
                      :: Data.ProtoLens.FieldDescriptor RpbListBucketsResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, buckets__field_descriptor),
                 (Data.ProtoLens.Tag 2, done__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbListBucketsResp'_unknownFields
              (\ x__ y__ -> x__{_RpbListBucketsResp'_unknownFields = y__})
        defMessage
          = RpbListBucketsResp{_RpbListBucketsResp'buckets = [],
                               _RpbListBucketsResp'done = Prelude.Nothing,
                               _RpbListBucketsResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbListBucketsResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbListBucketsResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbListBucketsResp'buckets x__)
                   (Control.DeepSeq.deepseq (_RpbListBucketsResp'done x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbListKeysReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.timeout' @:: Lens' RpbListKeysReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' RpbListKeysReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbListKeysReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbListKeysReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbListKeysReq = RpbListKeysReq{_RpbListKeysReq'bucket ::
                                     !Data.ByteString.ByteString,
                                     _RpbListKeysReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                                     _RpbListKeysReq'type' ::
                                     !(Prelude.Maybe Data.ByteString.ByteString),
                                     _RpbListKeysReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                        deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbListKeysReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbListKeysReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListKeysReq'bucket
                 (\ x__ y__ -> x__{_RpbListKeysReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbListKeysReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListKeysReq'timeout
                 (\ x__ y__ -> x__{_RpbListKeysReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbListKeysReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListKeysReq'timeout
                 (\ x__ y__ -> x__{_RpbListKeysReq'timeout = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbListKeysReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListKeysReq'type'
                 (\ x__ y__ -> x__{_RpbListKeysReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbListKeysReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListKeysReq'type'
                 (\ x__ y__ -> x__{_RpbListKeysReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbListKeysReq where
        messageName _ = Data.Text.pack "RpbListKeysReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbListKeysReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor RpbListKeysReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbListKeysReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, timeout__field_descriptor),
                 (Data.ProtoLens.Tag 3, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbListKeysReq'_unknownFields
              (\ x__ y__ -> x__{_RpbListKeysReq'_unknownFields = y__})
        defMessage
          = RpbListKeysReq{_RpbListKeysReq'bucket =
                             Data.ProtoLens.fieldDefault,
                           _RpbListKeysReq'timeout = Prelude.Nothing,
                           _RpbListKeysReq'type' = Prelude.Nothing,
                           _RpbListKeysReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbListKeysReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbListKeysReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbListKeysReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbListKeysReq'timeout x__)
                      (Control.DeepSeq.deepseq (_RpbListKeysReq'type' x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.keys' @:: Lens' RpbListKeysResp [Data.ByteString.ByteString]@
    * 'Proto.Riak_Fields.done' @:: Lens' RpbListKeysResp Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'done' @:: Lens' RpbListKeysResp (Prelude.Maybe Prelude.Bool)@
 -}
data RpbListKeysResp = RpbListKeysResp{_RpbListKeysResp'keys ::
                                       ![Data.ByteString.ByteString],
                                       _RpbListKeysResp'done :: !(Prelude.Maybe Prelude.Bool),
                                       _RpbListKeysResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                         deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbListKeysResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbListKeysResp "keys"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListKeysResp'keys
                 (\ x__ y__ -> x__{_RpbListKeysResp'keys = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbListKeysResp "done" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListKeysResp'done
                 (\ x__ y__ -> x__{_RpbListKeysResp'done = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbListKeysResp "maybe'done"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbListKeysResp'done
                 (\ x__ y__ -> x__{_RpbListKeysResp'done = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbListKeysResp where
        messageName _ = Data.Text.pack "RpbListKeysResp"
        fieldsByTag
          = let keys__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "keys"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "keys")))
                      :: Data.ProtoLens.FieldDescriptor RpbListKeysResp
                done__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "done"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'done")))
                      :: Data.ProtoLens.FieldDescriptor RpbListKeysResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, keys__field_descriptor),
                 (Data.ProtoLens.Tag 2, done__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbListKeysResp'_unknownFields
              (\ x__ y__ -> x__{_RpbListKeysResp'_unknownFields = y__})
        defMessage
          = RpbListKeysResp{_RpbListKeysResp'keys = [],
                            _RpbListKeysResp'done = Prelude.Nothing,
                            _RpbListKeysResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbListKeysResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbListKeysResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbListKeysResp'keys x__)
                   (Control.DeepSeq.deepseq (_RpbListKeysResp'done x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.request' @:: Lens' RpbMapRedReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.contentType' @:: Lens' RpbMapRedReq Data.ByteString.ByteString@
 -}
data RpbMapRedReq = RpbMapRedReq{_RpbMapRedReq'request ::
                                 !Data.ByteString.ByteString,
                                 _RpbMapRedReq'contentType :: !Data.ByteString.ByteString,
                                 _RpbMapRedReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                      deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbMapRedReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbMapRedReq "request"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbMapRedReq'request
                 (\ x__ y__ -> x__{_RpbMapRedReq'request = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbMapRedReq "contentType"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbMapRedReq'contentType
                 (\ x__ y__ -> x__{_RpbMapRedReq'contentType = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbMapRedReq where
        messageName _ = Data.Text.pack "RpbMapRedReq"
        fieldsByTag
          = let request__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "request"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "request")))
                      :: Data.ProtoLens.FieldDescriptor RpbMapRedReq
                contentType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content_type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "contentType")))
                      :: Data.ProtoLens.FieldDescriptor RpbMapRedReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, request__field_descriptor),
                 (Data.ProtoLens.Tag 2, contentType__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbMapRedReq'_unknownFields
              (\ x__ y__ -> x__{_RpbMapRedReq'_unknownFields = y__})
        defMessage
          = RpbMapRedReq{_RpbMapRedReq'request = Data.ProtoLens.fieldDefault,
                         _RpbMapRedReq'contentType = Data.ProtoLens.fieldDefault,
                         _RpbMapRedReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbMapRedReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbMapRedReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbMapRedReq'request x__)
                   (Control.DeepSeq.deepseq (_RpbMapRedReq'contentType x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.phase' @:: Lens' RpbMapRedResp Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'phase' @:: Lens' RpbMapRedResp (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.response' @:: Lens' RpbMapRedResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'response' @:: Lens' RpbMapRedResp (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.done' @:: Lens' RpbMapRedResp Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'done' @:: Lens' RpbMapRedResp (Prelude.Maybe Prelude.Bool)@
 -}
data RpbMapRedResp = RpbMapRedResp{_RpbMapRedResp'phase ::
                                   !(Prelude.Maybe Data.Word.Word32),
                                   _RpbMapRedResp'response ::
                                   !(Prelude.Maybe Data.ByteString.ByteString),
                                   _RpbMapRedResp'done :: !(Prelude.Maybe Prelude.Bool),
                                   _RpbMapRedResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                       deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbMapRedResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbMapRedResp "phase"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbMapRedResp'phase
                 (\ x__ y__ -> x__{_RpbMapRedResp'phase = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbMapRedResp "maybe'phase"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbMapRedResp'phase
                 (\ x__ y__ -> x__{_RpbMapRedResp'phase = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbMapRedResp "response"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbMapRedResp'response
                 (\ x__ y__ -> x__{_RpbMapRedResp'response = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbMapRedResp "maybe'response"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbMapRedResp'response
                 (\ x__ y__ -> x__{_RpbMapRedResp'response = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbMapRedResp "done" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbMapRedResp'done
                 (\ x__ y__ -> x__{_RpbMapRedResp'done = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbMapRedResp "maybe'done"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbMapRedResp'done
                 (\ x__ y__ -> x__{_RpbMapRedResp'done = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbMapRedResp where
        messageName _ = Data.Text.pack "RpbMapRedResp"
        fieldsByTag
          = let phase__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "phase"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'phase")))
                      :: Data.ProtoLens.FieldDescriptor RpbMapRedResp
                response__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "response"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'response")))
                      :: Data.ProtoLens.FieldDescriptor RpbMapRedResp
                done__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "done"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'done")))
                      :: Data.ProtoLens.FieldDescriptor RpbMapRedResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, phase__field_descriptor),
                 (Data.ProtoLens.Tag 2, response__field_descriptor),
                 (Data.ProtoLens.Tag 3, done__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbMapRedResp'_unknownFields
              (\ x__ y__ -> x__{_RpbMapRedResp'_unknownFields = y__})
        defMessage
          = RpbMapRedResp{_RpbMapRedResp'phase = Prelude.Nothing,
                          _RpbMapRedResp'response = Prelude.Nothing,
                          _RpbMapRedResp'done = Prelude.Nothing,
                          _RpbMapRedResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbMapRedResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbMapRedResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbMapRedResp'phase x__)
                   (Control.DeepSeq.deepseq (_RpbMapRedResp'response x__)
                      (Control.DeepSeq.deepseq (_RpbMapRedResp'done x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.module'' @:: Lens' RpbModFun Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.function' @:: Lens' RpbModFun Data.ByteString.ByteString@
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

    * 'Proto.Riak_Fields.key' @:: Lens' RpbPair Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.value' @:: Lens' RpbPair Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'value' @:: Lens' RpbPair (Prelude.Maybe Data.ByteString.ByteString)@
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

 -}
data RpbPingReq = RpbPingReq{_RpbPingReq'_unknownFields ::
                             !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbPingReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message RpbPingReq where
        messageName _ = Data.Text.pack "RpbPingReq"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbPingReq'_unknownFields
              (\ x__ y__ -> x__{_RpbPingReq'_unknownFields = y__})
        defMessage = RpbPingReq{_RpbPingReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbPingReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbPingReq'_unknownFields x__) (())
{- | Fields :

 -}
data RpbPingResp = RpbPingResp{_RpbPingResp'_unknownFields ::
                               !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbPingResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message RpbPingResp where
        messageName _ = Data.Text.pack "RpbPingResp"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbPingResp'_unknownFields
              (\ x__ y__ -> x__{_RpbPingResp'_unknownFields = y__})
        defMessage = RpbPingResp{_RpbPingResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbPingResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbPingResp'_unknownFields x__) (())
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbPutReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' RpbPutReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'key' @:: Lens' RpbPutReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.vclock' @:: Lens' RpbPutReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'vclock' @:: Lens' RpbPutReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.content' @:: Lens' RpbPutReq RpbContent@
    * 'Proto.Riak_Fields.w' @:: Lens' RpbPutReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'w' @:: Lens' RpbPutReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.dw' @:: Lens' RpbPutReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'dw' @:: Lens' RpbPutReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.returnBody' @:: Lens' RpbPutReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'returnBody' @:: Lens' RpbPutReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.pw' @:: Lens' RpbPutReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'pw' @:: Lens' RpbPutReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.ifNotModified' @:: Lens' RpbPutReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'ifNotModified' @:: Lens' RpbPutReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.ifNoneMatch' @:: Lens' RpbPutReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'ifNoneMatch' @:: Lens' RpbPutReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.returnHead' @:: Lens' RpbPutReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'returnHead' @:: Lens' RpbPutReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.timeout' @:: Lens' RpbPutReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' RpbPutReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.asis' @:: Lens' RpbPutReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'asis' @:: Lens' RpbPutReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.sloppyQuorum' @:: Lens' RpbPutReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'sloppyQuorum' @:: Lens' RpbPutReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.nVal' @:: Lens' RpbPutReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'nVal' @:: Lens' RpbPutReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbPutReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbPutReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbPutReq = RpbPutReq{_RpbPutReq'bucket ::
                           !Data.ByteString.ByteString,
                           _RpbPutReq'key :: !(Prelude.Maybe Data.ByteString.ByteString),
                           _RpbPutReq'vclock :: !(Prelude.Maybe Data.ByteString.ByteString),
                           _RpbPutReq'content :: !RpbContent,
                           _RpbPutReq'w :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbPutReq'dw :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbPutReq'returnBody :: !(Prelude.Maybe Prelude.Bool),
                           _RpbPutReq'pw :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbPutReq'ifNotModified :: !(Prelude.Maybe Prelude.Bool),
                           _RpbPutReq'ifNoneMatch :: !(Prelude.Maybe Prelude.Bool),
                           _RpbPutReq'returnHead :: !(Prelude.Maybe Prelude.Bool),
                           _RpbPutReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbPutReq'asis :: !(Prelude.Maybe Prelude.Bool),
                           _RpbPutReq'sloppyQuorum :: !(Prelude.Maybe Prelude.Bool),
                           _RpbPutReq'nVal :: !(Prelude.Maybe Data.Word.Word32),
                           _RpbPutReq'type' :: !(Prelude.Maybe Data.ByteString.ByteString),
                           _RpbPutReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbPutReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbPutReq "bucket"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'bucket
                 (\ x__ y__ -> x__{_RpbPutReq'bucket = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'key
                 (\ x__ y__ -> x__{_RpbPutReq'key = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'key"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'key
                 (\ x__ y__ -> x__{_RpbPutReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "vclock"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'vclock
                 (\ x__ y__ -> x__{_RpbPutReq'vclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'vclock"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'vclock
                 (\ x__ y__ -> x__{_RpbPutReq'vclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "content" (RpbContent)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'content
                 (\ x__ y__ -> x__{_RpbPutReq'content = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "w" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'w
                 (\ x__ y__ -> x__{_RpbPutReq'w = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'w"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'w
                 (\ x__ y__ -> x__{_RpbPutReq'w = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "dw" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'dw
                 (\ x__ y__ -> x__{_RpbPutReq'dw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'dw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'dw
                 (\ x__ y__ -> x__{_RpbPutReq'dw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "returnBody" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'returnBody
                 (\ x__ y__ -> x__{_RpbPutReq'returnBody = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'returnBody"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'returnBody
                 (\ x__ y__ -> x__{_RpbPutReq'returnBody = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "pw" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'pw
                 (\ x__ y__ -> x__{_RpbPutReq'pw = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'pw"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'pw
                 (\ x__ y__ -> x__{_RpbPutReq'pw = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "ifNotModified"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'ifNotModified
                 (\ x__ y__ -> x__{_RpbPutReq'ifNotModified = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'ifNotModified"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'ifNotModified
                 (\ x__ y__ -> x__{_RpbPutReq'ifNotModified = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "ifNoneMatch"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'ifNoneMatch
                 (\ x__ y__ -> x__{_RpbPutReq'ifNoneMatch = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'ifNoneMatch"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'ifNoneMatch
                 (\ x__ y__ -> x__{_RpbPutReq'ifNoneMatch = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "returnHead" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'returnHead
                 (\ x__ y__ -> x__{_RpbPutReq'returnHead = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'returnHead"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'returnHead
                 (\ x__ y__ -> x__{_RpbPutReq'returnHead = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'timeout
                 (\ x__ y__ -> x__{_RpbPutReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'timeout
                 (\ x__ y__ -> x__{_RpbPutReq'timeout = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "asis" (Prelude.Bool) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'asis
                 (\ x__ y__ -> x__{_RpbPutReq'asis = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'asis"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'asis
                 (\ x__ y__ -> x__{_RpbPutReq'asis = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "sloppyQuorum"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'sloppyQuorum
                 (\ x__ y__ -> x__{_RpbPutReq'sloppyQuorum = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'sloppyQuorum"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'sloppyQuorum
                 (\ x__ y__ -> x__{_RpbPutReq'sloppyQuorum = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "nVal" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'nVal
                 (\ x__ y__ -> x__{_RpbPutReq'nVal = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'nVal"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'nVal
                 (\ x__ y__ -> x__{_RpbPutReq'nVal = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutReq "type'"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'type'
                 (\ x__ y__ -> x__{_RpbPutReq'type' = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutReq "maybe'type'"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutReq'type'
                 (\ x__ y__ -> x__{_RpbPutReq'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbPutReq where
        messageName _ = Data.Text.pack "RpbPutReq"
        fieldsByTag
          = let bucket__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "bucket"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "bucket")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'key")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                vclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "vclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'vclock")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                content__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbContent)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "content")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                w__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "w"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'w")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                dw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "dw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'dw")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                returnBody__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "return_body"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'returnBody")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                pw__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "pw"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'pw")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                ifNotModified__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "if_not_modified"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'ifNotModified")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                ifNoneMatch__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "if_none_match"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'ifNoneMatch")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                returnHead__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "return_head"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'returnHead")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                asis__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "asis"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'asis")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                sloppyQuorum__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "sloppy_quorum"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'sloppyQuorum")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                nVal__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "n_val"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'nVal")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, bucket__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, vclock__field_descriptor),
                 (Data.ProtoLens.Tag 4, content__field_descriptor),
                 (Data.ProtoLens.Tag 5, w__field_descriptor),
                 (Data.ProtoLens.Tag 6, dw__field_descriptor),
                 (Data.ProtoLens.Tag 7, returnBody__field_descriptor),
                 (Data.ProtoLens.Tag 8, pw__field_descriptor),
                 (Data.ProtoLens.Tag 9, ifNotModified__field_descriptor),
                 (Data.ProtoLens.Tag 10, ifNoneMatch__field_descriptor),
                 (Data.ProtoLens.Tag 11, returnHead__field_descriptor),
                 (Data.ProtoLens.Tag 12, timeout__field_descriptor),
                 (Data.ProtoLens.Tag 13, asis__field_descriptor),
                 (Data.ProtoLens.Tag 14, sloppyQuorum__field_descriptor),
                 (Data.ProtoLens.Tag 15, nVal__field_descriptor),
                 (Data.ProtoLens.Tag 16, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbPutReq'_unknownFields
              (\ x__ y__ -> x__{_RpbPutReq'_unknownFields = y__})
        defMessage
          = RpbPutReq{_RpbPutReq'bucket = Data.ProtoLens.fieldDefault,
                      _RpbPutReq'key = Prelude.Nothing,
                      _RpbPutReq'vclock = Prelude.Nothing,
                      _RpbPutReq'content = Data.ProtoLens.defMessage,
                      _RpbPutReq'w = Prelude.Nothing, _RpbPutReq'dw = Prelude.Nothing,
                      _RpbPutReq'returnBody = Prelude.Nothing,
                      _RpbPutReq'pw = Prelude.Nothing,
                      _RpbPutReq'ifNotModified = Prelude.Nothing,
                      _RpbPutReq'ifNoneMatch = Prelude.Nothing,
                      _RpbPutReq'returnHead = Prelude.Nothing,
                      _RpbPutReq'timeout = Prelude.Nothing,
                      _RpbPutReq'asis = Prelude.Nothing,
                      _RpbPutReq'sloppyQuorum = Prelude.Nothing,
                      _RpbPutReq'nVal = Prelude.Nothing,
                      _RpbPutReq'type' = Prelude.Nothing,
                      _RpbPutReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbPutReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbPutReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbPutReq'bucket x__)
                   (Control.DeepSeq.deepseq (_RpbPutReq'key x__)
                      (Control.DeepSeq.deepseq (_RpbPutReq'vclock x__)
                         (Control.DeepSeq.deepseq (_RpbPutReq'content x__)
                            (Control.DeepSeq.deepseq (_RpbPutReq'w x__)
                               (Control.DeepSeq.deepseq (_RpbPutReq'dw x__)
                                  (Control.DeepSeq.deepseq (_RpbPutReq'returnBody x__)
                                     (Control.DeepSeq.deepseq (_RpbPutReq'pw x__)
                                        (Control.DeepSeq.deepseq (_RpbPutReq'ifNotModified x__)
                                           (Control.DeepSeq.deepseq (_RpbPutReq'ifNoneMatch x__)
                                              (Control.DeepSeq.deepseq (_RpbPutReq'returnHead x__)
                                                 (Control.DeepSeq.deepseq (_RpbPutReq'timeout x__)
                                                    (Control.DeepSeq.deepseq (_RpbPutReq'asis x__)
                                                       (Control.DeepSeq.deepseq
                                                          (_RpbPutReq'sloppyQuorum x__)
                                                          (Control.DeepSeq.deepseq
                                                             (_RpbPutReq'nVal x__)
                                                             (Control.DeepSeq.deepseq
                                                                (_RpbPutReq'type' x__)
                                                                (())))))))))))))))))
{- | Fields :

    * 'Proto.Riak_Fields.content' @:: Lens' RpbPutResp [RpbContent]@
    * 'Proto.Riak_Fields.vclock' @:: Lens' RpbPutResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'vclock' @:: Lens' RpbPutResp (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.key' @:: Lens' RpbPutResp Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'key' @:: Lens' RpbPutResp (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbPutResp = RpbPutResp{_RpbPutResp'content :: ![RpbContent],
                             _RpbPutResp'vclock :: !(Prelude.Maybe Data.ByteString.ByteString),
                             _RpbPutResp'key :: !(Prelude.Maybe Data.ByteString.ByteString),
                             _RpbPutResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbPutResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbPutResp "content" ([RpbContent])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutResp'content
                 (\ x__ y__ -> x__{_RpbPutResp'content = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutResp "vclock"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutResp'vclock
                 (\ x__ y__ -> x__{_RpbPutResp'vclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutResp "maybe'vclock"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutResp'vclock
                 (\ x__ y__ -> x__{_RpbPutResp'vclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbPutResp "key"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutResp'key
                 (\ x__ y__ -> x__{_RpbPutResp'key = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbPutResp "maybe'key"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbPutResp'key
                 (\ x__ y__ -> x__{_RpbPutResp'key = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbPutResp where
        messageName _ = Data.Text.pack "RpbPutResp"
        fieldsByTag
          = let content__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbContent)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "content")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutResp
                vclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "vclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'vclock")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutResp
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'key")))
                      :: Data.ProtoLens.FieldDescriptor RpbPutResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, content__field_descriptor),
                 (Data.ProtoLens.Tag 2, vclock__field_descriptor),
                 (Data.ProtoLens.Tag 3, key__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbPutResp'_unknownFields
              (\ x__ y__ -> x__{_RpbPutResp'_unknownFields = y__})
        defMessage
          = RpbPutResp{_RpbPutResp'content = [],
                       _RpbPutResp'vclock = Prelude.Nothing,
                       _RpbPutResp'key = Prelude.Nothing,
                       _RpbPutResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbPutResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbPutResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbPutResp'content x__)
                   (Control.DeepSeq.deepseq (_RpbPutResp'vclock x__)
                      (Control.DeepSeq.deepseq (_RpbPutResp'key x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbResetBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbResetBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbResetBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
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

 -}
data RpbResetBucketResp = RpbResetBucketResp{_RpbResetBucketResp'_unknownFields
                                             :: !Data.ProtoLens.FieldSet}
                            deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbResetBucketResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message RpbResetBucketResp where
        messageName _ = Data.Text.pack "RpbResetBucketResp"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbResetBucketResp'_unknownFields
              (\ x__ y__ -> x__{_RpbResetBucketResp'_unknownFields = y__})
        defMessage
          = RpbResetBucketResp{_RpbResetBucketResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbResetBucketResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbResetBucketResp'_unknownFields x__)
                (())
{- | Fields :

    * 'Proto.Riak_Fields.fields' @:: Lens' RpbSearchDoc [RpbPair]@
 -}
data RpbSearchDoc = RpbSearchDoc{_RpbSearchDoc'fields ::
                                 ![RpbPair],
                                 _RpbSearchDoc'_unknownFields :: !Data.ProtoLens.FieldSet}
                      deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbSearchDoc where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbSearchDoc "fields" ([RpbPair])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchDoc'fields
                 (\ x__ y__ -> x__{_RpbSearchDoc'fields = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbSearchDoc where
        messageName _ = Data.Text.pack "RpbSearchDoc"
        fieldsByTag
          = let fields__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "fields"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbPair)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fields")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchDoc
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, fields__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbSearchDoc'_unknownFields
              (\ x__ y__ -> x__{_RpbSearchDoc'_unknownFields = y__})
        defMessage
          = RpbSearchDoc{_RpbSearchDoc'fields = [],
                         _RpbSearchDoc'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbSearchDoc where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbSearchDoc'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbSearchDoc'fields x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.q' @:: Lens' RpbSearchQueryReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.index' @:: Lens' RpbSearchQueryReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.rows' @:: Lens' RpbSearchQueryReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'rows' @:: Lens' RpbSearchQueryReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.start' @:: Lens' RpbSearchQueryReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'start' @:: Lens' RpbSearchQueryReq (Prelude.Maybe Data.Word.Word32)@
    * 'Proto.Riak_Fields.sort' @:: Lens' RpbSearchQueryReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'sort' @:: Lens' RpbSearchQueryReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.filter' @:: Lens' RpbSearchQueryReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'filter' @:: Lens' RpbSearchQueryReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.df' @:: Lens' RpbSearchQueryReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'df' @:: Lens' RpbSearchQueryReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.op' @:: Lens' RpbSearchQueryReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'op' @:: Lens' RpbSearchQueryReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.fl' @:: Lens' RpbSearchQueryReq [Data.ByteString.ByteString]@
    * 'Proto.Riak_Fields.presort' @:: Lens' RpbSearchQueryReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'presort' @:: Lens' RpbSearchQueryReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbSearchQueryReq = RpbSearchQueryReq{_RpbSearchQueryReq'q ::
                                           !Data.ByteString.ByteString,
                                           _RpbSearchQueryReq'index :: !Data.ByteString.ByteString,
                                           _RpbSearchQueryReq'rows ::
                                           !(Prelude.Maybe Data.Word.Word32),
                                           _RpbSearchQueryReq'start ::
                                           !(Prelude.Maybe Data.Word.Word32),
                                           _RpbSearchQueryReq'sort ::
                                           !(Prelude.Maybe Data.ByteString.ByteString),
                                           _RpbSearchQueryReq'filter ::
                                           !(Prelude.Maybe Data.ByteString.ByteString),
                                           _RpbSearchQueryReq'df ::
                                           !(Prelude.Maybe Data.ByteString.ByteString),
                                           _RpbSearchQueryReq'op ::
                                           !(Prelude.Maybe Data.ByteString.ByteString),
                                           _RpbSearchQueryReq'fl :: ![Data.ByteString.ByteString],
                                           _RpbSearchQueryReq'presort ::
                                           !(Prelude.Maybe Data.ByteString.ByteString),
                                           _RpbSearchQueryReq'_unknownFields ::
                                           !Data.ProtoLens.FieldSet}
                           deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbSearchQueryReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbSearchQueryReq "q"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'q
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'q = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryReq "index"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'index
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'index = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryReq "rows"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'rows
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'rows = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSearchQueryReq "maybe'rows"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'rows
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'rows = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryReq "start"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'start
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'start = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSearchQueryReq "maybe'start"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'start
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'start = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryReq "sort"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'sort
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'sort = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSearchQueryReq "maybe'sort"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'sort
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'sort = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryReq "filter"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'filter
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'filter = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSearchQueryReq "maybe'filter"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'filter
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'filter = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryReq "df"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'df
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'df = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSearchQueryReq "maybe'df"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'df
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'df = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryReq "op"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'op
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'op = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSearchQueryReq "maybe'op"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'op
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'op = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryReq "fl"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'fl
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'fl = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryReq "presort"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'presort
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'presort = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSearchQueryReq "maybe'presort"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryReq'presort
                 (\ x__ y__ -> x__{_RpbSearchQueryReq'presort = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbSearchQueryReq where
        messageName _ = Data.Text.pack "RpbSearchQueryReq"
        fieldsByTag
          = let q__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "q"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "q")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
                index__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "index"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "index")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
                rows__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "rows"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'rows")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
                start__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "start"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'start")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
                sort__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "sort"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'sort")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
                filter__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "filter"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'filter")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
                df__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "df"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'df")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
                op__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "op"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'op")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
                fl__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "fl"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fl")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
                presort__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "presort"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'presort")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, q__field_descriptor),
                 (Data.ProtoLens.Tag 2, index__field_descriptor),
                 (Data.ProtoLens.Tag 3, rows__field_descriptor),
                 (Data.ProtoLens.Tag 4, start__field_descriptor),
                 (Data.ProtoLens.Tag 5, sort__field_descriptor),
                 (Data.ProtoLens.Tag 6, filter__field_descriptor),
                 (Data.ProtoLens.Tag 7, df__field_descriptor),
                 (Data.ProtoLens.Tag 8, op__field_descriptor),
                 (Data.ProtoLens.Tag 9, fl__field_descriptor),
                 (Data.ProtoLens.Tag 10, presort__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbSearchQueryReq'_unknownFields
              (\ x__ y__ -> x__{_RpbSearchQueryReq'_unknownFields = y__})
        defMessage
          = RpbSearchQueryReq{_RpbSearchQueryReq'q =
                                Data.ProtoLens.fieldDefault,
                              _RpbSearchQueryReq'index = Data.ProtoLens.fieldDefault,
                              _RpbSearchQueryReq'rows = Prelude.Nothing,
                              _RpbSearchQueryReq'start = Prelude.Nothing,
                              _RpbSearchQueryReq'sort = Prelude.Nothing,
                              _RpbSearchQueryReq'filter = Prelude.Nothing,
                              _RpbSearchQueryReq'df = Prelude.Nothing,
                              _RpbSearchQueryReq'op = Prelude.Nothing,
                              _RpbSearchQueryReq'fl = [],
                              _RpbSearchQueryReq'presort = Prelude.Nothing,
                              _RpbSearchQueryReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbSearchQueryReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbSearchQueryReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbSearchQueryReq'q x__)
                   (Control.DeepSeq.deepseq (_RpbSearchQueryReq'index x__)
                      (Control.DeepSeq.deepseq (_RpbSearchQueryReq'rows x__)
                         (Control.DeepSeq.deepseq (_RpbSearchQueryReq'start x__)
                            (Control.DeepSeq.deepseq (_RpbSearchQueryReq'sort x__)
                               (Control.DeepSeq.deepseq (_RpbSearchQueryReq'filter x__)
                                  (Control.DeepSeq.deepseq (_RpbSearchQueryReq'df x__)
                                     (Control.DeepSeq.deepseq (_RpbSearchQueryReq'op x__)
                                        (Control.DeepSeq.deepseq (_RpbSearchQueryReq'fl x__)
                                           (Control.DeepSeq.deepseq (_RpbSearchQueryReq'presort x__)
                                              (())))))))))))
{- | Fields :

    * 'Proto.Riak_Fields.docs' @:: Lens' RpbSearchQueryResp [RpbSearchDoc]@
    * 'Proto.Riak_Fields.maxScore' @:: Lens' RpbSearchQueryResp Prelude.Float@
    * 'Proto.Riak_Fields.maybe'maxScore' @:: Lens' RpbSearchQueryResp (Prelude.Maybe Prelude.Float)@
    * 'Proto.Riak_Fields.numFound' @:: Lens' RpbSearchQueryResp Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'numFound' @:: Lens' RpbSearchQueryResp (Prelude.Maybe Data.Word.Word32)@
 -}
data RpbSearchQueryResp = RpbSearchQueryResp{_RpbSearchQueryResp'docs
                                             :: ![RpbSearchDoc],
                                             _RpbSearchQueryResp'maxScore ::
                                             !(Prelude.Maybe Prelude.Float),
                                             _RpbSearchQueryResp'numFound ::
                                             !(Prelude.Maybe Data.Word.Word32),
                                             _RpbSearchQueryResp'_unknownFields ::
                                             !Data.ProtoLens.FieldSet}
                            deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbSearchQueryResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbSearchQueryResp "docs"
           ([RpbSearchDoc])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryResp'docs
                 (\ x__ y__ -> x__{_RpbSearchQueryResp'docs = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryResp "maxScore"
           (Prelude.Float)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryResp'maxScore
                 (\ x__ y__ -> x__{_RpbSearchQueryResp'maxScore = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSearchQueryResp "maybe'maxScore"
           (Prelude.Maybe Prelude.Float)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryResp'maxScore
                 (\ x__ y__ -> x__{_RpbSearchQueryResp'maxScore = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbSearchQueryResp "numFound"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryResp'numFound
                 (\ x__ y__ -> x__{_RpbSearchQueryResp'numFound = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbSearchQueryResp "maybe'numFound"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSearchQueryResp'numFound
                 (\ x__ y__ -> x__{_RpbSearchQueryResp'numFound = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbSearchQueryResp where
        messageName _ = Data.Text.pack "RpbSearchQueryResp"
        fieldsByTag
          = let docs__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "docs"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbSearchDoc)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "docs")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryResp
                maxScore__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "max_score"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'maxScore")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryResp
                numFound__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "num_found"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'numFound")))
                      :: Data.ProtoLens.FieldDescriptor RpbSearchQueryResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, docs__field_descriptor),
                 (Data.ProtoLens.Tag 2, maxScore__field_descriptor),
                 (Data.ProtoLens.Tag 3, numFound__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbSearchQueryResp'_unknownFields
              (\ x__ y__ -> x__{_RpbSearchQueryResp'_unknownFields = y__})
        defMessage
          = RpbSearchQueryResp{_RpbSearchQueryResp'docs = [],
                               _RpbSearchQueryResp'maxScore = Prelude.Nothing,
                               _RpbSearchQueryResp'numFound = Prelude.Nothing,
                               _RpbSearchQueryResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbSearchQueryResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbSearchQueryResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbSearchQueryResp'docs x__)
                   (Control.DeepSeq.deepseq (_RpbSearchQueryResp'maxScore x__)
                      (Control.DeepSeq.deepseq (_RpbSearchQueryResp'numFound x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.bucket' @:: Lens' RpbSetBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.props' @:: Lens' RpbSetBucketReq RpbBucketProps@
    * 'Proto.Riak_Fields.type'' @:: Lens' RpbSetBucketReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'type'' @:: Lens' RpbSetBucketReq (Prelude.Maybe Data.ByteString.ByteString)@
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

 -}
data RpbSetBucketResp = RpbSetBucketResp{_RpbSetBucketResp'_unknownFields
                                         :: !Data.ProtoLens.FieldSet}
                          deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbSetBucketResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message RpbSetBucketResp where
        messageName _ = Data.Text.pack "RpbSetBucketResp"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbSetBucketResp'_unknownFields
              (\ x__ y__ -> x__{_RpbSetBucketResp'_unknownFields = y__})
        defMessage
          = RpbSetBucketResp{_RpbSetBucketResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbSetBucketResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbSetBucketResp'_unknownFields x__) (())
{- | Fields :

    * 'Proto.Riak_Fields.type'' @:: Lens' RpbSetBucketTypeReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.props' @:: Lens' RpbSetBucketTypeReq RpbBucketProps@
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
{- | Fields :

    * 'Proto.Riak_Fields.clientId' @:: Lens' RpbSetClientIdReq Data.ByteString.ByteString@
 -}
data RpbSetClientIdReq = RpbSetClientIdReq{_RpbSetClientIdReq'clientId
                                           :: !Data.ByteString.ByteString,
                                           _RpbSetClientIdReq'_unknownFields ::
                                           !Data.ProtoLens.FieldSet}
                           deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbSetClientIdReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbSetClientIdReq "clientId"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbSetClientIdReq'clientId
                 (\ x__ y__ -> x__{_RpbSetClientIdReq'clientId = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbSetClientIdReq where
        messageName _ = Data.Text.pack "RpbSetClientIdReq"
        fieldsByTag
          = let clientId__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "client_id"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "clientId")))
                      :: Data.ProtoLens.FieldDescriptor RpbSetClientIdReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, clientId__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbSetClientIdReq'_unknownFields
              (\ x__ y__ -> x__{_RpbSetClientIdReq'_unknownFields = y__})
        defMessage
          = RpbSetClientIdReq{_RpbSetClientIdReq'clientId =
                                Data.ProtoLens.fieldDefault,
                              _RpbSetClientIdReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbSetClientIdReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbSetClientIdReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbSetClientIdReq'clientId x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.name' @:: Lens' RpbYokozunaIndex Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.schema' @:: Lens' RpbYokozunaIndex Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'schema' @:: Lens' RpbYokozunaIndex (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.nVal' @:: Lens' RpbYokozunaIndex Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'nVal' @:: Lens' RpbYokozunaIndex (Prelude.Maybe Data.Word.Word32)@
 -}
data RpbYokozunaIndex = RpbYokozunaIndex{_RpbYokozunaIndex'name ::
                                         !Data.ByteString.ByteString,
                                         _RpbYokozunaIndex'schema ::
                                         !(Prelude.Maybe Data.ByteString.ByteString),
                                         _RpbYokozunaIndex'nVal ::
                                         !(Prelude.Maybe Data.Word.Word32),
                                         _RpbYokozunaIndex'_unknownFields ::
                                         !Data.ProtoLens.FieldSet}
                          deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbYokozunaIndex where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbYokozunaIndex "name"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndex'name
                 (\ x__ y__ -> x__{_RpbYokozunaIndex'name = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbYokozunaIndex "schema"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndex'schema
                 (\ x__ y__ -> x__{_RpbYokozunaIndex'schema = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbYokozunaIndex "maybe'schema"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndex'schema
                 (\ x__ y__ -> x__{_RpbYokozunaIndex'schema = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbYokozunaIndex "nVal"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndex'nVal
                 (\ x__ y__ -> x__{_RpbYokozunaIndex'nVal = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbYokozunaIndex "maybe'nVal"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndex'nVal
                 (\ x__ y__ -> x__{_RpbYokozunaIndex'nVal = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbYokozunaIndex where
        messageName _ = Data.Text.pack "RpbYokozunaIndex"
        fieldsByTag
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaIndex
                schema__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "schema"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'schema")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaIndex
                nVal__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "n_val"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'nVal")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaIndex
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, name__field_descriptor),
                 (Data.ProtoLens.Tag 2, schema__field_descriptor),
                 (Data.ProtoLens.Tag 3, nVal__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbYokozunaIndex'_unknownFields
              (\ x__ y__ -> x__{_RpbYokozunaIndex'_unknownFields = y__})
        defMessage
          = RpbYokozunaIndex{_RpbYokozunaIndex'name =
                               Data.ProtoLens.fieldDefault,
                             _RpbYokozunaIndex'schema = Prelude.Nothing,
                             _RpbYokozunaIndex'nVal = Prelude.Nothing,
                             _RpbYokozunaIndex'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbYokozunaIndex where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbYokozunaIndex'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbYokozunaIndex'name x__)
                   (Control.DeepSeq.deepseq (_RpbYokozunaIndex'schema x__)
                      (Control.DeepSeq.deepseq (_RpbYokozunaIndex'nVal x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.name' @:: Lens' RpbYokozunaIndexDeleteReq Data.ByteString.ByteString@
 -}
data RpbYokozunaIndexDeleteReq = RpbYokozunaIndexDeleteReq{_RpbYokozunaIndexDeleteReq'name
                                                           :: !Data.ByteString.ByteString,
                                                           _RpbYokozunaIndexDeleteReq'_unknownFields
                                                           :: !Data.ProtoLens.FieldSet}
                                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbYokozunaIndexDeleteReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbYokozunaIndexDeleteReq "name"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndexDeleteReq'name
                 (\ x__ y__ -> x__{_RpbYokozunaIndexDeleteReq'name = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbYokozunaIndexDeleteReq where
        messageName _ = Data.Text.pack "RpbYokozunaIndexDeleteReq"
        fieldsByTag
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaIndexDeleteReq
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, name__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbYokozunaIndexDeleteReq'_unknownFields
              (\ x__ y__ -> x__{_RpbYokozunaIndexDeleteReq'_unknownFields = y__})
        defMessage
          = RpbYokozunaIndexDeleteReq{_RpbYokozunaIndexDeleteReq'name =
                                        Data.ProtoLens.fieldDefault,
                                      _RpbYokozunaIndexDeleteReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbYokozunaIndexDeleteReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbYokozunaIndexDeleteReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbYokozunaIndexDeleteReq'name x__)
                   (()))
{- | Fields :

    * 'Proto.Riak_Fields.name' @:: Lens' RpbYokozunaIndexGetReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'name' @:: Lens' RpbYokozunaIndexGetReq
  (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbYokozunaIndexGetReq = RpbYokozunaIndexGetReq{_RpbYokozunaIndexGetReq'name
                                                     :: !(Prelude.Maybe Data.ByteString.ByteString),
                                                     _RpbYokozunaIndexGetReq'_unknownFields ::
                                                     !Data.ProtoLens.FieldSet}
                                deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbYokozunaIndexGetReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbYokozunaIndexGetReq "name"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndexGetReq'name
                 (\ x__ y__ -> x__{_RpbYokozunaIndexGetReq'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbYokozunaIndexGetReq "maybe'name"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndexGetReq'name
                 (\ x__ y__ -> x__{_RpbYokozunaIndexGetReq'name = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbYokozunaIndexGetReq where
        messageName _ = Data.Text.pack "RpbYokozunaIndexGetReq"
        fieldsByTag
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaIndexGetReq
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, name__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbYokozunaIndexGetReq'_unknownFields
              (\ x__ y__ -> x__{_RpbYokozunaIndexGetReq'_unknownFields = y__})
        defMessage
          = RpbYokozunaIndexGetReq{_RpbYokozunaIndexGetReq'name =
                                     Prelude.Nothing,
                                   _RpbYokozunaIndexGetReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbYokozunaIndexGetReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbYokozunaIndexGetReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbYokozunaIndexGetReq'name x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.index' @:: Lens' RpbYokozunaIndexGetResp [RpbYokozunaIndex]@
 -}
data RpbYokozunaIndexGetResp = RpbYokozunaIndexGetResp{_RpbYokozunaIndexGetResp'index
                                                       :: ![RpbYokozunaIndex],
                                                       _RpbYokozunaIndexGetResp'_unknownFields ::
                                                       !Data.ProtoLens.FieldSet}
                                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbYokozunaIndexGetResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbYokozunaIndexGetResp "index"
           ([RpbYokozunaIndex])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndexGetResp'index
                 (\ x__ y__ -> x__{_RpbYokozunaIndexGetResp'index = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbYokozunaIndexGetResp where
        messageName _ = Data.Text.pack "RpbYokozunaIndexGetResp"
        fieldsByTag
          = let index__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "index"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbYokozunaIndex)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "index")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaIndexGetResp
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, index__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbYokozunaIndexGetResp'_unknownFields
              (\ x__ y__ -> x__{_RpbYokozunaIndexGetResp'_unknownFields = y__})
        defMessage
          = RpbYokozunaIndexGetResp{_RpbYokozunaIndexGetResp'index = [],
                                    _RpbYokozunaIndexGetResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbYokozunaIndexGetResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbYokozunaIndexGetResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbYokozunaIndexGetResp'index x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.index' @:: Lens' RpbYokozunaIndexPutReq RpbYokozunaIndex@
    * 'Proto.Riak_Fields.timeout' @:: Lens' RpbYokozunaIndexPutReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' RpbYokozunaIndexPutReq (Prelude.Maybe Data.Word.Word32)@
 -}
data RpbYokozunaIndexPutReq = RpbYokozunaIndexPutReq{_RpbYokozunaIndexPutReq'index
                                                     :: !RpbYokozunaIndex,
                                                     _RpbYokozunaIndexPutReq'timeout ::
                                                     !(Prelude.Maybe Data.Word.Word32),
                                                     _RpbYokozunaIndexPutReq'_unknownFields ::
                                                     !Data.ProtoLens.FieldSet}
                                deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbYokozunaIndexPutReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbYokozunaIndexPutReq "index"
           (RpbYokozunaIndex)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndexPutReq'index
                 (\ x__ y__ -> x__{_RpbYokozunaIndexPutReq'index = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbYokozunaIndexPutReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndexPutReq'timeout
                 (\ x__ y__ -> x__{_RpbYokozunaIndexPutReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbYokozunaIndexPutReq
           "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaIndexPutReq'timeout
                 (\ x__ y__ -> x__{_RpbYokozunaIndexPutReq'timeout = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbYokozunaIndexPutReq where
        messageName _ = Data.Text.pack "RpbYokozunaIndexPutReq"
        fieldsByTag
          = let index__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "index"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbYokozunaIndex)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "index")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaIndexPutReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaIndexPutReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, index__field_descriptor),
                 (Data.ProtoLens.Tag 2, timeout__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbYokozunaIndexPutReq'_unknownFields
              (\ x__ y__ -> x__{_RpbYokozunaIndexPutReq'_unknownFields = y__})
        defMessage
          = RpbYokozunaIndexPutReq{_RpbYokozunaIndexPutReq'index =
                                     Data.ProtoLens.defMessage,
                                   _RpbYokozunaIndexPutReq'timeout = Prelude.Nothing,
                                   _RpbYokozunaIndexPutReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbYokozunaIndexPutReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbYokozunaIndexPutReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbYokozunaIndexPutReq'index x__)
                   (Control.DeepSeq.deepseq (_RpbYokozunaIndexPutReq'timeout x__)
                      (())))
{- | Fields :

    * 'Proto.Riak_Fields.name' @:: Lens' RpbYokozunaSchema Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.content' @:: Lens' RpbYokozunaSchema Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'content' @:: Lens' RpbYokozunaSchema (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data RpbYokozunaSchema = RpbYokozunaSchema{_RpbYokozunaSchema'name
                                           :: !Data.ByteString.ByteString,
                                           _RpbYokozunaSchema'content ::
                                           !(Prelude.Maybe Data.ByteString.ByteString),
                                           _RpbYokozunaSchema'_unknownFields ::
                                           !Data.ProtoLens.FieldSet}
                           deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbYokozunaSchema where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbYokozunaSchema "name"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaSchema'name
                 (\ x__ y__ -> x__{_RpbYokozunaSchema'name = y__}))
              Prelude.id
instance Lens.Labels.HasLens' RpbYokozunaSchema "content"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaSchema'content
                 (\ x__ y__ -> x__{_RpbYokozunaSchema'content = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' RpbYokozunaSchema "maybe'content"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaSchema'content
                 (\ x__ y__ -> x__{_RpbYokozunaSchema'content = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbYokozunaSchema where
        messageName _ = Data.Text.pack "RpbYokozunaSchema"
        fieldsByTag
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaSchema
                content__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'content")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaSchema
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, name__field_descriptor),
                 (Data.ProtoLens.Tag 2, content__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _RpbYokozunaSchema'_unknownFields
              (\ x__ y__ -> x__{_RpbYokozunaSchema'_unknownFields = y__})
        defMessage
          = RpbYokozunaSchema{_RpbYokozunaSchema'name =
                                Data.ProtoLens.fieldDefault,
                              _RpbYokozunaSchema'content = Prelude.Nothing,
                              _RpbYokozunaSchema'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbYokozunaSchema where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_RpbYokozunaSchema'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbYokozunaSchema'name x__)
                   (Control.DeepSeq.deepseq (_RpbYokozunaSchema'content x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.name' @:: Lens' RpbYokozunaSchemaGetReq Data.ByteString.ByteString@
 -}
data RpbYokozunaSchemaGetReq = RpbYokozunaSchemaGetReq{_RpbYokozunaSchemaGetReq'name
                                                       :: !Data.ByteString.ByteString,
                                                       _RpbYokozunaSchemaGetReq'_unknownFields ::
                                                       !Data.ProtoLens.FieldSet}
                                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbYokozunaSchemaGetReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbYokozunaSchemaGetReq "name"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaSchemaGetReq'name
                 (\ x__ y__ -> x__{_RpbYokozunaSchemaGetReq'name = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbYokozunaSchemaGetReq where
        messageName _ = Data.Text.pack "RpbYokozunaSchemaGetReq"
        fieldsByTag
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaSchemaGetReq
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, name__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbYokozunaSchemaGetReq'_unknownFields
              (\ x__ y__ -> x__{_RpbYokozunaSchemaGetReq'_unknownFields = y__})
        defMessage
          = RpbYokozunaSchemaGetReq{_RpbYokozunaSchemaGetReq'name =
                                      Data.ProtoLens.fieldDefault,
                                    _RpbYokozunaSchemaGetReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbYokozunaSchemaGetReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbYokozunaSchemaGetReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbYokozunaSchemaGetReq'name x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.schema' @:: Lens' RpbYokozunaSchemaGetResp RpbYokozunaSchema@
 -}
data RpbYokozunaSchemaGetResp = RpbYokozunaSchemaGetResp{_RpbYokozunaSchemaGetResp'schema
                                                         :: !RpbYokozunaSchema,
                                                         _RpbYokozunaSchemaGetResp'_unknownFields ::
                                                         !Data.ProtoLens.FieldSet}
                                  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbYokozunaSchemaGetResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbYokozunaSchemaGetResp "schema"
           (RpbYokozunaSchema)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaSchemaGetResp'schema
                 (\ x__ y__ -> x__{_RpbYokozunaSchemaGetResp'schema = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbYokozunaSchemaGetResp where
        messageName _ = Data.Text.pack "RpbYokozunaSchemaGetResp"
        fieldsByTag
          = let schema__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "schema"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbYokozunaSchema)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "schema")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaSchemaGetResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, schema__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbYokozunaSchemaGetResp'_unknownFields
              (\ x__ y__ -> x__{_RpbYokozunaSchemaGetResp'_unknownFields = y__})
        defMessage
          = RpbYokozunaSchemaGetResp{_RpbYokozunaSchemaGetResp'schema =
                                       Data.ProtoLens.defMessage,
                                     _RpbYokozunaSchemaGetResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbYokozunaSchemaGetResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbYokozunaSchemaGetResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbYokozunaSchemaGetResp'schema x__)
                   (()))
{- | Fields :

    * 'Proto.Riak_Fields.schema' @:: Lens' RpbYokozunaSchemaPutReq RpbYokozunaSchema@
 -}
data RpbYokozunaSchemaPutReq = RpbYokozunaSchemaPutReq{_RpbYokozunaSchemaPutReq'schema
                                                       :: !RpbYokozunaSchema,
                                                       _RpbYokozunaSchemaPutReq'_unknownFields ::
                                                       !Data.ProtoLens.FieldSet}
                                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RpbYokozunaSchemaPutReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' RpbYokozunaSchemaPutReq "schema"
           (RpbYokozunaSchema)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _RpbYokozunaSchemaPutReq'schema
                 (\ x__ y__ -> x__{_RpbYokozunaSchemaPutReq'schema = y__}))
              Prelude.id
instance Data.ProtoLens.Message RpbYokozunaSchemaPutReq where
        messageName _ = Data.Text.pack "RpbYokozunaSchemaPutReq"
        fieldsByTag
          = let schema__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "schema"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbYokozunaSchema)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "schema")))
                      :: Data.ProtoLens.FieldDescriptor RpbYokozunaSchemaPutReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, schema__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _RpbYokozunaSchemaPutReq'_unknownFields
              (\ x__ y__ -> x__{_RpbYokozunaSchemaPutReq'_unknownFields = y__})
        defMessage
          = RpbYokozunaSchemaPutReq{_RpbYokozunaSchemaPutReq'schema =
                                      Data.ProtoLens.defMessage,
                                    _RpbYokozunaSchemaPutReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData RpbYokozunaSchemaPutReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq
                (_RpbYokozunaSchemaPutReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_RpbYokozunaSchemaPutReq'schema x__)
                   (()))
{- | Fields :

    * 'Proto.Riak_Fields.adds' @:: Lens' SetOp [Data.ByteString.ByteString]@
    * 'Proto.Riak_Fields.removes' @:: Lens' SetOp [Data.ByteString.ByteString]@
 -}
data SetOp = SetOp{_SetOp'adds :: ![Data.ByteString.ByteString],
                   _SetOp'removes :: ![Data.ByteString.ByteString],
                   _SetOp'_unknownFields :: !Data.ProtoLens.FieldSet}
               deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetOp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' SetOp "adds"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _SetOp'adds
                 (\ x__ y__ -> x__{_SetOp'adds = y__}))
              Prelude.id
instance Lens.Labels.HasLens' SetOp "removes"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _SetOp'removes
                 (\ x__ y__ -> x__{_SetOp'removes = y__}))
              Prelude.id
instance Data.ProtoLens.Message SetOp where
        messageName _ = Data.Text.pack "SetOp"
        fieldsByTag
          = let adds__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "adds"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "adds")))
                      :: Data.ProtoLens.FieldDescriptor SetOp
                removes__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "removes"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "removes")))
                      :: Data.ProtoLens.FieldDescriptor SetOp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, adds__field_descriptor),
                 (Data.ProtoLens.Tag 2, removes__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _SetOp'_unknownFields
              (\ x__ y__ -> x__{_SetOp'_unknownFields = y__})
        defMessage
          = SetOp{_SetOp'adds = [], _SetOp'removes = [],
                  _SetOp'_unknownFields = ([])}
instance Control.DeepSeq.NFData SetOp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_SetOp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_SetOp'adds x__)
                   (Control.DeepSeq.deepseq (_SetOp'removes x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.varcharValue' @:: Lens' TsCell Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'varcharValue' @:: Lens' TsCell (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.sint64Value' @:: Lens' TsCell Data.Int.Int64@
    * 'Proto.Riak_Fields.maybe'sint64Value' @:: Lens' TsCell (Prelude.Maybe Data.Int.Int64)@
    * 'Proto.Riak_Fields.timestampValue' @:: Lens' TsCell Data.Int.Int64@
    * 'Proto.Riak_Fields.maybe'timestampValue' @:: Lens' TsCell (Prelude.Maybe Data.Int.Int64)@
    * 'Proto.Riak_Fields.booleanValue' @:: Lens' TsCell Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'booleanValue' @:: Lens' TsCell (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.doubleValue' @:: Lens' TsCell Prelude.Double@
    * 'Proto.Riak_Fields.maybe'doubleValue' @:: Lens' TsCell (Prelude.Maybe Prelude.Double)@
 -}
data TsCell = TsCell{_TsCell'varcharValue ::
                     !(Prelude.Maybe Data.ByteString.ByteString),
                     _TsCell'sint64Value :: !(Prelude.Maybe Data.Int.Int64),
                     _TsCell'timestampValue :: !(Prelude.Maybe Data.Int.Int64),
                     _TsCell'booleanValue :: !(Prelude.Maybe Prelude.Bool),
                     _TsCell'doubleValue :: !(Prelude.Maybe Prelude.Double),
                     _TsCell'_unknownFields :: !Data.ProtoLens.FieldSet}
                deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsCell where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsCell "varcharValue"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'varcharValue
                 (\ x__ y__ -> x__{_TsCell'varcharValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsCell "maybe'varcharValue"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'varcharValue
                 (\ x__ y__ -> x__{_TsCell'varcharValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCell "sint64Value" (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'sint64Value
                 (\ x__ y__ -> x__{_TsCell'sint64Value = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsCell "maybe'sint64Value"
           (Prelude.Maybe Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'sint64Value
                 (\ x__ y__ -> x__{_TsCell'sint64Value = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCell "timestampValue"
           (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'timestampValue
                 (\ x__ y__ -> x__{_TsCell'timestampValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsCell "maybe'timestampValue"
           (Prelude.Maybe Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'timestampValue
                 (\ x__ y__ -> x__{_TsCell'timestampValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCell "booleanValue" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'booleanValue
                 (\ x__ y__ -> x__{_TsCell'booleanValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsCell "maybe'booleanValue"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'booleanValue
                 (\ x__ y__ -> x__{_TsCell'booleanValue = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCell "doubleValue" (Prelude.Double)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'doubleValue
                 (\ x__ y__ -> x__{_TsCell'doubleValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsCell "maybe'doubleValue"
           (Prelude.Maybe Prelude.Double)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCell'doubleValue
                 (\ x__ y__ -> x__{_TsCell'doubleValue = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsCell where
        messageName _ = Data.Text.pack "TsCell"
        fieldsByTag
          = let varcharValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "varchar_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'varcharValue")))
                      :: Data.ProtoLens.FieldDescriptor TsCell
                sint64Value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "sint64_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'sint64Value")))
                      :: Data.ProtoLens.FieldDescriptor TsCell
                timestampValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timestamp_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'timestampValue")))
                      :: Data.ProtoLens.FieldDescriptor TsCell
                booleanValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "boolean_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'booleanValue")))
                      :: Data.ProtoLens.FieldDescriptor TsCell
                doubleValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "double_value"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.DoubleField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'doubleValue")))
                      :: Data.ProtoLens.FieldDescriptor TsCell
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, varcharValue__field_descriptor),
                 (Data.ProtoLens.Tag 2, sint64Value__field_descriptor),
                 (Data.ProtoLens.Tag 3, timestampValue__field_descriptor),
                 (Data.ProtoLens.Tag 4, booleanValue__field_descriptor),
                 (Data.ProtoLens.Tag 5, doubleValue__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsCell'_unknownFields
              (\ x__ y__ -> x__{_TsCell'_unknownFields = y__})
        defMessage
          = TsCell{_TsCell'varcharValue = Prelude.Nothing,
                   _TsCell'sint64Value = Prelude.Nothing,
                   _TsCell'timestampValue = Prelude.Nothing,
                   _TsCell'booleanValue = Prelude.Nothing,
                   _TsCell'doubleValue = Prelude.Nothing,
                   _TsCell'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsCell where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsCell'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsCell'varcharValue x__)
                   (Control.DeepSeq.deepseq (_TsCell'sint64Value x__)
                      (Control.DeepSeq.deepseq (_TsCell'timestampValue x__)
                         (Control.DeepSeq.deepseq (_TsCell'booleanValue x__)
                            (Control.DeepSeq.deepseq (_TsCell'doubleValue x__) (()))))))
{- | Fields :

    * 'Proto.Riak_Fields.name' @:: Lens' TsColumnDescription Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.type'' @:: Lens' TsColumnDescription TsColumnType@
 -}
data TsColumnDescription = TsColumnDescription{_TsColumnDescription'name
                                               :: !Data.ByteString.ByteString,
                                               _TsColumnDescription'type' :: !TsColumnType,
                                               _TsColumnDescription'_unknownFields ::
                                               !Data.ProtoLens.FieldSet}
                             deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsColumnDescription where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsColumnDescription "name"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsColumnDescription'name
                 (\ x__ y__ -> x__{_TsColumnDescription'name = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsColumnDescription "type'"
           (TsColumnType)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsColumnDescription'type'
                 (\ x__ y__ -> x__{_TsColumnDescription'type' = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsColumnDescription where
        messageName _ = Data.Text.pack "TsColumnDescription"
        fieldsByTag
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")))
                      :: Data.ProtoLens.FieldDescriptor TsColumnDescription
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor TsColumnType)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")))
                      :: Data.ProtoLens.FieldDescriptor TsColumnDescription
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, name__field_descriptor),
                 (Data.ProtoLens.Tag 2, type'__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsColumnDescription'_unknownFields
              (\ x__ y__ -> x__{_TsColumnDescription'_unknownFields = y__})
        defMessage
          = TsColumnDescription{_TsColumnDescription'name =
                                  Data.ProtoLens.fieldDefault,
                                _TsColumnDescription'type' = Data.ProtoLens.fieldDefault,
                                _TsColumnDescription'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsColumnDescription where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsColumnDescription'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsColumnDescription'name x__)
                   (Control.DeepSeq.deepseq (_TsColumnDescription'type' x__) (())))
data TsColumnType = VARCHAR
                  | SINT64
                  | DOUBLE
                  | TIMESTAMP
                  | BOOLEAN
                  | BLOB
                      deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.FieldDefault TsColumnType where
        fieldDefault = VARCHAR
instance Data.ProtoLens.MessageEnum TsColumnType where
        maybeToEnum 0 = Prelude.Just VARCHAR
        maybeToEnum 1 = Prelude.Just SINT64
        maybeToEnum 2 = Prelude.Just DOUBLE
        maybeToEnum 3 = Prelude.Just TIMESTAMP
        maybeToEnum 4 = Prelude.Just BOOLEAN
        maybeToEnum 5 = Prelude.Just BLOB
        maybeToEnum _ = Prelude.Nothing
        showEnum VARCHAR = "VARCHAR"
        showEnum SINT64 = "SINT64"
        showEnum DOUBLE = "DOUBLE"
        showEnum TIMESTAMP = "TIMESTAMP"
        showEnum BOOLEAN = "BOOLEAN"
        showEnum BLOB = "BLOB"
        readEnum "VARCHAR" = Prelude.Just VARCHAR
        readEnum "SINT64" = Prelude.Just SINT64
        readEnum "DOUBLE" = Prelude.Just DOUBLE
        readEnum "TIMESTAMP" = Prelude.Just TIMESTAMP
        readEnum "BOOLEAN" = Prelude.Just BOOLEAN
        readEnum "BLOB" = Prelude.Just BLOB
        readEnum _ = Prelude.Nothing
instance Prelude.Enum TsColumnType where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum TsColumnType: "
                    (Prelude.show k__)))
              Prelude.id
              (Data.ProtoLens.maybeToEnum k__)
        fromEnum VARCHAR = 0
        fromEnum SINT64 = 1
        fromEnum DOUBLE = 2
        fromEnum TIMESTAMP = 3
        fromEnum BOOLEAN = 4
        fromEnum BLOB = 5
        succ BLOB
          = Prelude.error
              "TsColumnType.succ: bad argument BLOB. This value would be out of bounds."
        succ VARCHAR = SINT64
        succ SINT64 = DOUBLE
        succ DOUBLE = TIMESTAMP
        succ TIMESTAMP = BOOLEAN
        succ BOOLEAN = BLOB
        pred VARCHAR
          = Prelude.error
              "TsColumnType.pred: bad argument VARCHAR. This value would be out of bounds."
        pred SINT64 = VARCHAR
        pred DOUBLE = SINT64
        pred TIMESTAMP = DOUBLE
        pred BOOLEAN = TIMESTAMP
        pred BLOB = BOOLEAN
        enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
        enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
        enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
        enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Prelude.Bounded TsColumnType where
        minBound = VARCHAR
        maxBound = BLOB
instance Control.DeepSeq.NFData TsColumnType where
        rnf x__ = Prelude.seq x__ (())
{- | Fields :

    * 'Proto.Riak_Fields.ip' @:: Lens' TsCoverageEntry Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.port' @:: Lens' TsCoverageEntry Data.Word.Word32@
    * 'Proto.Riak_Fields.coverContext' @:: Lens' TsCoverageEntry Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.range' @:: Lens' TsCoverageEntry TsRange@
    * 'Proto.Riak_Fields.maybe'range' @:: Lens' TsCoverageEntry (Prelude.Maybe TsRange)@
 -}
data TsCoverageEntry = TsCoverageEntry{_TsCoverageEntry'ip ::
                                       !Data.ByteString.ByteString,
                                       _TsCoverageEntry'port :: !Data.Word.Word32,
                                       _TsCoverageEntry'coverContext :: !Data.ByteString.ByteString,
                                       _TsCoverageEntry'range :: !(Prelude.Maybe TsRange),
                                       _TsCoverageEntry'_unknownFields :: !Data.ProtoLens.FieldSet}
                         deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsCoverageEntry where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsCoverageEntry "ip"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageEntry'ip
                 (\ x__ y__ -> x__{_TsCoverageEntry'ip = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCoverageEntry "port"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageEntry'port
                 (\ x__ y__ -> x__{_TsCoverageEntry'port = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCoverageEntry "coverContext"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageEntry'coverContext
                 (\ x__ y__ -> x__{_TsCoverageEntry'coverContext = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCoverageEntry "range" (TsRange)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageEntry'range
                 (\ x__ y__ -> x__{_TsCoverageEntry'range = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' TsCoverageEntry "maybe'range"
           (Prelude.Maybe TsRange)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageEntry'range
                 (\ x__ y__ -> x__{_TsCoverageEntry'range = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsCoverageEntry where
        messageName _ = Data.Text.pack "TsCoverageEntry"
        fieldsByTag
          = let ip__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "ip"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ip")))
                      :: Data.ProtoLens.FieldDescriptor TsCoverageEntry
                port__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "port"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "port")))
                      :: Data.ProtoLens.FieldDescriptor TsCoverageEntry
                coverContext__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cover_context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "coverContext")))
                      :: Data.ProtoLens.FieldDescriptor TsCoverageEntry
                range__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "range"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsRange)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'range")))
                      :: Data.ProtoLens.FieldDescriptor TsCoverageEntry
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, ip__field_descriptor),
                 (Data.ProtoLens.Tag 2, port__field_descriptor),
                 (Data.ProtoLens.Tag 3, coverContext__field_descriptor),
                 (Data.ProtoLens.Tag 4, range__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsCoverageEntry'_unknownFields
              (\ x__ y__ -> x__{_TsCoverageEntry'_unknownFields = y__})
        defMessage
          = TsCoverageEntry{_TsCoverageEntry'ip =
                              Data.ProtoLens.fieldDefault,
                            _TsCoverageEntry'port = Data.ProtoLens.fieldDefault,
                            _TsCoverageEntry'coverContext = Data.ProtoLens.fieldDefault,
                            _TsCoverageEntry'range = Prelude.Nothing,
                            _TsCoverageEntry'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsCoverageEntry where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsCoverageEntry'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsCoverageEntry'ip x__)
                   (Control.DeepSeq.deepseq (_TsCoverageEntry'port x__)
                      (Control.DeepSeq.deepseq (_TsCoverageEntry'coverContext x__)
                         (Control.DeepSeq.deepseq (_TsCoverageEntry'range x__) (())))))
{- | Fields :

    * 'Proto.Riak_Fields.query' @:: Lens' TsCoverageReq TsInterpolation@
    * 'Proto.Riak_Fields.maybe'query' @:: Lens' TsCoverageReq (Prelude.Maybe TsInterpolation)@
    * 'Proto.Riak_Fields.table' @:: Lens' TsCoverageReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.replaceCover' @:: Lens' TsCoverageReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'replaceCover' @:: Lens' TsCoverageReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.unavailableCover' @:: Lens' TsCoverageReq [Data.ByteString.ByteString]@
 -}
data TsCoverageReq = TsCoverageReq{_TsCoverageReq'query ::
                                   !(Prelude.Maybe TsInterpolation),
                                   _TsCoverageReq'table :: !Data.ByteString.ByteString,
                                   _TsCoverageReq'replaceCover ::
                                   !(Prelude.Maybe Data.ByteString.ByteString),
                                   _TsCoverageReq'unavailableCover :: ![Data.ByteString.ByteString],
                                   _TsCoverageReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                       deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsCoverageReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsCoverageReq "query"
           (TsInterpolation)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageReq'query
                 (\ x__ y__ -> x__{_TsCoverageReq'query = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' TsCoverageReq "maybe'query"
           (Prelude.Maybe TsInterpolation)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageReq'query
                 (\ x__ y__ -> x__{_TsCoverageReq'query = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCoverageReq "table"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageReq'table
                 (\ x__ y__ -> x__{_TsCoverageReq'table = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCoverageReq "replaceCover"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageReq'replaceCover
                 (\ x__ y__ -> x__{_TsCoverageReq'replaceCover = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsCoverageReq "maybe'replaceCover"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageReq'replaceCover
                 (\ x__ y__ -> x__{_TsCoverageReq'replaceCover = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsCoverageReq "unavailableCover"
           ([Data.ByteString.ByteString])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageReq'unavailableCover
                 (\ x__ y__ -> x__{_TsCoverageReq'unavailableCover = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsCoverageReq where
        messageName _ = Data.Text.pack "TsCoverageReq"
        fieldsByTag
          = let query__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "query"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsInterpolation)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'query")))
                      :: Data.ProtoLens.FieldDescriptor TsCoverageReq
                table__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "table"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "table")))
                      :: Data.ProtoLens.FieldDescriptor TsCoverageReq
                replaceCover__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "replace_cover"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'replaceCover")))
                      :: Data.ProtoLens.FieldDescriptor TsCoverageReq
                unavailableCover__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "unavailable_cover"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "unavailableCover")))
                      :: Data.ProtoLens.FieldDescriptor TsCoverageReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, query__field_descriptor),
                 (Data.ProtoLens.Tag 2, table__field_descriptor),
                 (Data.ProtoLens.Tag 3, replaceCover__field_descriptor),
                 (Data.ProtoLens.Tag 4, unavailableCover__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsCoverageReq'_unknownFields
              (\ x__ y__ -> x__{_TsCoverageReq'_unknownFields = y__})
        defMessage
          = TsCoverageReq{_TsCoverageReq'query = Prelude.Nothing,
                          _TsCoverageReq'table = Data.ProtoLens.fieldDefault,
                          _TsCoverageReq'replaceCover = Prelude.Nothing,
                          _TsCoverageReq'unavailableCover = [],
                          _TsCoverageReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsCoverageReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsCoverageReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsCoverageReq'query x__)
                   (Control.DeepSeq.deepseq (_TsCoverageReq'table x__)
                      (Control.DeepSeq.deepseq (_TsCoverageReq'replaceCover x__)
                         (Control.DeepSeq.deepseq (_TsCoverageReq'unavailableCover x__)
                            (())))))
{- | Fields :

    * 'Proto.Riak_Fields.entries' @:: Lens' TsCoverageResp [TsCoverageEntry]@
 -}
data TsCoverageResp = TsCoverageResp{_TsCoverageResp'entries ::
                                     ![TsCoverageEntry],
                                     _TsCoverageResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                        deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsCoverageResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsCoverageResp "entries"
           ([TsCoverageEntry])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsCoverageResp'entries
                 (\ x__ y__ -> x__{_TsCoverageResp'entries = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsCoverageResp where
        messageName _ = Data.Text.pack "TsCoverageResp"
        fieldsByTag
          = let entries__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "entries"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsCoverageEntry)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "entries")))
                      :: Data.ProtoLens.FieldDescriptor TsCoverageResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, entries__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsCoverageResp'_unknownFields
              (\ x__ y__ -> x__{_TsCoverageResp'_unknownFields = y__})
        defMessage
          = TsCoverageResp{_TsCoverageResp'entries = [],
                           _TsCoverageResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsCoverageResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsCoverageResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsCoverageResp'entries x__) (()))
{- | Fields :

    * 'Proto.Riak_Fields.table' @:: Lens' TsDelReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' TsDelReq [TsCell]@
    * 'Proto.Riak_Fields.vclock' @:: Lens' TsDelReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'vclock' @:: Lens' TsDelReq (Prelude.Maybe Data.ByteString.ByteString)@
    * 'Proto.Riak_Fields.timeout' @:: Lens' TsDelReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' TsDelReq (Prelude.Maybe Data.Word.Word32)@
 -}
data TsDelReq = TsDelReq{_TsDelReq'table ::
                         !Data.ByteString.ByteString,
                         _TsDelReq'key :: ![TsCell],
                         _TsDelReq'vclock :: !(Prelude.Maybe Data.ByteString.ByteString),
                         _TsDelReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                         _TsDelReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsDelReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsDelReq "table"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsDelReq'table
                 (\ x__ y__ -> x__{_TsDelReq'table = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsDelReq "key" ([TsCell]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsDelReq'key
                 (\ x__ y__ -> x__{_TsDelReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsDelReq "vclock"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsDelReq'vclock
                 (\ x__ y__ -> x__{_TsDelReq'vclock = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsDelReq "maybe'vclock"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsDelReq'vclock
                 (\ x__ y__ -> x__{_TsDelReq'vclock = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsDelReq "timeout" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsDelReq'timeout
                 (\ x__ y__ -> x__{_TsDelReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsDelReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsDelReq'timeout
                 (\ x__ y__ -> x__{_TsDelReq'timeout = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsDelReq where
        messageName _ = Data.Text.pack "TsDelReq"
        fieldsByTag
          = let table__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "table"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "table")))
                      :: Data.ProtoLens.FieldDescriptor TsDelReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsCell)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor TsDelReq
                vclock__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "vclock"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'vclock")))
                      :: Data.ProtoLens.FieldDescriptor TsDelReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor TsDelReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, table__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, vclock__field_descriptor),
                 (Data.ProtoLens.Tag 4, timeout__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsDelReq'_unknownFields
              (\ x__ y__ -> x__{_TsDelReq'_unknownFields = y__})
        defMessage
          = TsDelReq{_TsDelReq'table = Data.ProtoLens.fieldDefault,
                     _TsDelReq'key = [], _TsDelReq'vclock = Prelude.Nothing,
                     _TsDelReq'timeout = Prelude.Nothing,
                     _TsDelReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsDelReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsDelReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsDelReq'table x__)
                   (Control.DeepSeq.deepseq (_TsDelReq'key x__)
                      (Control.DeepSeq.deepseq (_TsDelReq'vclock x__)
                         (Control.DeepSeq.deepseq (_TsDelReq'timeout x__) (())))))
{- | Fields :

 -}
data TsDelResp = TsDelResp{_TsDelResp'_unknownFields ::
                           !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsDelResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message TsDelResp where
        messageName _ = Data.Text.pack "TsDelResp"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _TsDelResp'_unknownFields
              (\ x__ y__ -> x__{_TsDelResp'_unknownFields = y__})
        defMessage = TsDelResp{_TsDelResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsDelResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsDelResp'_unknownFields x__) (())
{- | Fields :

    * 'Proto.Riak_Fields.table' @:: Lens' TsGetReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.key' @:: Lens' TsGetReq [TsCell]@
    * 'Proto.Riak_Fields.timeout' @:: Lens' TsGetReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' TsGetReq (Prelude.Maybe Data.Word.Word32)@
 -}
data TsGetReq = TsGetReq{_TsGetReq'table ::
                         !Data.ByteString.ByteString,
                         _TsGetReq'key :: ![TsCell],
                         _TsGetReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                         _TsGetReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsGetReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsGetReq "table"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsGetReq'table
                 (\ x__ y__ -> x__{_TsGetReq'table = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsGetReq "key" ([TsCell]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsGetReq'key
                 (\ x__ y__ -> x__{_TsGetReq'key = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsGetReq "timeout" (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsGetReq'timeout
                 (\ x__ y__ -> x__{_TsGetReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsGetReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsGetReq'timeout
                 (\ x__ y__ -> x__{_TsGetReq'timeout = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsGetReq where
        messageName _ = Data.Text.pack "TsGetReq"
        fieldsByTag
          = let table__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "table"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "table")))
                      :: Data.ProtoLens.FieldDescriptor TsGetReq
                key__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "key"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsCell)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "key")))
                      :: Data.ProtoLens.FieldDescriptor TsGetReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor TsGetReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, table__field_descriptor),
                 (Data.ProtoLens.Tag 2, key__field_descriptor),
                 (Data.ProtoLens.Tag 3, timeout__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsGetReq'_unknownFields
              (\ x__ y__ -> x__{_TsGetReq'_unknownFields = y__})
        defMessage
          = TsGetReq{_TsGetReq'table = Data.ProtoLens.fieldDefault,
                     _TsGetReq'key = [], _TsGetReq'timeout = Prelude.Nothing,
                     _TsGetReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsGetReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsGetReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsGetReq'table x__)
                   (Control.DeepSeq.deepseq (_TsGetReq'key x__)
                      (Control.DeepSeq.deepseq (_TsGetReq'timeout x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.columns' @:: Lens' TsGetResp [TsColumnDescription]@
    * 'Proto.Riak_Fields.rows' @:: Lens' TsGetResp [TsRow]@
 -}
data TsGetResp = TsGetResp{_TsGetResp'columns ::
                           ![TsColumnDescription],
                           _TsGetResp'rows :: ![TsRow],
                           _TsGetResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsGetResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsGetResp "columns"
           ([TsColumnDescription])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsGetResp'columns
                 (\ x__ y__ -> x__{_TsGetResp'columns = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsGetResp "rows" ([TsRow]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsGetResp'rows
                 (\ x__ y__ -> x__{_TsGetResp'rows = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsGetResp where
        messageName _ = Data.Text.pack "TsGetResp"
        fieldsByTag
          = let columns__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "columns"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsColumnDescription)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "columns")))
                      :: Data.ProtoLens.FieldDescriptor TsGetResp
                rows__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "rows"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsRow)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "rows")))
                      :: Data.ProtoLens.FieldDescriptor TsGetResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, columns__field_descriptor),
                 (Data.ProtoLens.Tag 2, rows__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsGetResp'_unknownFields
              (\ x__ y__ -> x__{_TsGetResp'_unknownFields = y__})
        defMessage
          = TsGetResp{_TsGetResp'columns = [], _TsGetResp'rows = [],
                      _TsGetResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsGetResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsGetResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsGetResp'columns x__)
                   (Control.DeepSeq.deepseq (_TsGetResp'rows x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.base' @:: Lens' TsInterpolation Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.interpolations' @:: Lens' TsInterpolation [RpbPair]@
 -}
data TsInterpolation = TsInterpolation{_TsInterpolation'base ::
                                       !Data.ByteString.ByteString,
                                       _TsInterpolation'interpolations :: ![RpbPair],
                                       _TsInterpolation'_unknownFields :: !Data.ProtoLens.FieldSet}
                         deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsInterpolation where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsInterpolation "base"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsInterpolation'base
                 (\ x__ y__ -> x__{_TsInterpolation'base = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsInterpolation "interpolations"
           ([RpbPair])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsInterpolation'interpolations
                 (\ x__ y__ -> x__{_TsInterpolation'interpolations = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsInterpolation where
        messageName _ = Data.Text.pack "TsInterpolation"
        fieldsByTag
          = let base__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "base"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "base")))
                      :: Data.ProtoLens.FieldDescriptor TsInterpolation
                interpolations__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "interpolations"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor RpbPair)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "interpolations")))
                      :: Data.ProtoLens.FieldDescriptor TsInterpolation
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, base__field_descriptor),
                 (Data.ProtoLens.Tag 2, interpolations__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsInterpolation'_unknownFields
              (\ x__ y__ -> x__{_TsInterpolation'_unknownFields = y__})
        defMessage
          = TsInterpolation{_TsInterpolation'base =
                              Data.ProtoLens.fieldDefault,
                            _TsInterpolation'interpolations = [],
                            _TsInterpolation'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsInterpolation where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsInterpolation'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsInterpolation'base x__)
                   (Control.DeepSeq.deepseq (_TsInterpolation'interpolations x__)
                      (())))
{- | Fields :

    * 'Proto.Riak_Fields.table' @:: Lens' TsListKeysReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.timeout' @:: Lens' TsListKeysReq Data.Word.Word32@
    * 'Proto.Riak_Fields.maybe'timeout' @:: Lens' TsListKeysReq (Prelude.Maybe Data.Word.Word32)@
 -}
data TsListKeysReq = TsListKeysReq{_TsListKeysReq'table ::
                                   !Data.ByteString.ByteString,
                                   _TsListKeysReq'timeout :: !(Prelude.Maybe Data.Word.Word32),
                                   _TsListKeysReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                       deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsListKeysReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsListKeysReq "table"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsListKeysReq'table
                 (\ x__ y__ -> x__{_TsListKeysReq'table = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsListKeysReq "timeout"
           (Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsListKeysReq'timeout
                 (\ x__ y__ -> x__{_TsListKeysReq'timeout = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsListKeysReq "maybe'timeout"
           (Prelude.Maybe Data.Word.Word32)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsListKeysReq'timeout
                 (\ x__ y__ -> x__{_TsListKeysReq'timeout = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsListKeysReq where
        messageName _ = Data.Text.pack "TsListKeysReq"
        fieldsByTag
          = let table__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "table"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "table")))
                      :: Data.ProtoLens.FieldDescriptor TsListKeysReq
                timeout__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "timeout"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'timeout")))
                      :: Data.ProtoLens.FieldDescriptor TsListKeysReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, table__field_descriptor),
                 (Data.ProtoLens.Tag 2, timeout__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsListKeysReq'_unknownFields
              (\ x__ y__ -> x__{_TsListKeysReq'_unknownFields = y__})
        defMessage
          = TsListKeysReq{_TsListKeysReq'table = Data.ProtoLens.fieldDefault,
                          _TsListKeysReq'timeout = Prelude.Nothing,
                          _TsListKeysReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsListKeysReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsListKeysReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsListKeysReq'table x__)
                   (Control.DeepSeq.deepseq (_TsListKeysReq'timeout x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.keys' @:: Lens' TsListKeysResp [TsRow]@
    * 'Proto.Riak_Fields.done' @:: Lens' TsListKeysResp Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'done' @:: Lens' TsListKeysResp (Prelude.Maybe Prelude.Bool)@
 -}
data TsListKeysResp = TsListKeysResp{_TsListKeysResp'keys ::
                                     ![TsRow],
                                     _TsListKeysResp'done :: !(Prelude.Maybe Prelude.Bool),
                                     _TsListKeysResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                        deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsListKeysResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsListKeysResp "keys" ([TsRow]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsListKeysResp'keys
                 (\ x__ y__ -> x__{_TsListKeysResp'keys = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsListKeysResp "done" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsListKeysResp'done
                 (\ x__ y__ -> x__{_TsListKeysResp'done = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsListKeysResp "maybe'done"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsListKeysResp'done
                 (\ x__ y__ -> x__{_TsListKeysResp'done = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsListKeysResp where
        messageName _ = Data.Text.pack "TsListKeysResp"
        fieldsByTag
          = let keys__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "keys"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsRow)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "keys")))
                      :: Data.ProtoLens.FieldDescriptor TsListKeysResp
                done__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "done"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'done")))
                      :: Data.ProtoLens.FieldDescriptor TsListKeysResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, keys__field_descriptor),
                 (Data.ProtoLens.Tag 2, done__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsListKeysResp'_unknownFields
              (\ x__ y__ -> x__{_TsListKeysResp'_unknownFields = y__})
        defMessage
          = TsListKeysResp{_TsListKeysResp'keys = [],
                           _TsListKeysResp'done = Prelude.Nothing,
                           _TsListKeysResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsListKeysResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsListKeysResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsListKeysResp'keys x__)
                   (Control.DeepSeq.deepseq (_TsListKeysResp'done x__) (())))
{- | Fields :

    * 'Proto.Riak_Fields.table' @:: Lens' TsPutReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.columns' @:: Lens' TsPutReq [TsColumnDescription]@
    * 'Proto.Riak_Fields.rows' @:: Lens' TsPutReq [TsRow]@
 -}
data TsPutReq = TsPutReq{_TsPutReq'table ::
                         !Data.ByteString.ByteString,
                         _TsPutReq'columns :: ![TsColumnDescription],
                         _TsPutReq'rows :: ![TsRow],
                         _TsPutReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsPutReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsPutReq "table"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsPutReq'table
                 (\ x__ y__ -> x__{_TsPutReq'table = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsPutReq "columns"
           ([TsColumnDescription])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsPutReq'columns
                 (\ x__ y__ -> x__{_TsPutReq'columns = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsPutReq "rows" ([TsRow]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsPutReq'rows
                 (\ x__ y__ -> x__{_TsPutReq'rows = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsPutReq where
        messageName _ = Data.Text.pack "TsPutReq"
        fieldsByTag
          = let table__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "table"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "table")))
                      :: Data.ProtoLens.FieldDescriptor TsPutReq
                columns__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "columns"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsColumnDescription)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "columns")))
                      :: Data.ProtoLens.FieldDescriptor TsPutReq
                rows__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "rows"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsRow)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "rows")))
                      :: Data.ProtoLens.FieldDescriptor TsPutReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, table__field_descriptor),
                 (Data.ProtoLens.Tag 2, columns__field_descriptor),
                 (Data.ProtoLens.Tag 3, rows__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsPutReq'_unknownFields
              (\ x__ y__ -> x__{_TsPutReq'_unknownFields = y__})
        defMessage
          = TsPutReq{_TsPutReq'table = Data.ProtoLens.fieldDefault,
                     _TsPutReq'columns = [], _TsPutReq'rows = [],
                     _TsPutReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsPutReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsPutReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsPutReq'table x__)
                   (Control.DeepSeq.deepseq (_TsPutReq'columns x__)
                      (Control.DeepSeq.deepseq (_TsPutReq'rows x__) (()))))
{- | Fields :

 -}
data TsPutResp = TsPutResp{_TsPutResp'_unknownFields ::
                           !Data.ProtoLens.FieldSet}
                   deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsPutResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message TsPutResp where
        messageName _ = Data.Text.pack "TsPutResp"
        fieldsByTag = let in Data.Map.fromList []
        unknownFields
          = Lens.Family2.Unchecked.lens _TsPutResp'_unknownFields
              (\ x__ y__ -> x__{_TsPutResp'_unknownFields = y__})
        defMessage = TsPutResp{_TsPutResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsPutResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsPutResp'_unknownFields x__) (())
{- | Fields :

    * 'Proto.Riak_Fields.query' @:: Lens' TsQueryReq TsInterpolation@
    * 'Proto.Riak_Fields.maybe'query' @:: Lens' TsQueryReq (Prelude.Maybe TsInterpolation)@
    * 'Proto.Riak_Fields.stream' @:: Lens' TsQueryReq Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'stream' @:: Lens' TsQueryReq (Prelude.Maybe Prelude.Bool)@
    * 'Proto.Riak_Fields.coverContext' @:: Lens' TsQueryReq Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.maybe'coverContext' @:: Lens' TsQueryReq (Prelude.Maybe Data.ByteString.ByteString)@
 -}
data TsQueryReq = TsQueryReq{_TsQueryReq'query ::
                             !(Prelude.Maybe TsInterpolation),
                             _TsQueryReq'stream :: !(Prelude.Maybe Prelude.Bool),
                             _TsQueryReq'coverContext ::
                             !(Prelude.Maybe Data.ByteString.ByteString),
                             _TsQueryReq'_unknownFields :: !Data.ProtoLens.FieldSet}
                    deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsQueryReq where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsQueryReq "query" (TsInterpolation)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryReq'query
                 (\ x__ y__ -> x__{_TsQueryReq'query = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Lens.Labels.HasLens' TsQueryReq "maybe'query"
           (Prelude.Maybe TsInterpolation)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryReq'query
                 (\ x__ y__ -> x__{_TsQueryReq'query = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsQueryReq "stream" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryReq'stream
                 (\ x__ y__ -> x__{_TsQueryReq'stream = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)
instance Lens.Labels.HasLens' TsQueryReq "maybe'stream"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryReq'stream
                 (\ x__ y__ -> x__{_TsQueryReq'stream = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsQueryReq "coverContext"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryReq'coverContext
                 (\ x__ y__ -> x__{_TsQueryReq'coverContext = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Lens.Labels.HasLens' TsQueryReq "maybe'coverContext"
           (Prelude.Maybe Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryReq'coverContext
                 (\ x__ y__ -> x__{_TsQueryReq'coverContext = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsQueryReq where
        messageName _ = Data.Text.pack "TsQueryReq"
        fieldsByTag
          = let query__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "query"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsInterpolation)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'query")))
                      :: Data.ProtoLens.FieldDescriptor TsQueryReq
                stream__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "stream"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'stream")))
                      :: Data.ProtoLens.FieldDescriptor TsQueryReq
                coverContext__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cover_context"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'coverContext")))
                      :: Data.ProtoLens.FieldDescriptor TsQueryReq
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, query__field_descriptor),
                 (Data.ProtoLens.Tag 2, stream__field_descriptor),
                 (Data.ProtoLens.Tag 3, coverContext__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsQueryReq'_unknownFields
              (\ x__ y__ -> x__{_TsQueryReq'_unknownFields = y__})
        defMessage
          = TsQueryReq{_TsQueryReq'query = Prelude.Nothing,
                       _TsQueryReq'stream = Prelude.Nothing,
                       _TsQueryReq'coverContext = Prelude.Nothing,
                       _TsQueryReq'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsQueryReq where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsQueryReq'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsQueryReq'query x__)
                   (Control.DeepSeq.deepseq (_TsQueryReq'stream x__)
                      (Control.DeepSeq.deepseq (_TsQueryReq'coverContext x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.columns' @:: Lens' TsQueryResp [TsColumnDescription]@
    * 'Proto.Riak_Fields.rows' @:: Lens' TsQueryResp [TsRow]@
    * 'Proto.Riak_Fields.done' @:: Lens' TsQueryResp Prelude.Bool@
    * 'Proto.Riak_Fields.maybe'done' @:: Lens' TsQueryResp (Prelude.Maybe Prelude.Bool)@
 -}
data TsQueryResp = TsQueryResp{_TsQueryResp'columns ::
                               ![TsColumnDescription],
                               _TsQueryResp'rows :: ![TsRow],
                               _TsQueryResp'done :: !(Prelude.Maybe Prelude.Bool),
                               _TsQueryResp'_unknownFields :: !Data.ProtoLens.FieldSet}
                     deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsQueryResp where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsQueryResp "columns"
           ([TsColumnDescription])
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryResp'columns
                 (\ x__ y__ -> x__{_TsQueryResp'columns = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsQueryResp "rows" ([TsRow]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryResp'rows
                 (\ x__ y__ -> x__{_TsQueryResp'rows = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsQueryResp "done" (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryResp'done
                 (\ x__ y__ -> x__{_TsQueryResp'done = y__}))
              (Data.ProtoLens.maybeLens Prelude.True)
instance Lens.Labels.HasLens' TsQueryResp "maybe'done"
           (Prelude.Maybe Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsQueryResp'done
                 (\ x__ y__ -> x__{_TsQueryResp'done = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsQueryResp where
        messageName _ = Data.Text.pack "TsQueryResp"
        fieldsByTag
          = let columns__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "columns"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsColumnDescription)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "columns")))
                      :: Data.ProtoLens.FieldDescriptor TsQueryResp
                rows__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "rows"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsRow)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "rows")))
                      :: Data.ProtoLens.FieldDescriptor TsQueryResp
                done__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "done"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'done")))
                      :: Data.ProtoLens.FieldDescriptor TsQueryResp
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, columns__field_descriptor),
                 (Data.ProtoLens.Tag 2, rows__field_descriptor),
                 (Data.ProtoLens.Tag 3, done__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsQueryResp'_unknownFields
              (\ x__ y__ -> x__{_TsQueryResp'_unknownFields = y__})
        defMessage
          = TsQueryResp{_TsQueryResp'columns = [], _TsQueryResp'rows = [],
                        _TsQueryResp'done = Prelude.Nothing,
                        _TsQueryResp'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsQueryResp where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsQueryResp'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsQueryResp'columns x__)
                   (Control.DeepSeq.deepseq (_TsQueryResp'rows x__)
                      (Control.DeepSeq.deepseq (_TsQueryResp'done x__) (()))))
{- | Fields :

    * 'Proto.Riak_Fields.fieldName' @:: Lens' TsRange Data.ByteString.ByteString@
    * 'Proto.Riak_Fields.lowerBound' @:: Lens' TsRange Data.Int.Int64@
    * 'Proto.Riak_Fields.lowerBoundInclusive' @:: Lens' TsRange Prelude.Bool@
    * 'Proto.Riak_Fields.upperBound' @:: Lens' TsRange Data.Int.Int64@
    * 'Proto.Riak_Fields.upperBoundInclusive' @:: Lens' TsRange Prelude.Bool@
    * 'Proto.Riak_Fields.desc' @:: Lens' TsRange Data.ByteString.ByteString@
 -}
data TsRange = TsRange{_TsRange'fieldName ::
                       !Data.ByteString.ByteString,
                       _TsRange'lowerBound :: !Data.Int.Int64,
                       _TsRange'lowerBoundInclusive :: !Prelude.Bool,
                       _TsRange'upperBound :: !Data.Int.Int64,
                       _TsRange'upperBoundInclusive :: !Prelude.Bool,
                       _TsRange'desc :: !Data.ByteString.ByteString,
                       _TsRange'_unknownFields :: !Data.ProtoLens.FieldSet}
                 deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsRange where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsRange "fieldName"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsRange'fieldName
                 (\ x__ y__ -> x__{_TsRange'fieldName = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsRange "lowerBound" (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsRange'lowerBound
                 (\ x__ y__ -> x__{_TsRange'lowerBound = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsRange "lowerBoundInclusive"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsRange'lowerBoundInclusive
                 (\ x__ y__ -> x__{_TsRange'lowerBoundInclusive = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsRange "upperBound" (Data.Int.Int64)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsRange'upperBound
                 (\ x__ y__ -> x__{_TsRange'upperBound = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsRange "upperBoundInclusive"
           (Prelude.Bool)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsRange'upperBoundInclusive
                 (\ x__ y__ -> x__{_TsRange'upperBoundInclusive = y__}))
              Prelude.id
instance Lens.Labels.HasLens' TsRange "desc"
           (Data.ByteString.ByteString)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsRange'desc
                 (\ x__ y__ -> x__{_TsRange'desc = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsRange where
        messageName _ = Data.Text.pack "TsRange"
        fieldsByTag
          = let fieldName__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "field_name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fieldName")))
                      :: Data.ProtoLens.FieldDescriptor TsRange
                lowerBound__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "lower_bound"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "lowerBound")))
                      :: Data.ProtoLens.FieldDescriptor TsRange
                lowerBoundInclusive__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "lower_bound_inclusive"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "lowerBoundInclusive")))
                      :: Data.ProtoLens.FieldDescriptor TsRange
                upperBound__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "upper_bound"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.SInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "upperBound")))
                      :: Data.ProtoLens.FieldDescriptor TsRange
                upperBoundInclusive__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "upper_bound_inclusive"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "upperBoundInclusive")))
                      :: Data.ProtoLens.FieldDescriptor TsRange
                desc__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "desc"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "desc")))
                      :: Data.ProtoLens.FieldDescriptor TsRange
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, fieldName__field_descriptor),
                 (Data.ProtoLens.Tag 2, lowerBound__field_descriptor),
                 (Data.ProtoLens.Tag 3, lowerBoundInclusive__field_descriptor),
                 (Data.ProtoLens.Tag 4, upperBound__field_descriptor),
                 (Data.ProtoLens.Tag 5, upperBoundInclusive__field_descriptor),
                 (Data.ProtoLens.Tag 6, desc__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsRange'_unknownFields
              (\ x__ y__ -> x__{_TsRange'_unknownFields = y__})
        defMessage
          = TsRange{_TsRange'fieldName = Data.ProtoLens.fieldDefault,
                    _TsRange'lowerBound = Data.ProtoLens.fieldDefault,
                    _TsRange'lowerBoundInclusive = Data.ProtoLens.fieldDefault,
                    _TsRange'upperBound = Data.ProtoLens.fieldDefault,
                    _TsRange'upperBoundInclusive = Data.ProtoLens.fieldDefault,
                    _TsRange'desc = Data.ProtoLens.fieldDefault,
                    _TsRange'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsRange where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsRange'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsRange'fieldName x__)
                   (Control.DeepSeq.deepseq (_TsRange'lowerBound x__)
                      (Control.DeepSeq.deepseq (_TsRange'lowerBoundInclusive x__)
                         (Control.DeepSeq.deepseq (_TsRange'upperBound x__)
                            (Control.DeepSeq.deepseq (_TsRange'upperBoundInclusive x__)
                               (Control.DeepSeq.deepseq (_TsRange'desc x__) (())))))))
{- | Fields :

    * 'Proto.Riak_Fields.cells' @:: Lens' TsRow [TsCell]@
 -}
data TsRow = TsRow{_TsRow'cells :: ![TsCell],
                   _TsRow'_unknownFields :: !Data.ProtoLens.FieldSet}
               deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TsRow where
        showsPrec _ __x __s
          = Prelude.showChar '{'
              (Prelude.showString (Data.ProtoLens.showMessageShort __x)
                 (Prelude.showChar '}' __s))
instance Lens.Labels.HasLens' TsRow "cells" ([TsCell]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _TsRow'cells
                 (\ x__ y__ -> x__{_TsRow'cells = y__}))
              Prelude.id
instance Data.ProtoLens.Message TsRow where
        messageName _ = Data.Text.pack "TsRow"
        fieldsByTag
          = let cells__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cells"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor TsCell)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf'
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "cells")))
                      :: Data.ProtoLens.FieldDescriptor TsRow
              in
              Data.Map.fromList [(Data.ProtoLens.Tag 1, cells__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _TsRow'_unknownFields
              (\ x__ y__ -> x__{_TsRow'_unknownFields = y__})
        defMessage = TsRow{_TsRow'cells = [], _TsRow'_unknownFields = ([])}
instance Control.DeepSeq.NFData TsRow where
        rnf
          = \ x__ ->
              Control.DeepSeq.deepseq (_TsRow'_unknownFields x__)
                (Control.DeepSeq.deepseq (_TsRow'cells x__) (()))