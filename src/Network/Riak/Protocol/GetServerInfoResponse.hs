module Network.Riakclient.RpbGetServerInfoResp (RpbGetServerInfoResp(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data RpbGetServerInfoResp = RpbGetServerInfoResp{node :: P'.Maybe P'.ByteString, server_version :: P'.Maybe P'.ByteString}
                          deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbGetServerInfoResp where
  mergeEmpty = RpbGetServerInfoResp P'.mergeEmpty P'.mergeEmpty
  mergeAppend (RpbGetServerInfoResp x'1 x'2) (RpbGetServerInfoResp y'1 y'2)
   = RpbGetServerInfoResp (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default RpbGetServerInfoResp where
  defaultValue = RpbGetServerInfoResp P'.defaultValue P'.defaultValue
 
instance P'.Wire RpbGetServerInfoResp where
  wireSize ft' self'@(RpbGetServerInfoResp x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 12 x'1 + P'.wireSizeOpt 1 12 x'2)
  wirePut ft' self'@(RpbGetServerInfoResp x'1 x'2)
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
 
instance P'.MessageAPI msg' (msg' -> RpbGetServerInfoResp) RpbGetServerInfoResp where
  getVal m' f' = f' m'
 
instance P'.GPB RpbGetServerInfoResp
 
instance P'.ReflectDescriptor RpbGetServerInfoResp where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbGetServerInfoResp\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbGetServerInfoResp\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbGetServerInfoResp.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbGetServerInfoResp.node\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbGetServerInfoResp\"], baseName' = FName \"node\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbGetServerInfoResp.server_version\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbGetServerInfoResp\"], baseName' = FName \"server_version\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"