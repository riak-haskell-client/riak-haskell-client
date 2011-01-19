module Network.Riakclient.RpbGetBucketResp (RpbGetBucketResp(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riakclient.RpbBucketProps as Riakclient (RpbBucketProps)
 
data RpbGetBucketResp = RpbGetBucketResp{props :: Riakclient.RpbBucketProps}
                      deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbGetBucketResp where
  mergeEmpty = RpbGetBucketResp P'.mergeEmpty
  mergeAppend (RpbGetBucketResp x'1) (RpbGetBucketResp y'1) = RpbGetBucketResp (P'.mergeAppend x'1 y'1)
 
instance P'.Default RpbGetBucketResp where
  defaultValue = RpbGetBucketResp P'.defaultValue
 
instance P'.Wire RpbGetBucketResp where
  wireSize ft' self'@(RpbGetBucketResp x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1)
  wirePut ft' self'@(RpbGetBucketResp x'1)
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
             10 -> P'.fmap (\ new'Field -> old'Self{props = P'.mergeAppend (props old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbGetBucketResp) RpbGetBucketResp where
  getVal m' f' = f' m'
 
instance P'.GPB RpbGetBucketResp
 
instance P'.ReflectDescriptor RpbGetBucketResp where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbGetBucketResp\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbGetBucketResp\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbGetBucketResp.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbGetBucketResp.props\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbGetBucketResp\"], baseName' = FName \"props\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Riakclient.RpbBucketProps\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbBucketProps\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"