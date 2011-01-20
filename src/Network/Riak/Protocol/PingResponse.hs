module Network.Riakextra.RpbPingResp (RpbPingResp(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
 
data RpbPingResp = RpbPingResp{}
                 deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbPingResp where
  mergeEmpty = RpbPingResp
  mergeAppend (RpbPingResp) (RpbPingResp) = RpbPingResp
 
instance P'.Default RpbPingResp where
  defaultValue = RpbPingResp
 
instance P'.Wire RpbPingResp where
  wireSize ft' self'@(RpbPingResp)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = 0
  wirePut ft' self'@(RpbPingResp)
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
 
instance P'.MessageAPI msg' (msg' -> RpbPingResp) RpbPingResp where
  getVal m' f' = f' m'
 
instance P'.GPB RpbPingResp
 
instance P'.ReflectDescriptor RpbPingResp where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakextra.RpbPingResp\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakextra\"], baseName = MName \"RpbPingResp\"}, descFilePath = [\"Network\",\"Riakextra\",\"RpbPingResp.hs\"], isGroup = False, fields = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"