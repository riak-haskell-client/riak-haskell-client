-- |   module:    CRDTProperties
--     copyright: (c) 2016 Sentenai
--     author:    Antonio Nikishaev <me@lelf.lu>
--     license:   Apache
--
{-# LANGUAGE OverloadedStrings, FlexibleContexts, TupleSections, ScopedTypeVariables,
    GADTs, StandaloneDeriving, UndecidableInstances, PatternGuards, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module CRDTProperties (prop_counters,
                       prop_sets,
                       prop_maps,
                       tests) where

-- |
-- The idea: send arbitrary stream of commands to riak, collect each
-- command output to list :: [Maybe RiakReturnValue].  Then see it we
-- get the same list of results simulating Riak in this module.

import Control.Applicative
import Control.Monad.RWS
import Data.ByteString.Lazy (ByteString)
import Data.Default.Class
import Data.List.NonEmpty
import qualified Data.Map as Map
import Data.Maybe
import Data.Proxy
import qualified Data.Set as Set
import Test.QuickCheck
import Test.QuickCheck.Monadic

import Common
import Test.Tasty
import Test.Tasty.QuickCheck

import qualified Network.Riak.Basic as B
import qualified Network.Riak.CRDT  as C

newtype BucketType = BucketType ByteString deriving (Show,Eq,Ord)
newtype Bucket     = Bucket ByteString deriving (Show,Eq,Ord)
newtype Key        = Key ByteString deriving (Show,Eq,Ord)
newtype Value      = Value ByteString deriving Show

class Values a where values :: [a]

-- Not many. We want to hit each multiple times
instance Values BucketType where values = BucketType <$> ["sets","counters","maps"]
instance Values Bucket     where values = Bucket <$> ["A","B"]
instance Values Key        where values = Key <$> ["a","b","c"]
instance Values Value      where values = Value <$> ["1","2","3","4"]

instance Arbitrary BucketType where arbitrary = elements values
instance Arbitrary Bucket     where arbitrary = elements values
instance Arbitrary Key        where arbitrary = elements values
instance Arbitrary Value      where arbitrary = elements values

data Point = Point BucketType Bucket Key deriving (Show,Ord,Eq)
instance Values Point where
    values = [ Point t b k | t <- values, b <- values, k <- values ]

instance Arbitrary Point where arbitrary = elements values

type RiakState = Map.Map Point C.DataType


-- | observe all current values we care about (instance 'Values') in
--   riak, gather them into a map.
--
-- As it turns out, observeRiak is not quite cheap operation after
-- /types/maps/… are populated. So first argument is proxy for the
-- (only) type we are interested in.
observeRiak :: Action a op => Proxy a -> IO RiakState
observeRiak p = Map.fromList . catMaybes <$> observeRiak' (BucketType $ bucketType p)

observeRiak' :: BucketType -> IO [Maybe (Point, C.DataType)]
observeRiak' bt@(BucketType t_) = withSomeConnection $ \c ->
       sequence [ do r <- C.get c t_ b_ k_
                     pure . fmap (p,) $ r
                  | b <- values, k <- values,
                    let p@(Point _ (Bucket b_) (Key k_)) = Point bt b k
                ]


-- | We will supply a list of these operations:
--
-- For each Action a op => a,
data Op a op = Get Bucket Key       -- ^ we can get a value
             | Update Bucket Key op -- ^ we can update a value

deriving instance (Show op, C.CRDT a o) => Show (Op a op)

class (Show t, C.CRDT t op, Default t) => Action t op where
    -- | bucket type for this type (assumed/hardcoded)
    bucketType :: Proxy t -> ByteString
    -- | extract a value from 'C.DataType', or throw an error
    fromDT :: C.DataType -> t
    -- | pack a value into 'C.DataType'
    toDT :: t -> C.DataType
    -- | a kludge (or two), see 'update': if there's no value at the
    -- moment, having been provieded with an op, will riak create and
    -- operate on a empty value?
    updateCreates :: Proxy t -> Maybe C.DataType -> op -> Bool
    -- | is operation target there?
    targetThere :: Maybe C.DataType -> op -> Bool


instance Action C.Counter C.CounterOp where
    bucketType _ = "counters"
    fromDT (C.DTCounter c) = c
    fromDT _               = error "expected counter" -- ok for tests
    toDT = C.DTCounter
    updateCreates _ _ _ = True
    targetThere _ _ = True

instance Action C.Set C.SetOp where
    bucketType _ = "sets"
    fromDT (C.DTSet c) = c
    fromDT _           = error "expected set"
    toDT = C.DTSet
    updateCreates _ _ C.SetAdd{}    = True
    updateCreates _ _ C.SetRemove{} = False
    targetThere _ _ = True

instance Action C.Map C.MapOp where
    bucketType _ = "maps"
    fromDT (C.DTMap c) = c
    fromDT _           = error "expected map"
    toDT = C.DTMap
    -- Riak will operate on default value inside map if it's not there.
    -- Except while it's SetRemove.
    updateCreates _ _ (C.MapUpdate _ (C.MapSetOp C.SetRemove{})) = False
    updateCreates _ _ _                                          = True

    targetThere (Just (C.DTMap m)) (C.MapUpdate path _)
        | Just{} <- C.xlookup path C.MapSetTag m = True
    targetThere _ _ = False

-- | Many Arbitrary instances.
-- TODO: 'Generic' arbitrary

instance (Arbitrary a, Arbitrary op) => Arbitrary (Op a op) where
    arbitrary = oneof [
                 Get <$> arbitrary <*> arbitrary,
                 Update <$> arbitrary <*> arbitrary <*> arbitrary
                ]

instance Arbitrary C.Counter where
    arbitrary = C.Counter <$> arbitrary

instance Arbitrary C.CounterOp where
    arbitrary = C.CounterInc <$> choose (-16,16) -- https://github.com/basho/riak/issues/804

instance Arbitrary C.SetOp where
    arbitrary = oneof [
                 C.SetAdd <$> arbitrary, C.SetRemove <$> arbitrary
                ]

instance Arbitrary C.FlagOp where
    arbitrary = C.FlagSet <$> arbitrary

instance Arbitrary C.Set where
    arbitrary = C.Set . Set.fromList <$> arbitrary

instance Arbitrary ByteString where
    arbitrary = elements [ "foo", "bar", "baz" ]

instance Arbitrary C.MapOp where
    arbitrary = C.MapUpdate <$> arbitrary <*> arbitrary

instance Arbitrary C.MapPath where
    arbitrary = (\a b -> C.MapPath (a :| b)) <$> arbitrary <*> arbitrary

instance Arbitrary C.MapField where
    arbitrary = C.MapField <$> arbitrary <*> arbitrary

instance Arbitrary C.MapEntryTag where
    arbitrary = elements [ C.MapCounterTag ]

instance Arbitrary C.MapValueOp where
    arbitrary = oneof [ C.MapCounterOp <$> arbitrary,
                        C.MapSetOp <$> arbitrary,
                        C.MapFlagOp <$> arbitrary ]

-- TODO Fix this
instance Arbitrary C.Map

-- | Abstract machine.
-- Yields a value on 'Get', modifies state on 'Update'.
machine :: (MonadWriter [Maybe C.DataType] m,
            MonadState s m,
            Applicative m,
            Action t op)
        => Proxy t -> [Op t op]
        -> (Op t op -> s -> m (Either (Maybe C.DataType) s)) -> m ()

machine _ [] _ = pure ()

machine p (a@Get{} : as) onAct = do
  v <- get
  Left r <- onAct a v
  tell [r]
  machine p as onAct

machine p (a@Update{} : as) onAct = do
  v <- get
  Right r <- onAct a v
  put r
  machine p as onAct



-- | Riak version of the 'machine'.
-- State is 'B.Connection', get/update are IO-requests to riak.
riak :: (MonadWriter [Maybe C.DataType] m,
         MonadState B.Connection m,
         Applicative m, MonadIO m,
         Action t op)
      => Proxy t -> [Op t op] -> m ()

riak p ops = machine p ops onAct
    where onAct (Get (Bucket b) (Key k)) c
              = liftIO $ Left <$> C.get c bt b k
          onAct (Update (Bucket b) (Key k) op) c
              = do liftIO $ C.sendModify c bt b k [op]
                   pure $ Right c
          bt = bucketType p



-- | Haskell emulation version of the 'machine'.
-- State is 'RiakState', get/update try to match riak's behaviour.
pure_ :: (MonadWriter [Maybe C.DataType] m,
          MonadState RiakState m,
          Applicative m,
          Action t op)
      => Proxy t -> [Op t op] -> m ()

pure_ p ops = machine p ops onAct
    where
      onAct (Get b k) v       = pure . Left $ Map.lookup (point b k) v
      onAct (Update b k op) v = pure . Right $ Map.alter (update op) (point b k) v
      point b k = Point (BucketType (bucketType p)) b k



update :: forall a op. (Action a op) =>
          op -> Maybe C.DataType -> Maybe C.DataType
update op dt
    -- | Dear diary, this is getting out of hand. It'd be far easier to
    -- not bother and assume Nothing ≡ Just mempty in test conditions.
    --
    -- …but let's continue to bother and gain more safety.
    | Just d <- dt, targetThere dt op
        = operate d
    | updateCreates (Proxy :: Proxy a) dt op
        -- it's sometimes ok to update even a non-set value in riak's mind
        = operate $ maybe surrogate id dt
    | otherwise
        = dt
    where fromDT' :: C.DataType -> a
          fromDT' = fromDT
          toDT' :: a -> C.DataType
          toDT' = toDT
          surrogate = toDT' def
          operate = Just . toDT . C.modify op . fromDT'



doRiak :: Action a op =>
          Proxy a -> [Op a op] -> IO [Maybe C.DataType]
doRiak p ops = withSomeConnection $ \conn -> do
                   --print ops
                   (_,_,r) <- runRWST (riak p ops) () conn
                   pure r

doPure :: (Action a op, Show op) =>
          RiakState -> Proxy a -> [Op a op] -> PropertyM IO [Maybe C.DataType]
doPure stat p ops = do (_,_,r) <- runRWST (pure_ p ops) () stat
                       pure r




prop :: (Show op, Action a op) =>
        Proxy a -> [Op a op] -> Property
prop p ops = monadicIO $ do
                          stat <- run $ observeRiak p
                          r1 <- doPure stat p ops
                          r2 <- run $ doRiak p ops
                          run . when (r1/=r2) $ print (r1,r2)
                          assert $ r1 == r2


prop_counters :: [Op C.Counter C.CounterOp] -> Property
prop_counters = prop (Proxy :: Proxy C.Counter)

prop_sets :: [Op C.Set C.SetOp] -> Property
prop_sets = prop (Proxy :: Proxy C.Set)

prop_maps :: [Op C.Map C.MapOp] -> Property
prop_maps = prop (Proxy :: Proxy C.Map)



tests :: TestTree
tests = testGroup "CRDT quickCheck" [
         testProperty "counters" prop_counters,
         testProperty "sets" prop_sets,
         testProperty "maps" prop_maps
        ]
