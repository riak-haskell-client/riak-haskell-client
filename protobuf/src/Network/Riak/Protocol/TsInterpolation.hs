{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Network.Riak.Protocol.TsInterpolation (TsInterpolation(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riak.Protocol.Pair as Protocol (Pair)

data TsInterpolation = TsInterpolation{base :: !(P'.ByteString), interpolations :: !(P'.Seq Protocol.Pair)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable TsInterpolation where
  mergeAppend (TsInterpolation x'1 x'2) (TsInterpolation y'1 y'2)
   = TsInterpolation (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default TsInterpolation where
  defaultValue = TsInterpolation P'.defaultValue P'.defaultValue

instance P'.Wire TsInterpolation where
  wireSize ft' self'@(TsInterpolation x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 12 x'1 + P'.wireSizeRep 1 11 x'2)
  wirePutWithSize ft' self'@(TsInterpolation x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 12 x'1, P'.wirePutRepWithSize 18 11 x'2]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{base = new'Field}) (P'.wireGet 12)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{interpolations = P'.append (interpolations old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TsInterpolation) TsInterpolation where
  getVal m' f' = f' m'

instance P'.GPB TsInterpolation

instance P'.ReflectDescriptor TsInterpolation where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.TsInterpolation\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"TsInterpolation\"}, descFilePath = [\"Network\",\"Riak\",\"Protocol\",\"TsInterpolation.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsInterpolation.base\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsInterpolation\"], baseName' = FName \"base\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.TsInterpolation.interpolations\", haskellPrefix' = [MName \"Network\",MName \"Riak\"], parentModule' = [MName \"Protocol\",MName \"TsInterpolation\"], baseName' = FName \"interpolations\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Protocol.Pair\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [MName \"Protocol\"], baseName = MName \"Pair\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = False}"

instance P'.TextType TsInterpolation where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TsInterpolation where
  textPut msg
   = do
       P'.tellT "base" (base msg)
       P'.tellT "interpolations" (interpolations msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'base, parse'interpolations]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'base
         = P'.try
            (do
               v <- P'.getT "base"
               Prelude'.return (\ o -> o{base = v}))
        parse'interpolations
         = P'.try
            (do
               v <- P'.getT "interpolations"
               Prelude'.return (\ o -> o{interpolations = P'.append (interpolations o) v}))