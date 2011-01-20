module Network.Riak.Protocol.GetServerInfoResponse (GetServerInfoResponse(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data GetServerInfoResponse = GetServerInfoResponse{node :: P'.Maybe P'.ByteString, server_version :: P'.Maybe P'.ByteString}
                           deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable GetServerInfoResponse where
  mergeEmpty = GetServerInfoResponse P'.mergeEmpty P'.mergeEmpty
  mergeAppend (GetServerInfoResponse x'1 x'2) (GetServerInfoResponse y'1 y'2)
   = GetServerInfoResponse (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default GetServerInfoResponse where
  defaultValue = GetServerInfoResponse P'.defaultValue P'.defaultValue
 
instance P'.Wire GetServerInfoResponse where
  wireSize ft' self'@(GetServerInfoResponse x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 12 x'1 + P'.wireSizeOpt 1 12 x'2)
  wirePut ft' self'@(GetServerInfoResponse x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 12 x'1
             P'.wirePutOpt 18 12 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> P'.fmap (\ new'Field -> old'Self{node = P'.Just new'Field}) (P'.wireGet 12)
             18 -> P'.fmap (\ new'Field -> old'Self{server_version = P'.Just new'Field}) (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> GetServerInfoResponse) GetServerInfoResponse where
  getVal m' f' = f' m'
 
instance P'.GPB GetServerInfoResponse
 
instance P'.ReflectDescriptor GetServerInfoResponse where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.GetServerInfoResponse\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"GetServerInfoResponse\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"GetServerInfoResponse.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.GetServerInfoResponse.node\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"GetServerInfoResponse\"], baseName' = FName \"node\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.GetServerInfoResponse.server_version\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"GetServerInfoResponse\"], baseName' = FName \"server_version\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"