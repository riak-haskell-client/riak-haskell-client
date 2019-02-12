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

import           Data.ByteString (ByteString)
import           Data.Semigroup (Semigroup((<>)))
import qualified Data.Set as S

import qualified Data.Riak.Proto as Proto
import           Network.Riak.CRDT.Types
import           Network.Riak.Lens

counterUpdateOp :: [CounterOp] -> Proto.DtOp
counterUpdateOp ops = Proto.defMessage & Proto.counterOp .~ counterOpPB ops

counterOpPB :: [CounterOp] -> Proto.CounterOp
counterOpPB ops = Proto.defMessage & Proto.increment .~ i
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



setUpdateOp :: [SetOp] -> Proto.DtOp
setUpdateOp ops = Proto.defMessage & Proto.setOp .~ setOpPB ops

setOpPB :: [SetOp] -> Proto.SetOp
setOpPB ops = Proto.defMessage & Proto.adds .~ S.toList adds
                               & Proto.removes .~ S.toList rems
    where SetOpsComb adds rems = mconcat . map toOpsComb $ ops

flagOpPB :: FlagOp -> Proto.MapUpdate'FlagOp
flagOpPB (FlagSet True)  = Proto.MapUpdate'ENABLE
flagOpPB (FlagSet False) = Proto.MapUpdate'DISABLE

registerOpPB :: RegisterOp -> ByteString
registerOpPB (RegisterSet x) = x

mapUpdateOp :: [MapOp] -> Proto.DtOp
mapUpdateOp ops = Proto.defMessage & Proto.mapOp .~ mapOpPB ops

mapOpPB :: [MapOp] -> Proto.MapOp
mapOpPB ops = Proto.defMessage & Proto.removes .~ rems
                               & Proto.updates .~ updates
    where rems    = [ toRemove f   | MapRemove f <- ops ]
          updates = [ toUpdate f u | MapUpdate f u <- ops ]

toRemove :: MapField -> Proto.MapField
toRemove (MapField t name) = toField name t

toUpdate :: MapPath -> MapValueOp -> Proto.MapUpdate
toUpdate (MapPath (e :| [])) op     = toUpdate' e (mapEntryTag op) op
toUpdate (MapPath (e :| (r:rs))) op = toUpdate' e MapMapTag op'
    where op' = MapMapOp (MapUpdate (MapPath (r:|rs)) op)

toUpdate' :: ByteString -> MapEntryTag -> MapValueOp -> Proto.MapUpdate
toUpdate' f t op = setSpecificOp op (updateNothing f t)

setSpecificOp :: MapValueOp -> Proto.MapUpdate -> Proto.MapUpdate
setSpecificOp (MapCounterOp cop)   = Proto.counterOp .~ counterOpPB [cop]
setSpecificOp (MapSetOp sop)       = Proto.setOp .~ setOpPB [sop]
setSpecificOp (MapRegisterOp rop)  = Proto.registerOp .~ registerOpPB rop
setSpecificOp (MapFlagOp fop)      = Proto.flagOp .~ flagOpPB fop
setSpecificOp (MapMapOp mop)       = Proto.mapOp .~ mapOpPB [mop]


updateNothing :: ByteString -> MapEntryTag -> Proto.MapUpdate
updateNothing f t = Proto.defMessage & Proto.field .~ toField f t

toField :: ByteString -> MapEntryTag -> Proto.MapField
toField name t = Proto.defMessage & Proto.name .~ name
                                  & Proto.type' .~ typ t
    where typ MapCounterTag  = Proto.MapField'COUNTER
          typ MapSetTag      = Proto.MapField'SET
          typ MapRegisterTag = Proto.MapField'REGISTER
          typ MapFlagTag     = Proto.MapField'FLAG
          typ MapMapTag      = Proto.MapField'MAP
