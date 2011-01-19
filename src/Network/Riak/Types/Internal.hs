module Network.Riak.Types.Internal
    (
     VClock(..)
    ) where

import qualified Data.ByteString.Lazy as L
import Data.Digest.Pure.MD5 (md5)

newtype VClock = VClock {
      fromVClock :: L.ByteString
    } deriving (Eq)

instance Show VClock where
    show (VClock s) = "VClock " ++ show (md5 s)
