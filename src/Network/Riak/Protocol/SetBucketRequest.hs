module Network.Riakclient.RpbSetBucketReq (RpbSetBucketReq(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riakclient.RpbBucketProps as Riakclient (RpbBucketProps)
 
data RpbSetBucketReq = RpbSetBucketReq{bucket :: P'.ByteString, props :: Riakclient.RpbBucketProps}
                     deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbSetBucketReq where
  mergeEmpty = RpbSetBucketReq P'.mergeEmpty P'.mergeEmpty
  mergeAppend (RpbSetBucketReq x'1 x'2) (RpbSetBucketReq y'1 y'2)
   = RpbSetBucketReq (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default RpbSetBucketReq where
  defaultValue = RpbSetBucketReq P'.defaultValue P'.defaultValue
 
instance P'.Wire RpbSetBucketReq where
  wireSize ft' self'@(RpbSetBucketReq x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 12 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePut ft' self'@(RpbSetBucketReq x'1 x'2)
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
             P'.wirePutReq 18 11 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> P'.fmap (\ new'Field -> old'Self{bucket = new'Field}) (P'.wireGet 12)
             18 -> P'.fmap (\ new'Field -> old'Self{props = P'.mergeAppend (props old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbSetBucketReq) RpbSetBucketReq where
  getVal m' f' = f' m'
 
instance P'.GPB RpbSetBucketReq
 
instance P'.ReflectDescriptor RpbSetBucketReq where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbSetBucketReq\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbSetBucketReq\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbSetBucketReq.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbSetBucketReq.bucket\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbSetBucketReq\"], baseName' = FName \"bucket\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbSetBucketReq.props\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbSetBucketReq\"], baseName' = FName \"props\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Riakclient.RpbBucketProps\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbBucketProps\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"