module Network.Riakclient.RpbGetReq (RpbGetReq(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data RpbGetReq = RpbGetReq{bucket :: P'.ByteString, key :: P'.ByteString, r :: P'.Maybe P'.Word32}
               deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbGetReq where
  mergeEmpty = RpbGetReq P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty
  mergeAppend (RpbGetReq x'1 x'2 x'3) (RpbGetReq y'1 y'2 y'3)
   = RpbGetReq (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)
 
instance P'.Default RpbGetReq where
  defaultValue = RpbGetReq P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire RpbGetReq where
  wireSize ft' self'@(RpbGetReq x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 12 x'1 + P'.wireSizeReq 1 12 x'2 + P'.wireSizeOpt 1 13 x'3)
  wirePut ft' self'@(RpbGetReq x'1 x'2 x'3)
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
             P'.wirePutOpt 24 13 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> P'.fmap (\ new'Field -> old'Self{bucket = new'Field}) (P'.wireGet 12)
             18 -> P'.fmap (\ new'Field -> old'Self{key = new'Field}) (P'.wireGet 12)
             24 -> P'.fmap (\ new'Field -> old'Self{r = P'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbGetReq) RpbGetReq where
  getVal m' f' = f' m'
 
instance P'.GPB RpbGetReq
 
instance P'.ReflectDescriptor RpbGetReq where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18, 24])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbGetReq\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbGetReq\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbGetReq.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbGetReq.bucket\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbGetReq\"], baseName' = FName \"bucket\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbGetReq.key\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbGetReq\"], baseName' = FName \"key\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbGetReq.r\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbGetReq\"], baseName' = FName \"r\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"