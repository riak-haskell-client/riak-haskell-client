{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Network.Riak.Protocol.YokozunaSchemaPutRequest (YokozunaSchemaPutRequest(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riak.Protocol.YokozunaSchema as Protocol (YokozunaSchema)
 
data YokozunaSchemaPutRequest = YokozunaSchemaPutRequest{schema :: !(Protocol.YokozunaSchema)}
                              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable YokozunaSchemaPutRequest where
  mergeAppend (YokozunaSchemaPutRequest x'1) (YokozunaSchemaPutRequest y'1) = YokozunaSchemaPutRequest (P'.mergeAppend x'1 y'1)
 
instance P'.Default YokozunaSchemaPutRequest where
  defaultValue = YokozunaSchemaPutRequest P'.defaultValue
 
instance P'.Wire YokozunaSchemaPutRequest where
  wireSize ft' self'@(YokozunaSchemaPutRequest x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1)
  wirePut ft' self'@(YokozunaSchemaPutRequest x'1)
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
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{schema = P'.mergeAppend (schema old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> YokozunaSchemaPutRequest) YokozunaSchemaPutRequest where
  getVal m' f' = f' m'
 
instance P'.GPB YokozunaSchemaPutRequest
 
instance P'.ReflectDescriptor YokozunaSchemaPutRequest where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.YokozunaSchemaPutRequest\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"YokozunaSchemaPutRequest\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"YokozunaSchemaPutRequest.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.YokozunaSchemaPutRequest.schema\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"YokozunaSchemaPutRequest\"], baseName' = FName \"schema\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Protocol.YokozunaSchema\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"YokozunaSchema\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType YokozunaSchemaPutRequest where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg YokozunaSchemaPutRequest where
  textPut msg
   = do
       P'.tellT "schema" (schema msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'schema]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'schema
         = P'.try
            (do
               v <- P'.getT "schema"
               Prelude'.return (\ o -> o{schema = v}))