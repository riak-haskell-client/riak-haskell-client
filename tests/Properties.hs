{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}

module Properties where

#if __GLASGOW_HASKELL__ < 710
import           Control.Applicative          ((<$>))
#endif
import qualified Data.ByteString.Lazy         as L
import           Data.Maybe
import qualified Network.Riak.Basic           as B
import           Network.Riak.Content         (binary)
import           Network.Riak.Types           as Riak
import           Test.QuickCheck.Monadic      (assert, monadicIO, run)
import           Test.Tasty
import           Test.Tasty.QuickCheck
import           Common

instance Arbitrary L.ByteString where
    arbitrary     = L.pack `fmap` arbitrary

newtype QCBucket = QCBucket Riak.Bucket deriving Show

instance Arbitrary QCBucket where
    arbitrary = QCBucket <$> arbitrary `suchThat` (not . L.null)

newtype QCKey = QCKey Riak.Key deriving Show

instance Arbitrary QCKey where
    arbitrary = QCKey <$> arbitrary `suchThat` (not . L.null)


t_put_get :: QCBucket -> QCKey -> L.ByteString -> Property
t_put_get (QCBucket b) (QCKey k) v =
    monadicIO $ assert . uncurry (==) =<< run act
  where
    act = withSomeConnection $ \c -> do
            p <- Just <$> B.put c b k Nothing (binary v) Default Default
            r <- B.get c b k Default
            return (p,r)


put_delete_get :: QCBucket -> QCKey -> L.ByteString -> Property
put_delete_get (QCBucket b) (QCKey k) v
    = monadicIO $ do
        r <- run act
        assert $ isNothing r
    where
      act = withSomeConnection $ \c -> do
              _ <- B.put c b k Nothing (binary v) Default Default
              B.delete c b k Default
              B.get c b k Default


tests :: [TestTree]
tests = [
 testProperty "t_put_get" t_put_get,
 testProperty "put_delete_get" put_delete_get
 ]



