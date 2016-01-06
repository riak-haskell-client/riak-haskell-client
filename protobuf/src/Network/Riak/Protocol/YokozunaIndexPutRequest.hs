{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Network.Riak.Protocol.YokozunaIndexPutRequest (YokozunaIndexPutRequest(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riak.Protocol.YokozunaIndex as Protocol (YokozunaIndex)
 
data YokozunaIndexPutRequest = YokozunaIndexPutRequest{index :: !(Protocol.YokozunaIndex), timeout :: !(P'.Maybe P'.Word32)}
                             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable YokozunaIndexPutRequest where
  mergeAppend (YokozunaIndexPutRequest x'1 x'2) (YokozunaIndexPutRequest y'1 y'2)
   = YokozunaIndexPutRequest (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default YokozunaIndexPutRequest where
  defaultValue = YokozunaIndexPutRequest P'.defaultValue P'.defaultValue
 
instance P'.Wire YokozunaIndexPutRequest where
  wireSize ft' self'@(YokozunaIndexPutRequest x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeOpt 1 13 x'2)
  wirePut ft' self'@(YokozunaIndexPutRequest x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 10 11 x'1
             P'.wirePutOpt 16 13 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{index = P'.mergeAppend (index old'Self) (new'Field)}) (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{timeout = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> YokozunaIndexPutRequest) YokozunaIndexPutRequest where
  getVal m' f' = f' m'
 
instance P'.GPB YokozunaIndexPutRequest
 
instance P'.ReflectDescriptor YokozunaIndexPutRequest where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.YokozunaIndexPutRequest\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"YokozunaIndexPutRequest\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"YokozunaIndexPutRequest.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.YokozunaIndexPutRequest.index\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"YokozunaIndexPutRequest\"], baseName' = FName \"index\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Protocol.YokozunaIndex\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"YokozunaIndex\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.YokozunaIndexPutRequest.timeout\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"YokozunaIndexPutRequest\"], baseName' = FName \"timeout\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType YokozunaIndexPutRequest where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg YokozunaIndexPutRequest where
  textPut msg
   = do
       P'.tellT "index" (index msg)
       P'.tellT "timeout" (timeout msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'index, parse'timeout]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'index
         = P'.try
            (do
               v <- P'.getT "index"
               Prelude'.return (\ o -> o{index = v}))
        parse'timeout
         = P'.try
            (do
               v <- P'.getT "timeout"
               Prelude'.return (\ o -> o{timeout = v}))