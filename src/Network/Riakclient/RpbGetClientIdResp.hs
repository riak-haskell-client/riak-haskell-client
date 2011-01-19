module Network.Riakclient.RpbGetClientIdResp (RpbGetClientIdResp(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data RpbGetClientIdResp = RpbGetClientIdResp{client_id :: P'.ByteString}
                        deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbGetClientIdResp where
  mergeEmpty = RpbGetClientIdResp P'.mergeEmpty
  mergeAppend (RpbGetClientIdResp x'1) (RpbGetClientIdResp y'1) = RpbGetClientIdResp (P'.mergeAppend x'1 y'1)
 
instance P'.Default RpbGetClientIdResp where
  defaultValue = RpbGetClientIdResp P'.defaultValue
 
instance P'.Wire RpbGetClientIdResp where
  wireSize ft' self'@(RpbGetClientIdResp x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 12 x'1)
  wirePut ft' self'@(RpbGetClientIdResp x'1)
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
             10 -> P'.fmap (\ new'Field -> old'Self{client_id = new'Field}) (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbGetClientIdResp) RpbGetClientIdResp where
  getVal m' f' = f' m'
 
instance P'.GPB RpbGetClientIdResp
 
instance P'.ReflectDescriptor RpbGetClientIdResp where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbGetClientIdResp\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbGetClientIdResp\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbGetClientIdResp.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbGetClientIdResp.client_id\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbGetClientIdResp\"], baseName' = FName \"client_id\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"