module Network.Riakextra.RpbListBucketsReq (RpbListBucketsReq(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data RpbListBucketsReq = RpbListBucketsReq{}
                       deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbListBucketsReq where
  mergeEmpty = RpbListBucketsReq
  mergeAppend (RpbListBucketsReq) (RpbListBucketsReq) = RpbListBucketsReq
 
instance P'.Default RpbListBucketsReq where
  defaultValue = RpbListBucketsReq
 
instance P'.Wire RpbListBucketsReq where
  wireSize ft' self'@(RpbListBucketsReq)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = 0
  wirePut ft' self'@(RpbListBucketsReq)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.return ()
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbListBucketsReq) RpbListBucketsReq where
  getVal m' f' = f' m'
 
instance P'.GPB RpbListBucketsReq
 
instance P'.ReflectDescriptor RpbListBucketsReq where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakextra.RpbListBucketsReq\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakextra\"], baseName = MName \"RpbListBucketsReq\"}, descFilePath = [\"Network\",\"Riakextra\",\"RpbListBucketsReq.hs\"], isGroup = False, fields = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"