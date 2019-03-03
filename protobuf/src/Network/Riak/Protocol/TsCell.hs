{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Network.Riak.Protocol.TsCell (TsCell(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data TsCell = TsCell{varchar_value :: !(P'.Maybe P'.ByteString), sint64_value :: !(P'.Maybe P'.Int64),
                     timestamp_value :: !(P'.Maybe P'.Int64), boolean_value :: !(P'.Maybe P'.Bool),
                     double_value :: !(P'.Maybe P'.Double)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable TsCell where
  mergeAppend (TsCell x'1 x'2 x'3 x'4 x'5) (TsCell y'1 y'2 y'3 y'4 y'5)
   = TsCell (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default TsCell where
  defaultValue = TsCell P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire TsCell where
  wireSize ft' self'@(TsCell x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 12 x'1 + P'.wireSizeOpt 1 18 x'2 + P'.wireSizeOpt 1 18 x'3 + P'.wireSizeOpt 1 8 x'4 +
             P'.wireSizeOpt 1 1 x'5)
  wirePutWithSize ft' self'@(TsCell x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 12 x'1, P'.wirePutOptWithSize 16 18 x'2, P'.wirePutOptWithSize 24 18 x'3,
             P'.wirePutOptWithSize 32 8 x'4, P'.wirePutOptWithSize 41 1 x'5]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{varchar_value = Prelude'.Just new'Field}) (P'.wireGet 12)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{sint64_value = Prelude'.Just new'Field}) (P'.wireGet 18)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{timestamp_value = Prelude'.Just new'Field}) (P'.wireGet 18)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{boolean_value = Prelude'.Just new'Field}) (P'.wireGet 8)
             41 -> Prelude'.fmap (\ !new'Field -> old'Self{double_value = Prelude'.Just new'Field}) (P'.wireGet 1)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TsCell) TsCell where
  getVal m' f' = f' m'

instance P'.GPB TsCell

instance P'.ReflectDescriptor TsCell where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 24, 32, 41])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.TsCell\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"TsCell\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"TsCell.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCell.varchar_value\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCell\"], baseName' = FName \"varchar_value\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCell.sint64_value\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCell\"], baseName' = FName \"sint64_value\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 18}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCell.timestamp_value\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCell\"], baseName' = FName \"timestamp_value\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 18}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCell.boolean_value\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCell\"], baseName' = FName \"boolean_value\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCell.double_value\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCell\"], baseName' = FName \"double_value\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 41}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = False}"

instance P'.TextType TsCell where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TsCell where
  textPut msg
   = do
       P'.tellT "varchar_value" (varchar_value msg)
       P'.tellT "sint64_value" (sint64_value msg)
       P'.tellT "timestamp_value" (timestamp_value msg)
       P'.tellT "boolean_value" (boolean_value msg)
       P'.tellT "double_value" (double_value msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'varchar_value, parse'sint64_value, parse'timestamp_value, parse'boolean_value, parse'double_value])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'varchar_value
         = P'.try
            (do
               v <- P'.getT "varchar_value"
               Prelude'.return (\ o -> o{varchar_value = v}))
        parse'sint64_value
         = P'.try
            (do
               v <- P'.getT "sint64_value"
               Prelude'.return (\ o -> o{sint64_value = v}))
        parse'timestamp_value
         = P'.try
            (do
               v <- P'.getT "timestamp_value"
               Prelude'.return (\ o -> o{timestamp_value = v}))
        parse'boolean_value
         = P'.try
            (do
               v <- P'.getT "boolean_value"
               Prelude'.return (\ o -> o{boolean_value = v}))
        parse'double_value
         = P'.try
            (do
               v <- P'.getT "double_value"
               Prelude'.return (\ o -> o{double_value = v}))