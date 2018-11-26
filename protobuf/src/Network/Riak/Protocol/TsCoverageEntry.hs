{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Network.Riak.Protocol.TsCoverageEntry (TsCoverageEntry(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riak.Protocol.TsRange as Protocol (TsRange)

data TsCoverageEntry = TsCoverageEntry{ip :: !(P'.ByteString), port :: !(P'.Word32), cover_context :: !(P'.ByteString),
                                       range :: !(P'.Maybe Protocol.TsRange)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable TsCoverageEntry where
  mergeAppend (TsCoverageEntry x'1 x'2 x'3 x'4) (TsCoverageEntry y'1 y'2 y'3 y'4)
   = TsCoverageEntry (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default TsCoverageEntry where
  defaultValue = TsCoverageEntry P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire TsCoverageEntry where
  wireSize ft' self'@(TsCoverageEntry x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 12 x'1 + P'.wireSizeReq 1 13 x'2 + P'.wireSizeReq 1 12 x'3 + P'.wireSizeOpt 1 11 x'4)
  wirePutWithSize ft' self'@(TsCoverageEntry x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 12 x'1, P'.wirePutReqWithSize 16 13 x'2, P'.wirePutReqWithSize 26 12 x'3,
             P'.wirePutOptWithSize 34 11 x'4]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{ip = new'Field}) (P'.wireGet 12)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{port = new'Field}) (P'.wireGet 13)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{cover_context = new'Field}) (P'.wireGet 12)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{range = P'.mergeAppend (range old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TsCoverageEntry) TsCoverageEntry where
  getVal m' f' = f' m'

instance P'.GPB TsCoverageEntry

instance P'.ReflectDescriptor TsCoverageEntry where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16, 26]) (P'.fromDistinctAscList [10, 16, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.TsCoverageEntry\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"TsCoverageEntry\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"TsCoverageEntry.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCoverageEntry.ip\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCoverageEntry\"], baseName' = FName \"ip\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCoverageEntry.port\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCoverageEntry\"], baseName' = FName \"port\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCoverageEntry.cover_context\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCoverageEntry\"], baseName' = FName \"cover_context\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsCoverageEntry.range\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsCoverageEntry\"], baseName' = FName \"range\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Protocol.TsRange\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"TsRange\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = False}"

instance P'.TextType TsCoverageEntry where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TsCoverageEntry where
  textPut msg
   = do
       P'.tellT "ip" (ip msg)
       P'.tellT "port" (port msg)
       P'.tellT "cover_context" (cover_context msg)
       P'.tellT "range" (range msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'ip, parse'port, parse'cover_context, parse'range]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'ip
         = P'.try
            (do
               v <- P'.getT "ip"
               Prelude'.return (\ o -> o{ip = v}))
        parse'port
         = P'.try
            (do
               v <- P'.getT "port"
               Prelude'.return (\ o -> o{port = v}))
        parse'cover_context
         = P'.try
            (do
               v <- P'.getT "cover_context"
               Prelude'.return (\ o -> o{cover_context = v}))
        parse'range
         = P'.try
            (do
               v <- P'.getT "range"
               Prelude'.return (\ o -> o{range = v}))