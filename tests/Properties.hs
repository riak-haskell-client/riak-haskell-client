{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}

module Properties where

#if __GLASGOW_HASKELL__ < 710
import           Control.Applicative          ((<$>))
#endif
import qualified Data.ByteString.Lazy         as L
import           Data.IORef                   (IORef, modifyIORef, newIORef)
import qualified Data.Map                     as M
import           Data.Text                    (Text)
import           Network.Riak                 (getByIndex)
import qualified Network.Riak.Basic           as B
import           Network.Riak.Connection      (defaultClient)
import           Network.Riak.Connection.Pool (Pool, create, withConnection)
import           Network.Riak.Content         (binary)
import qualified Network.Riak.JSON            as J
import           Network.Riak.Resolvable      (ResolvableMonoid (..))
import           Network.Riak.Types           (Bucket, IndexQuery (..),
                                               IndexValue (..), Key,
                                               Quorum (..))
import           System.IO.Unsafe             (unsafePerformIO)
import qualified Test.HUnit                   as HU
import           Test.QuickCheck.Monadic      (assert, monadicIO, run)
import           Test.Tasty
import           Test.Tasty.HUnit             hiding (assert)
import           Test.Tasty.QuickCheck

instance Arbitrary L.ByteString where
    arbitrary     = L.pack `fmap` arbitrary

cruft :: IORef [(Bucket, Key)]
{-# NOINLINE cruft #-}
cruft = unsafePerformIO $ newIORef []

pool :: Pool
{-# NOINLINE pool #-}
pool = unsafePerformIO $
       create defaultClient 1 1 1

t_put_get :: Bucket -> Key -> L.ByteString -> Property
t_put_get b k v =
    notempty b && notempty k ==> monadicIO $ assert . uncurry (==) =<< run act
  where
    act = withConnection pool $ \c -> do
            modifyIORef cruft ((b,k):)
            p <- Just <$> B.put c b k Nothing (binary v) Default Default
            r <- B.get c b k Default
            return (p,r)
    notempty = not . L.null

t_indexed_put_get :: HU.Assertion
t_indexed_put_get = withConnection pool $ \c -> do
    let b = "riak-haskell-client-test"
        k = "test"
    _ <- J.putIndexed c b k [(IndexInt "someindex" 135)] Nothing
         (RM (M.fromList [("somekey", "someval")] :: M.Map Text Text))
         Default Default
    keys <- getByIndex c b (IndexQueryExactInt "someindex" 135)
    HU.assertEqual "" ["test"] keys

properties :: [TestTree]
properties = [ testProperty "t_put_get" t_put_get
             , testCase "t_indexed_put_get" t_indexed_put_get
#ifdef TEST2I
             , testCase "t_indexed_put_get" t_indexed_put_get
#endif
             ]

tests :: [TestTree]
tests =
    [ testProperty "t_put_get" t_put_get
#ifdef TEST2I
    , testCase "t_indexed_put_get" t_indexed_put_get
#endif
    ]
