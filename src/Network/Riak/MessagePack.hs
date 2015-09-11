{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RankNTypes                 #-}
{-# LANGUAGE StandaloneDeriving         #-}

module Network.Riak.MessagePack ( Message (..)
                                , ToMessage (..)
                                , FieldType (..)
                                , Field (..)
                                , RiakDTOp (..)
                                , get
                                , put
                                , putMany
                                , modifyCRDT
                                ) where

import           Data.ByteString.Lazy       (ByteString)
import           Data.Int
import           Data.Map                   (Map)
import qualified Data.MessagePack           as MP
import           Data.Sequence              (Seq, fromList)
import           Network.Riak.Content
import           Network.Riak.Escape                        (escape)
import           Network.Riak.Types
import           Network.Riak.Types.Internal
import qualified Network.Riak.Value         as R
import qualified Data.ByteString.Lazy as BL
import           Network.Riak.Protocol.DtOp as RDT
import qualified Network.Riak.Protocol.CounterOp as RCO
import qualified Network.Riak.Protocol.SetOp as RSO
import qualified Network.Riak.Protocol.MapOp as RMO
import qualified Network.Riak.Protocol.MapField as RMF
import qualified Network.Riak.Protocol.MapUpdate as RMU
import qualified Network.Riak.Protocol.MapUpdate.FlagOp as RMUF
import qualified Network.Riak.Protocol.MapField.MapFieldType as RMFT
import           Text.ProtocolBuffers.Basic (defaultValue)
import Network.Riak.Connection.Internal
import qualified Network.Riak.Protocol.DtUpdateRequest as RDUR
import GHC.Stack (errorWithStackTrace)

newtype Message = Message { unMessage :: Map ByteString ByteString }
                    deriving (Show, Eq, MP.Packable, MP.Unpackable, MP.OBJECT)

class ToMessage a where
  toMessage :: a -> Message

-- requires UndecidableInstances. do you think I give a shit? no
instance R.IsContent MP.Object where
  toContent m = defaultValue { content_type = Just "application/x-msgpack"
                             , value = MP.pack m
                             }
  parseContent = return . MP.unpack . value

data FieldType = Counter
               | Register
               | Map
               | Set
               | Flag
  deriving (Show, Eq)

data Field = Field { name :: ByteString, typ :: FieldType }

data RiakDTOp m
  = SetUpdate { setAdds :: Seq m, setRemovals :: Seq m }
  | MapUpdate { mapUpdates :: [(Field, RiakDTOp m)], mapRemovals :: [Field] }
  | RegisterSet { regValue :: m }
  | FlagSet { fieldValue :: Bool }
  | CounterInc { counterAmount :: Int64 }

defOp :: DtOp
defOp = DtOp Nothing Nothing Nothing

toProtocolDTOp :: MP.OBJECT o => RiakDTOp o -> RDT.DtOp
toProtocolDTOp (CounterInc i) = defOp { counter_op = Just (RCO.CounterOp { RCO.increment = Just i}) }
toProtocolDTOp (FlagSet _) = errorWithStackTrace "Invariant violated: flags have to be part of maps"
toProtocolDTOp (RegisterSet _) = errorWithStackTrace "Invariant violated: registers have to be part of maps"
toProtocolDTOp (SetUpdate adds rems) = defOp { set_op = Just (toProtocolSetOp adds rems)}
toProtocolDTOp (MapUpdate up rm) = defOp { map_op = Just (toProtocolMapOp up rm)}

toProtocolSetOp :: MP.OBJECT o => Seq o -> Seq o -> RSO.SetOp
toProtocolSetOp a r = RSO.SetOp (fmap MP.pack a) (fmap MP.pack r)

toProtocolMapOp :: MP.OBJECT m => [(Field, RiakDTOp m)] -> [Field] -> RMO.MapOp
toProtocolMapOp ups rems = RMO.MapOp { RMO.removes = fromList (fmap fieldToMapField rems)
                                     , RMO.updates = fromList (fmap pairToMapUpdate ups)
                                     }

fieldToMapField :: Field -> RMF.MapField
fieldToMapField f = RMF.MapField (name f) (convertFieldType (typ f))

convertFieldType :: FieldType -> RMFT.MapFieldType
convertFieldType Counter = RMFT.COUNTER
convertFieldType Register = RMFT.REGISTER
convertFieldType Map = RMFT.MAP
convertFieldType Set = RMFT.SET
convertFieldType Flag = RMFT.FLAG

makeMu :: Field -> RMU.MapUpdate
makeMu f = RMU.MapUpdate (fieldToMapField f) Nothing Nothing Nothing Nothing Nothing

pairToMapUpdate :: MP.OBJECT o => (Field, RiakDTOp o) -> RMU.MapUpdate
pairToMapUpdate (f, SetUpdate a r) = (makeMu f) { RMU.set_op = Just (toProtocolSetOp a r) }
pairToMapUpdate (f, MapUpdate u r) = (makeMu f) { RMU.map_op = Just (toProtocolMapOp u r)}
pairToMapUpdate (f, RegisterSet v) = (makeMu f) { RMU.register_op = Just (MP.pack v)}
pairToMapUpdate (f, FlagSet b) = (makeMu f) { RMU.flag_op = Just (if b then RMUF.ENABLE else RMUF.DISABLE) }
pairToMapUpdate (f, CounterInc i) = (makeMu f) { RMU.counter_op = Just (RCO.CounterOp (Just i)) }

get :: (MP.OBJECT a) => Connection -> Bucket -> Key -> R -> IO (Maybe ([a], VClock))
get conn buck k r = do
  mResult <- R.get conn buck k r
  case mResult of
   Nothing -> return Nothing
   -- could probably express this with Arrow.second
   Just (objs, clock) -> return (Just (fmap MP.fromObject objs, clock))

put :: (MP.OBJECT m) => Connection -> Bucket -> Key -> Maybe VClock -> m -> W -> DW -> IO ([m], VClock)
put conn buck k clock it w dw = do
  (res, klock) <- R.put conn buck k clock (MP.toObject it) w dw
  return (fmap MP.fromObject res, klock)

putMany :: (MP.OBJECT m) => Connection -> Bucket -> [(Key, Maybe VClock, m)] -> W -> DW -> IO [([m], VClock)]
putMany conn buck vals w dw = do
  let toMVal (k, c, m) = (k, c, MP.toObject m)
      mvals = fmap toMVal vals
      fromVal (res, clock) = (fmap MP.fromObject res, clock)
  results <- R.putMany conn buck mvals w dw
  return (fmap fromVal results)

modifyCRDT :: (MP.OBJECT m) => Connection -> Bucket -> Key -> BucketType -> RiakDTOp m -> W -> DW -> IO ()
modifyCRDT conn buck k t op w dw = do
  let request = RDUR.DtUpdateRequest { RDUR.bucket = escape buck
                                     , RDUR.key = Just k
                                     , RDUR.type' = escape t
                                     , RDUR.context = Nothing
                                     , RDUR.op = toProtocolDTOp op
                                     , RDUR.w = fromQuorum w
                                     , RDUR.dw = fromQuorum dw
                                     , RDUR.pw = Nothing
                                     , RDUR.return_body = Just True
                                     , RDUR.timeout = Nothing
                                     , RDUR.sloppy_quorum = Nothing -- ??????
                                     , RDUR.n_val = Nothing
                                     , RDUR.include_context = Nothing
                                     }
  _ <- exchange conn request
  return ()
