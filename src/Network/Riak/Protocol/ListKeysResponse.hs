module Network.Riakclient.RpbListKeysResp (RpbListKeysResp(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data RpbListKeysResp = RpbListKeysResp{keys :: P'.Seq P'.ByteString, done :: P'.Maybe P'.Bool}
                     deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbListKeysResp where
  mergeEmpty = RpbListKeysResp P'.mergeEmpty P'.mergeEmpty
  mergeAppend (RpbListKeysResp x'1 x'2) (RpbListKeysResp y'1 y'2)
   = RpbListKeysResp (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default RpbListKeysResp where
  defaultValue = RpbListKeysResp P'.defaultValue P'.defaultValue
 
instance P'.Wire RpbListKeysResp where
  wireSize ft' self'@(RpbListKeysResp x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 12 x'1 + P'.wireSizeOpt 1 8 x'2)
  wirePut ft' self'@(RpbListKeysResp x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutRep 10 12 x'1
             P'.wirePutOpt 16 8 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> P'.fmap (\ new'Field -> old'Self{keys = P'.append (keys old'Self) new'Field}) (P'.wireGet 12)
             16 -> P'.fmap (\ new'Field -> old'Self{done = P'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbListKeysResp) RpbListKeysResp where
  getVal m' f' = f' m'
 
instance P'.GPB RpbListKeysResp
 
instance P'.ReflectDescriptor RpbListKeysResp where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbListKeysResp\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbListKeysResp\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbListKeysResp.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbListKeysResp.keys\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbListKeysResp\"], baseName' = FName \"keys\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbListKeysResp.done\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbListKeysResp\"], baseName' = FName \"done\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"