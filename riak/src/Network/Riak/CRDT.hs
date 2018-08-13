{-# LANGUAGE CPP                 #-}
{- | module:    Network.Riak.CRDT
     copyright: (c) 2016 Sentenai
     author:    Antonio Nikishaev <me@lelf.lu>
     license:   Apache

CRDT operations

* Haskell-side

    * Haskell values: 'Counter', 'Set' etc

    * ADT for operations: 'CounterOp', 'SetOp' etc

    * 'modify' to locally modify a value (matching riak-side behaviour)

* Riak-side

    * 'get' to get a current value

    * 'sendModify' to ask Riak to apply modifications

TL;DR example

>>> let c = Counter 41
>>> let op = CounterInc 1
>>> modify op c
Counter 42
>>> get conn "counters" "bucket" "key"
Just (DTCounter (Counter 41))
>>> sendModify conn "counters" "bucket" "key" [op] >> get conn "counters" "bucket" "key"
Just (DTCounter (Counter 42))

-}
{-# LANGUAGE TypeFamilies, OverloadedStrings, ScopedTypeVariables, PatternGuards #-}
{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}

module Network.Riak.CRDT (
    module X
  , get
  , CRDT(..)
  ) where

import Data.Default.Class
import qualified Data.Map as M
import Data.Proxy
#if __GLASGOW_HASKELL__ < 804
import Data.Semigroup
#endif
import qualified Data.Set as S
import Network.Riak.CRDT.Ops
import Network.Riak.CRDT.Riak
import Network.Riak.CRDT.Types as X
import Network.Riak.Types


-- | Modify a counter by applying operations ops
modifyCounter :: CounterOp -> Counter -> Counter
modifyCounter op c = c <> Counter i
    where CounterInc i = op



-- | Modify a set by applying operations ops
modifySet :: SetOp -> Set -> Set
modifySet op (Set c) = Set (c `S.union` adds S.\\ rems)
    where SetOpsComb adds rems = toOpsComb op


modifyMap :: MapOp -> Map -> Map
modifyMap (MapRemove field) (Map mc) = Map $ M.delete field mc
modifyMap (MapUpdate path op) m = modifyMap1 path op m


modifyMap1 :: MapPath -> MapValueOp -> Map -> Map
modifyMap1 (MapPath (e :| [])) op m = modMap mf op m
    where mf = MapField (mapEntryTag op) e
modifyMap1 (MapPath (e :| (r:rs))) op (Map m')
    = Map $ M.alter (Just . f) (MapField MapMapTag e) m'
      where f :: Maybe MapEntry -> MapEntry
            f Nothing = f (Just $ MapMap def)
            f (Just (MapMap m)) = MapMap . modifyMap1 (MapPath (r :| rs)) op $ m
            f (Just z) = z

modMap :: MapField -> MapValueOp -> Map -> Map
modMap ix op (Map m) = Map $ M.alter (Just . modifyMapValue op) ix m


modifyMapValue :: MapValueOp -> Maybe MapEntry -> MapEntry
modifyMapValue (MapSetOp op)      = modifyEntry (Proxy :: Proxy Set) op
modifyMapValue (MapCounterOp op)  = modifyEntry (Proxy :: Proxy Counter) op
modifyMapValue (MapMapOp op)      = modifyEntry (Proxy :: Proxy Map) op
modifyMapValue (MapFlagOp op)     = modifyEntry (Proxy :: Proxy Flag) op
modifyMapValue (MapRegisterOp op) = modifyEntry (Proxy :: Proxy Register) op


modifyFlag :: FlagOp -> Flag -> Flag
modifyFlag (FlagSet x) = const (Flag x)

modifyRegister :: RegisterOp -> Register -> Register
modifyRegister (RegisterSet x) = const (Register x)


-- | Types that can be held inside 'Map'
class Default a => MapCRDT a where
    type MapOperation_ a :: *
    mapModify :: MapOperation_ a -> a -> a

    -- | modify a maybe-absent 'MapEntry'
    modifyEntry :: Proxy a -> MapOperation_ a -> Maybe MapEntry -> MapEntry
    modifyEntry _ op Nothing = toEntry . mapModify op $ (def :: a)
    modifyEntry _ op (Just e) | Just v <- fromEntry e = toEntry . mapModify op $ (v :: a)
                              | otherwise             = e
    toEntry :: a -> MapEntry
    fromEntry :: MapEntry -> Maybe a


instance MapCRDT Flag where
    type MapOperation_ Flag = FlagOp
    mapModify = modifyFlag
    fromEntry (MapFlag f) = Just f
    fromEntry _ = Nothing
    toEntry = MapFlag

instance MapCRDT Set where
    type MapOperation_ Set = SetOp
    mapModify = modify
    fromEntry (MapSet s) = Just s
    fromEntry _ = Nothing
    toEntry = MapSet

instance MapCRDT Counter where
    type MapOperation_ Counter = CounterOp
    mapModify = modify
    fromEntry (MapCounter s) = Just s
    fromEntry _ = Nothing
    toEntry = MapCounter

instance MapCRDT Register where
    type MapOperation_ Register = RegisterOp
    mapModify = modifyRegister
    fromEntry (MapRegister s) = Just s
    fromEntry _ = Nothing
    toEntry = MapRegister


instance MapCRDT Map where
    type MapOperation_ Map = MapOp
    mapModify = modify
    fromEntry (MapMap s) = Just s
    fromEntry _ = Nothing
    toEntry = MapMap


-- | CRDT types
class MapCRDT a => CRDT a op | a -> op, op -> a where
    -- | Modify a value by applying an operation
    modify :: op -> a -> a

    -- | Request riak a modification
    sendModify :: Connection
               -> BucketType -> Bucket -> Key
               -> [op] -> IO ()

instance CRDT Counter CounterOp where
    modify = modifyCounter
    sendModify = counterSendUpdate

instance CRDT Set SetOp where
    modify = modifySet
    sendModify = setSendUpdate

instance CRDT Map MapOp where
    modify = modifyMap
    sendModify = mapSendUpdate
