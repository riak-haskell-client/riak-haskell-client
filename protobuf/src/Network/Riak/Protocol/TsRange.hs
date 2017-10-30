{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Network.Riak.Protocol.TsRange (TsRange(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
data TsRange = TsRange{field_name :: !(P'.ByteString), lower_bound :: !(P'.Int64), lower_bound_inclusive :: !(P'.Bool),
                       upper_bound :: !(P'.Int64), upper_bound_inclusive :: !(P'.Bool), desc :: !(P'.ByteString)}
             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable TsRange where
  mergeAppend (TsRange x'1 x'2 x'3 x'4 x'5 x'6) (TsRange y'1 y'2 y'3 y'4 y'5 y'6)
   = TsRange (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
 
instance P'.Default TsRange where
  defaultValue = TsRange P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire TsRange where
  wireSize ft' self'@(TsRange x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 12 x'1 + P'.wireSizeReq 1 18 x'2 + P'.wireSizeReq 1 8 x'3 + P'.wireSizeReq 1 18 x'4 +
             P'.wireSizeReq 1 8 x'5
             + P'.wireSizeReq 1 12 x'6)
  wirePut ft' self'@(TsRange x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 10 12 x'1
             P'.wirePutReq 16 18 x'2
             P'.wirePutReq 24 8 x'3
             P'.wirePutReq 32 18 x'4
             P'.wirePutReq 40 8 x'5
             P'.wirePutReq 50 12 x'6
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{field_name = new'Field}) (P'.wireGet 12)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{lower_bound = new'Field}) (P'.wireGet 18)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{lower_bound_inclusive = new'Field}) (P'.wireGet 8)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{upper_bound = new'Field}) (P'.wireGet 18)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{upper_bound_inclusive = new'Field}) (P'.wireGet 8)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{desc = new'Field}) (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> TsRange) TsRange where
  getVal m' f' = f' m'
 
instance P'.GPB TsRange
 
instance P'.ReflectDescriptor TsRange where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16, 24, 32, 40, 50]) (P'.fromDistinctAscList [10, 16, 24, 32, 40, 50])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.TsRange\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"TsRange\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"TsRange.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsRange.field_name\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsRange\"], baseName' = FName \"field_name\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsRange.lower_bound\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsRange\"], baseName' = FName \"lower_bound\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 18}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsRange.lower_bound_inclusive\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsRange\"], baseName' = FName \"lower_bound_inclusive\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsRange.upper_bound\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsRange\"], baseName' = FName \"upper_bound\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 18}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsRange.upper_bound_inclusive\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsRange\"], baseName' = FName \"upper_bound_inclusive\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsRange.desc\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsRange\"], baseName' = FName \"desc\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType TsRange where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg TsRange where
  textPut msg
   = do
       P'.tellT "field_name" (field_name msg)
       P'.tellT "lower_bound" (lower_bound msg)
       P'.tellT "lower_bound_inclusive" (lower_bound_inclusive msg)
       P'.tellT "upper_bound" (upper_bound msg)
       P'.tellT "upper_bound_inclusive" (upper_bound_inclusive msg)
       P'.tellT "desc" (desc msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'field_name, parse'lower_bound, parse'lower_bound_inclusive, parse'upper_bound, parse'upper_bound_inclusive,
                   parse'desc])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'field_name
         = P'.try
            (do
               v <- P'.getT "field_name"
               Prelude'.return (\ o -> o{field_name = v}))
        parse'lower_bound
         = P'.try
            (do
               v <- P'.getT "lower_bound"
               Prelude'.return (\ o -> o{lower_bound = v}))
        parse'lower_bound_inclusive
         = P'.try
            (do
               v <- P'.getT "lower_bound_inclusive"
               Prelude'.return (\ o -> o{lower_bound_inclusive = v}))
        parse'upper_bound
         = P'.try
            (do
               v <- P'.getT "upper_bound"
               Prelude'.return (\ o -> o{upper_bound = v}))
        parse'upper_bound_inclusive
         = P'.try
            (do
               v <- P'.getT "upper_bound_inclusive"
               Prelude'.return (\ o -> o{upper_bound_inclusive = v}))
        parse'desc
         = P'.try
            (do
               v <- P'.getT "desc"
               Prelude'.return (\ o -> o{desc = v}))