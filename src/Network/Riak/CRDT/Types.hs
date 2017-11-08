-- |
-- Module:      Network.Riak.CRDT.Types
-- Copyright:   (c) 2016 Sentenai
-- Author:      Antonio Nikishaev <me@lelf.lu>
-- License:     Apache
-- Maintainer:  Tim McGilchrist <timmcgil@gmail.com>, Mark Hibberd <mark@hibberd.id.au>
-- Stability:   experimental
-- Portability: portable
--
-- Haskell-side view of CRDT
--
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveGeneric #-}

module Network.Riak.CRDT.Types (
    -- * Types
    DataType(..)
    -- ** Counters
  , Counter(..), Count
    -- *** Modification
  , CounterOp(..)
    -- ** Sets
  , Set(..)
    -- *** Modification
  , SetOp(..)
    -- ** Maps
  , Map(..), MapContent
  , MapField(..)
  , MapEntry(..)
    -- *** Inspection
  , xlookup
    -- *** Modification
  , MapOp(..), MapPath(..), MapValueOp(..), mapUpdate, (-/)
    -- ** Registers
  , Register(..)
    -- *** Modification
  , RegisterOp(..)
    -- ** Flags
  , Flag(..)
    -- *** Modification
  , FlagOp(..)
    -- * Misc
  , NonEmpty(..), mapEntryTag, setFromSeq, MapEntryTag(..)
  ) where

import           Control.DeepSeq (NFData)
import           Data.ByteString.Lazy (ByteString)
import           Data.Default.Class
import qualified Data.Foldable as F
import           Data.Int (Int64)
import           Data.List.NonEmpty
import qualified Data.Map.Strict as M
import           Data.Semigroup
import qualified Data.Sequence as Seq
import qualified Data.Set as S
import           Data.String (IsString(..))
import           GHC.Generics (Generic)


-- | CRDT Map is indexed by MapField, which is a name tagged by a type
-- (there may be different entries with the same name, but different
-- types)
data MapField = MapField MapEntryTag ByteString deriving (Eq,Ord,Show,Generic)

instance NFData MapField

-- | CRDT Map is a Data.Map indexed by 'MapField' and holding
-- 'MapEntry'.
--
-- Maps are specials in a way that they can additionally
-- hold 'Flag's, 'Register's, and most importantly, other 'Map's.
newtype Map = Map MapContent deriving (Eq,Show,Generic)

instance NFData Map

type MapContent = M.Map MapField MapEntry

instance Default Map where
    def = Map M.empty

data MapEntryTag = MapCounterTag
                 | MapSetTag
                 | MapRegisterTag
                 | MapFlagTag
                 | MapMapTag
                   deriving (Eq,Ord,Show,Generic)

instance NFData MapEntryTag

-- | CRDT Map holds values of type 'MapEntry'
data MapEntry = MapCounter !Counter
              | MapSet !Set
              | MapRegister !Register
              | MapFlag !Flag
              | MapMap !Map
                deriving (Eq,Show,Generic)

instance NFData MapEntry


mapEntryTag :: MapValueOp -> MapEntryTag
mapEntryTag MapCounterOp{}  = MapCounterTag
mapEntryTag MapSetOp{}      = MapSetTag
mapEntryTag MapRegisterOp{} = MapRegisterTag
mapEntryTag MapFlagOp{}     = MapFlagTag
mapEntryTag MapMapOp{}      = MapMapTag


-- | Selector (“xpath”) inside 'Map'
newtype MapPath = MapPath (NonEmpty ByteString) deriving (Eq,Show)


-- | map operations
-- It's easier to use 'mapUpdate':
--
-- >>> "x" -/ "y" -/ "z" `mapUpdate` SetAdd "elem"
-- MapUpdate (MapPath ("x" :| ["y","z"])) (MapCounterOp (CounterInc 1))
data MapOp = MapRemove MapField           -- ^ remove value in map
           | MapUpdate MapPath MapValueOp -- ^ update value on path by operation
    deriving (Eq,Show)


-- | Polymprhic version of MapOp for nicer syntax
data MapOp_ op = MapRemove_ MapField
               | MapUpdate_ MapPath op
    deriving Show


instance IsString MapPath where
    fromString s = MapPath (fromString s :| [])

(-/) :: ByteString -> MapPath -> MapPath
e -/ (MapPath p) = MapPath (e <| p)

infixr 6 -/

