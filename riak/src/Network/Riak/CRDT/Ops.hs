-- |
-- Module:      Network.Riak.CRDT.Ops
-- Copyright:   (c) 2016 Sentenai
-- Author:      Antonio Nikishaev <me@lelf.lu>
-- License:     Apache
-- Maintainer:  Tim McGilchrist <timmcgil@gmail.com>, Mark Hibberd <mark@hibberd.id.au>
-- Stability:   experimental
-- Portability: portable
--
--
-- Conversions of CRDT operations to 'PB.DtOp'
--
module Network.Riak.CRDT.Ops (
    counterUpdateOp
  , setUpdateOp
  , SetOpsComb(..)
  , toOpsComb
  , mapUpdateOp
  ) where

import           Data.ByteString.Lazy                        (ByteString)
import           Data.Semigroup                              (Semigroup ((<>)))
import qualified Data.Sequence                               as Seq
import qualified Data.Set                                    as S

import           Network.Riak.CRDT.Types
import qualified Network.Riak.Protocol.CounterOp             as PB
import qualified Network.Riak.Protocol.DtOp                  as PB
import qualified Network.Riak.Protocol.MapField              as PBMap
import qualified Network.Riak.Protocol.MapField.MapFieldType as PBMap
import qualified Network.Riak.Protocol.MapOp                 as PBMap
import qualified Network.Riak.Protocol.MapUpdate             as PBMap
import qualified Network.Riak.Protocol.MapUpdate.FlagOp      as PBFlag
import qualified Network.Riak.Protocol.SetOp                 as PBSet

counterUpdateOp :: [CounterOp] -> PB.DtOp
counterUpdateOp ops = PB.DtOp { PB.counter_op = Just $ counterOpPB ops,
                                PB.set_op = Nothing,
                                PB.map_op = Nothing
                              }

counterOpPB :: [CounterOp] -> PB.CounterOp
counterOpPB ops = PB.CounterOp (Just i)
    where CounterInc i = mconcat ops


data SetOpsComb = SetOpsComb { setAdds    :: S.Set ByteString,
                               setRemoves :: S.Set ByteString }
             deriving (Show)

instance Semigroup SetOpsComb where
    (SetOpsComb a b) <> (SetOpsComb x y) = SetOpsComb (a<>x) (b<>y)

instance Monoid SetOpsComb where
    mempty = SetOpsComb mempty mempty
    (SetOpsComb a b) `mappend` (SetOpsComb x y) = SetOpsComb (a<>x) (b<>y)

toOpsComb :: SetOp -> SetOpsComb
toOpsComb (SetAdd s)    = SetOpsComb (S.singleton s) S.empty
toOpsComb (SetRemove s) = SetOpsComb S.empty (S.singleton s)



setUpdateOp :: [SetOp] -> PB.DtOp
setUpdateOp ops = PB.DtOp { PB.counter_op = Nothing,
                            PB.set_op = Just $ setOpPB ops,
                            PB.map_op = Nothing
                          }

setOpPB :: [SetOp] -> PBSet.SetOp
setOpPB ops = PBSet.SetOp (toSeq adds) (toSeq rems)
    where SetOpsComb adds rems = mconcat . map toOpsComb $ ops
          toSeq = Seq.fromList . S.toList

flagOpPB :: FlagOp -> PBFlag.FlagOp
flagOpPB (FlagSet True)  = PBFlag.ENABLE
flagOpPB (FlagSet False) = PBFlag.DISABLE

registerOpPB :: RegisterOp -> ByteString
registerOpPB (RegisterSet x) = x

mapUpdateOp :: [MapOp] -> PB.DtOp
mapUpdateOp ops = PB.DtOp { PB.counter_op = Nothing,
                            PB.set_op = Nothing,
                            PB.map_op = Just $ mapOpPB ops }

mapOpPB :: [MapOp] -> PBMap.MapOp
mapOpPB ops = PBMap.MapOp rems updates
    where rems    = Seq.fromList [ toRemove f   | MapRemove f <- ops ]
          updates = Seq.fromList [ toUpdate f u | MapUpdate f u <- ops ]

toRemove :: MapField -> PBMap.MapField
toRemove (MapField t name) = toField name t

toUpdate :: MapPath -> MapValueOp -> PBMap.MapUpdate
toUpdate (MapPath (e :| [])) op     = toUpdate' e (mapEntryTag op) op
toUpdate (MapPath (e :| (r:rs))) op = toUpdate' e MapMapTag op'
    where op' = MapMapOp (MapUpdate (MapPath (r:|rs)) op)

toUpdate' :: ByteString -> MapEntryTag -> MapValueOp -> PBMap.MapUpdate
toUpdate' f t op = setSpecificOp op (updateNothing f t)

setSpecificOp :: MapValueOp -> PBMap.MapUpdate -> PBMap.MapUpdate
setSpecificOp (MapCounterOp cop) u  = u { PBMap.counter_op  = Just $ counterOpPB [cop] }
setSpecificOp (MapSetOp sop) u      = u { PBMap.set_op      = Just $ setOpPB [sop] }
setSpecificOp (MapRegisterOp rop) u = u { PBMap.register_op = Just $ registerOpPB rop }
setSpecificOp (MapFlagOp fop) u     = u { PBMap.flag_op     = Just $ flagOpPB fop }
setSpecificOp (MapMapOp mop) u      = u { PBMap.map_op      = Just $ mapOpPB [mop] }


updateNothing :: ByteString -> MapEntryTag -> PBMap.MapUpdate
updateNothing f t = PBMap.MapUpdate { PBMap.field = toField f t,
                                    PBMap.counter_op = Nothing,
                                    PBMap.set_op = Nothing,
                                    PBMap.register_op = Nothing,
                                    PBMap.flag_op = Nothing,
                                    PBMap.map_op = Nothing }

toField :: ByteString -> MapEntryTag -> PBMap.MapField
toField name t = PBMap.MapField { PBMap.name = name,
                                  PBMap.type' = typ t }
    where typ MapCounterTag  = PBMap.COUNTER
          typ MapSetTag      = PBMap.SET
          typ MapRegisterTag = PBMap.REGISTER
          typ MapFlagTag     = PBMap.FLAG
          typ MapMapTag      = PBMap.MAP
