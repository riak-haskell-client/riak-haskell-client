module Network.Riakclient.RpbMapRedReq (RpbMapRedReq(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data RpbMapRedReq = RpbMapRedReq{request :: P'.ByteString, content_type :: P'.ByteString}
                  deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbMapRedReq where
  mergeEmpty = RpbMapRedReq P'.mergeEmpty P'.mergeEmpty
  mergeAppend (RpbMapRedReq x'1 x'2) (RpbMapRedReq y'1 y'2) = RpbMapRedReq (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default RpbMapRedReq where
  defaultValue = RpbMapRedReq P'.defaultValue P'.defaultValue
 
instance P'.Wire RpbMapRedReq where
  wireSize ft' self'@(RpbMapRedReq x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 12 x'1 + P'.wireSizeReq 1 12 x'2)
  wirePut ft' self'@(RpbMapRedReq x'1 x'2)
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
 
instance P'.MessageAPI msg' (msg' -> RpbMapRedReq) RpbMapRedReq where
  getVal m' f' = f' m'
 
instance P'.GPB RpbMapRedReq
 
instance P'.ReflectDescriptor RpbMapRedReq where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbMapRedReq\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbMapRedReq\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbMapRedReq.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbMapRedReq.request\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbMapRedReq\"], baseName' = FName \"request\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbMapRedReq.content_type\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbMapRedReq\"], baseName' = FName \"content_type\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"