class IsMapOp op where toValueOp :: op -> MapValueOp
instance IsMapOp CounterOp  where toValueOp = MapCounterOp
instance IsMapOp FlagOp     where toValueOp = MapFlagOp
instance IsMapOp RegisterOp where toValueOp = MapRegisterOp
instance IsMapOp SetOp      where toValueOp = MapSetOp


mapUpdate :: IsMapOp o => MapPath -> o -> MapOp
p `mapUpdate` op = MapUpdate p (toValueOp op)

infixr 5 `mapUpdate`



-- | Lookup a value of a given 'MapEntryTag' type on a given 'MapPath'
-- inside a map
--
-- >>> lookup ("a" -/ "b") MapFlagTag $ { "a"/Map: { "b"/Flag: Flag False } } -- pseudo
-- Just (MapFlag (Flag False))
xlookup :: MapPath -> MapEntryTag -> Map -> Maybe MapEntry
xlookup (MapPath (e :| [])) tag (Map m) = M.lookup (MapField tag e) m
xlookup (MapPath (e :| (r:rs))) tag (Map m)
    | Just (MapMap m') <- inner = xlookup (MapPath (r :| rs)) tag m'
    | otherwise                 = Nothing
    where inner = M.lookup (MapField MapMapTag e) m




-- | Registers can be set to a value
--
-- >>> RegisterSet "foo"
data RegisterOp = RegisterSet !ByteString deriving (Eq,Show)

-- | Flags can be enabled / disabled
--
-- >>> FlagSet True
data FlagOp = FlagSet !Bool deriving (Eq,Show)

-- | Flags can only be held as a 'Map' element.
--
-- Flag can be set or unset
--
-- >>> Flag False
newtype Flag = Flag Bool deriving (Eq,Ord,Show,Generic)

instance NFData Flag

-- | Last-wins monoid for 'Flag'
instance Monoid Flag where
    mempty = Flag False
    mappend = (<>)

-- | Last-wins semigroup for 'Flag'
instance Semigroup Flag where
    a <> b = getLast (Last a <> Last b)

instance Default Flag where
    def = mempty

-- | Registers can only be held as a 'Map' element.
--
-- Register holds a 'ByteString'.
newtype Register = Register ByteString deriving (Eq,Show,Generic)

instance NFData Register

-- | Last-wins monoid for 'Register'
instance Monoid Register where
    mempty = Register ""
    mappend = (<>)

instance Semigroup Register where
    a <> b = getLast (Last a <> Last b)

instance Default Register where
    def = mempty



-- | Operations on map values
data MapValueOp = MapCounterOp !CounterOp
                | MapSetOp !SetOp
                | MapRegisterOp !RegisterOp
                | MapFlagOp !FlagOp
                | MapMapOp !MapOp
                  deriving (Eq,Show)


-- | CRDT ADT.
--
-- 'Network.Riak.CRDT.Riak.get' operations return value of this type
data DataType = DTCounter Counter
              | DTSet Set
              | DTMap Map
                deriving (Eq,Show,Generic)

instance NFData DataType

-- | CRDT Set is a Data.Set
--
-- >>> Set (Data.Set.fromList ["foo","bar"])
newtype Set = Set (S.Set ByteString) deriving (Eq,Ord,Show,Generic,Monoid)

instance NFData Set

instance Semigroup Set where
    Set a <> Set b = Set (a <> b)

instance Default Set where
    def = Set mempty

-- | CRDT Set operations
data SetOp = SetAdd ByteString    -- ^ add element to the set
                                  --
                                  -- >>> SetAdd "foo"
           | SetRemove ByteString -- ^ remove element from the set
                                  --
                                  -- >>> SetRemove "bar"
             deriving (Eq,Show)

setFromSeq :: Seq.Seq ByteString -> Set
setFromSeq = Set . S.fromList . F.toList

-- | CRDT Counter hold a integer 'Count'
--
-- >>> Counter 42
newtype Counter = Counter Count deriving (Eq,Ord,Num,Show,Generic)
type Count = Int64

instance NFData Counter

instance Semigroup Counter where
    Counter a <> Counter b = Counter . getSum $ Sum a <> Sum b

instance Monoid Counter where
    mempty = Counter 0
    mappend = (<>)

instance Default Counter where
    def = mempty

-- | Counters can be incremented/decremented
--
-- >>> CounterInc 1
data CounterOp = CounterInc !Count deriving (Eq,Show)

instance Semigroup CounterOp where
    CounterInc x <> CounterInc y = CounterInc . getSum $ Sum x <> Sum y

instance Monoid CounterOp where
    mempty = CounterInc 0
    CounterInc x `mappend` CounterInc y = CounterInc . getSum $ Sum x <> Sum y
