module Network.Riak.Protocol.MapReduceResponse (MapReduceResponse(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data MapReduceResponse = MapReduceResponse{phase :: P'.Maybe P'.Word32, response :: P'.Maybe P'.ByteString,
                                           done :: P'.Maybe P'.Bool}
                       deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable MapReduceResponse where
  mergeEmpty = MapReduceResponse P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty
  mergeAppend (MapReduceResponse x'1 x'2 x'3) (MapReduceResponse y'1 y'2 y'3)
   = MapReduceResponse (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)
 
instance P'.Default MapReduceResponse where
  defaultValue = MapReduceResponse P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire MapReduceResponse where
  wireSize ft' self'@(MapReduceResponse x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeOpt 1 12 x'2 + P'.wireSizeOpt 1 8 x'3)
  wirePut ft' self'@(MapReduceResponse x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 13 x'1
             P'.wirePutOpt 18 12 x'2
             P'.wirePutOpt 24 8 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> P'.fmap (\ new'Field -> old'Self{phase = P'.Just new'Field}) (P'.wireGet 13)
             18 -> P'.fmap (\ new'Field -> old'Self{response = P'.Just new'Field}) (P'.wireGet 12)
             24 -> P'.fmap (\ new'Field -> old'Self{done = P'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> MapReduceResponse) MapReduceResponse where
  getVal m' f' = f' m'
 
instance P'.GPB MapReduceResponse
 
instance P'.ReflectDescriptor MapReduceResponse where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 24])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.MapReduceResponse\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"MapReduceResponse\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"MapReduceResponse.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.MapReduceResponse.phase\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"MapReduceResponse\"], baseName' = FName \"phase\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.MapReduceResponse.response\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"MapReduceResponse\"], baseName' = FName \"response\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.MapReduceResponse.done\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"MapReduceResponse\"], baseName' = FName \"done\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"