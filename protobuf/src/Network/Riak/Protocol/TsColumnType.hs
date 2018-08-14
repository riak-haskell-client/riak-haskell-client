{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Network.Riak.Protocol.TsColumnType (TsColumnType(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
data TsColumnType = VARCHAR
                  | SINT64
                  | DOUBLE
                  | TIMESTAMP
                  | BOOLEAN
                  | BLOB
                  deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable TsColumnType
 
instance Prelude'.Bounded TsColumnType where
  minBound = VARCHAR
  maxBound = BLOB
 
instance P'.Default TsColumnType where
  defaultValue = VARCHAR
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe TsColumnType
toMaybe'Enum 0 = Prelude'.Just VARCHAR
toMaybe'Enum 1 = Prelude'.Just SINT64
toMaybe'Enum 2 = Prelude'.Just DOUBLE
toMaybe'Enum 3 = Prelude'.Just TIMESTAMP
toMaybe'Enum 4 = Prelude'.Just BOOLEAN
toMaybe'Enum 5 = Prelude'.Just BLOB
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum TsColumnType where
  fromEnum VARCHAR = 0
  fromEnum SINT64 = 1
  fromEnum DOUBLE = 2
  fromEnum TIMESTAMP = 3
  fromEnum BOOLEAN = 4
  fromEnum BLOB = 5
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Network.Riak.Protocol.TsColumnType") .
      toMaybe'Enum
  succ VARCHAR = SINT64
  succ SINT64 = DOUBLE
  succ DOUBLE = TIMESTAMP
  succ TIMESTAMP = BOOLEAN
  succ BOOLEAN = BLOB
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Network.Riak.Protocol.TsColumnType"
  pred SINT64 = VARCHAR
  pred DOUBLE = SINT64
  pred TIMESTAMP = DOUBLE
  pred BOOLEAN = TIMESTAMP
  pred BLOB = BOOLEAN
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Network.Riak.Protocol.TsColumnType"
 
instance P'.Wire TsColumnType where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB TsColumnType
 
instance P'.MessageAPI msg' (msg' -> TsColumnType) TsColumnType where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum TsColumnType where
  reflectEnum
   = [(0, "VARCHAR", VARCHAR), (1, "SINT64", SINT64), (2, "DOUBLE", DOUBLE), (3, "TIMESTAMP", TIMESTAMP), (4, "BOOLEAN", BOOLEAN),
      (5, "BLOB", BLOB)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".Protocol.TsColumnType") ["Network", "Riak"] ["Protocol"] "TsColumnType")
      ["Network", "Riak", "Protocol", "TsColumnType.hs"]
      [(0, "VARCHAR"), (1, "SINT64"), (2, "DOUBLE"), (3, "TIMESTAMP"), (4, "BOOLEAN"), (5, "BLOB")]
 
instance P'.TextType TsColumnType where
  tellT = P'.tellShow
  getT = P'.getRead