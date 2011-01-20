module Network.Riakclient.RpbListKeysReq (RpbListKeysReq(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data RpbListKeysReq = RpbListKeysReq{bucket :: P'.ByteString}
                    deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbListKeysReq where
  mergeEmpty = RpbListKeysReq P'.mergeEmpty
  mergeAppend (RpbListKeysReq x'1) (RpbListKeysReq y'1) = RpbListKeysReq (P'.mergeAppend x'1 y'1)
 
instance P'.Default RpbListKeysReq where
  defaultValue = RpbListKeysReq P'.defaultValue
 
instance P'.Wire RpbListKeysReq where
  wireSize ft' self'@(RpbListKeysReq x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 12 x'1)
  wirePut ft' self'@(RpbListKeysReq x'1)
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
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> P'.fmap (\ new'Field -> old'Self{bucket = new'Field}) (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbListKeysReq) RpbListKeysReq where
  getVal m' f' = f' m'
 
instance P'.GPB RpbListKeysReq
 
instance P'.ReflectDescriptor RpbListKeysReq where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbListKeysReq\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbListKeysReq\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbListKeysReq.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbListKeysReq.bucket\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbListKeysReq\"], baseName' = FName \"bucket\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"