{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Network.Riak.Protocol.MapReduceRequest (MapReduceRequest(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data MapReduceRequest = MapReduceRequest{request :: P'.ByteString, content_type :: P'.ByteString}
                      deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable MapReduceRequest where
  mergeEmpty = MapReduceRequest P'.mergeEmpty P'.mergeEmpty
  mergeAppend (MapReduceRequest x'1 x'2) (MapReduceRequest y'1 y'2)
   = MapReduceRequest (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default MapReduceRequest where
  defaultValue = MapReduceRequest P'.defaultValue P'.defaultValue
 
instance P'.Wire MapReduceRequest where
  wireSize ft' self'@(MapReduceRequest x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 12 x'1 + P'.wireSizeReq 1 12 x'2)
  wirePut ft' self'@(MapReduceRequest x'1 x'2)
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
             P'.wirePutReq 18 12 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> P'.fmap (\ new'Field -> old'Self{request = new'Field}) (P'.wireGet 12)
             18 -> P'.fmap (\ new'Field -> old'Self{content_type = new'Field}) (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> MapReduceRequest) MapReduceRequest where
  getVal m' f' = f' m'
 
instance P'.GPB MapReduceRequest
 
instance P'.ReflectDescriptor MapReduceRequest where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.MapReduceRequest\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"MapReduceRequest\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"MapReduceRequest.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.MapReduceRequest.request\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"MapReduceRequest\"], baseName' = FName \"request\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.MapReduceRequest.content_type\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"MapReduceRequest\"], baseName' = FName \"content_type\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"