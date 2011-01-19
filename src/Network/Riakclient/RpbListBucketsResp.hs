module Network.Riakclient.RpbListBucketsResp (RpbListBucketsResp(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data RpbListBucketsResp = RpbListBucketsResp{buckets :: P'.Seq P'.ByteString}
                        deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbListBucketsResp where
  mergeEmpty = RpbListBucketsResp P'.mergeEmpty
  mergeAppend (RpbListBucketsResp x'1) (RpbListBucketsResp y'1) = RpbListBucketsResp (P'.mergeAppend x'1 y'1)
 
instance P'.Default RpbListBucketsResp where
  defaultValue = RpbListBucketsResp P'.defaultValue
 
instance P'.Wire RpbListBucketsResp where
  wireSize ft' self'@(RpbListBucketsResp x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 12 x'1)
  wirePut ft' self'@(RpbListBucketsResp x'1)
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
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> P'.fmap (\ new'Field -> old'Self{buckets = P'.append (buckets old'Self) new'Field}) (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbListBucketsResp) RpbListBucketsResp where
  getVal m' f' = f' m'
 
instance P'.GPB RpbListBucketsResp
 
instance P'.ReflectDescriptor RpbListBucketsResp where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbListBucketsResp\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbListBucketsResp\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbListBucketsResp.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbListBucketsResp.buckets\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbListBucketsResp\"], baseName' = FName \"buckets\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"