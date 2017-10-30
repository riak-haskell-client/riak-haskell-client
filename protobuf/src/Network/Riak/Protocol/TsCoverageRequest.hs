{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Network.Riak.Protocol.TsCoverageRequest (TsCoverageRequest(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riak.Protocol.TsInterpolation as Protocol (TsInterpolation)
 
data TsCoverageRequest = TsCoverageRequest{query :: !(P'.Maybe Protocol.TsInterpolation), table :: !(P'.ByteString),
                                           replace_cover :: !(P'.Maybe P'.ByteString), unavailable_cover :: !(P'.Seq P'.ByteString)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable TsCoverageRequest where
  mergeAppend (TsCoverageRequest x'1 x'2 x'3 x'4) (TsCoverageRequest y'1 y'2 y'3 y'4)
   = TsCoverageRequest (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
 
instance P'.Default TsCoverageRequest where
  defaultValue = TsCoverageRequest P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire TsCoverageRequest where
  wireSize ft' self'@(TsCoverageRequest x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeReq 1 12 x'2 + P'.wireSizeOpt 1 12 x'3 + P'.wireSizeRep 1 12 x'4)
  wirePut ft' self'@(TsCoverageRequest x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 11 x'1
             P'.wirePutReq 18 12 x'2
             P'.wirePutOpt 26 12 x'3
             P'.wirePutRep 34 12 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{query = P'.mergeAppend (query old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{table = new'Field}) (P'.wireGet 12)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{replace_cover = Prelude'.Just new'Field}) (P'.wireGet 12)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{unavailable_cover = P'.append (unavailable_cover old'Self) new'Field})
                    (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> TsCoverageRequest) TsCoverageRequest where
  getVal m' f' = f' m'
 
instance P'.GPB TsCoverageRequest
 
instance P'.ReflectDescriptor TsCoverageRequest where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [18]) (P'.fromDistinctAscList [10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.TsCoverageRequest\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"TsCoverageRequest\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"TsCoverageRequest.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCoverageRequest.query\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCoverageRequest\"], baseName' = FName \"query\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Protocol.TsInterpolation\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"TsInterpolation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCoverageRequest.table\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCoverageRequest\"], baseName' = FName \"table\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCoverageRequest.replace_cover\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCoverageRequest\"], baseName' = FName \"replace_cover\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCoverageRequest.unavailable_cover\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCoverageRequest\"], baseName' = FName \"unavailable_cover\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType TsCoverageRequest where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg TsCoverageRequest where
  textPut msg
   = do
       P'.tellT "query" (query msg)
       P'.tellT "table" (table msg)
       P'.tellT "replace_cover" (replace_cover msg)
       P'.tellT "unavailable_cover" (unavailable_cover msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'query, parse'table, parse'replace_cover, parse'unavailable_cover]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'query
         = P'.try
            (do
               v <- P'.getT "query"
               Prelude'.return (\ o -> o{query = v}))
        parse'table
         = P'.try
            (do
               v <- P'.getT "table"
               Prelude'.return (\ o -> o{table = v}))
        parse'replace_cover
         = P'.try
            (do
               v <- P'.getT "replace_cover"
               Prelude'.return (\ o -> o{replace_cover = v}))
        parse'unavailable_cover
         = P'.try
            (do
               v <- P'.getT "unavailable_cover"
               Prelude'.return (\ o -> o{unavailable_cover = P'.append (unavailable_cover o) v}))