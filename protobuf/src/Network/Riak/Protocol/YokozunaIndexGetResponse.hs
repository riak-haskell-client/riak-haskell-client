{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Network.Riak.Protocol.YokozunaIndexGetResponse (YokozunaIndexGetResponse(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riak.Protocol.YokozunaIndex as Protocol (YokozunaIndex)
 
data YokozunaIndexGetResponse = YokozunaIndexGetResponse{index :: !(P'.Seq Protocol.YokozunaIndex)}
                              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable YokozunaIndexGetResponse where
  mergeAppend (YokozunaIndexGetResponse x'1) (YokozunaIndexGetResponse y'1) = YokozunaIndexGetResponse (P'.mergeAppend x'1 y'1)
 
instance P'.Default YokozunaIndexGetResponse where
  defaultValue = YokozunaIndexGetResponse P'.defaultValue
 
instance P'.Wire YokozunaIndexGetResponse where
  wireSize ft' self'@(YokozunaIndexGetResponse x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePut ft' self'@(YokozunaIndexGetResponse x'1)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutRep 10 11 x'1
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{index = P'.append (index old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> YokozunaIndexGetResponse) YokozunaIndexGetResponse where
  getVal m' f' = f' m'
 
instance P'.GPB YokozunaIndexGetResponse
 
instance P'.ReflectDescriptor YokozunaIndexGetResponse where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.YokozunaIndexGetResponse\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"YokozunaIndexGetResponse\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"YokozunaIndexGetResponse.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.YokozunaIndexGetResponse.index\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"YokozunaIndexGetResponse\"], baseName' = FName \"index\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Protocol.YokozunaIndex\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"YokozunaIndex\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType YokozunaIndexGetResponse where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg YokozunaIndexGetResponse where
  textPut msg
   = do
       P'.tellT "index" (index msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'index]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'index
         = P'.try
            (do
               v <- P'.getT "index"
               Prelude'.return (\ o -> o{index = P'.append (index o) v}))