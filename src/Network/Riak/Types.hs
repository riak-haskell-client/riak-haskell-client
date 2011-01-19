module Network.Riak.Types
    (
      ClientID
    , Client(..)
    , Content
    , Connection(..)
    , Bucket
    , Key
    , Quorum
    , Q(..)
    , RW(..)
    , R(..)
    , W(..)
    , DW(..)
    , VClock
    , fromQuorum
    , toQuorum
    ) where

import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as L
import Data.IORef (IORef)
import Network.Socket
import Data.Word
import Network.Riakclient.RpbContent
import Network.Riak.Types.Internal
    
type ClientID = L.ByteString

data Client = Client {
      riakHost :: HostName
    , riakPort :: ServiceName
    , riakPrefix :: B.ByteString
    , riakMapReducePrefix :: B.ByteString
    , riakClientID :: ClientID
    } deriving (Eq, Show)

data Connection = Connection {
      connSock :: Socket
    , connClient :: Client
    , connBuffer :: IORef L.ByteString
    } deriving (Eq)

instance Show Connection where
    show conn = show "Connection " ++ riakHost c ++ ":" ++ riakPort c
        where c = connClient conn

type Bucket = L.ByteString

type Key = L.ByteString

data Q = Default
       | All
       | Quorum
       | One
         deriving (Eq, Enum, Show)

newtype RW = RW Q deriving (Eq, Show)
newtype R  = R Q deriving (Eq, Show)
newtype W  = W Q deriving (Eq, Show)
newtype DW = DW Q deriving (Eq, Show)

type Content = RpbContent

fromQ :: Q -> Word32
fromQ Default = 4294967291
fromQ All     = 4294967292
fromQ Quorum  = 4294967293
fromQ One     = 4294967294
{-# INLINE fromQ #-}

toQ :: Word32 -> Maybe Q
toQ 4294967291 = Just Default
toQ 4294967292 = Just All
toQ 4294967293 = Just Quorum
toQ 4294967294 = Just One
toQ _          = Nothing
{-# INLINE toQ #-}

class Quorum q where
    fromQuorum :: q -> Word32
    toQuorum :: Word32 -> Maybe q

instance Quorum Q where
    fromQuorum = fromQ
    {-# INLINE fromQuorum #-}

    toQuorum = toQ
    {-# INLINE toQuorum #-}

instance Quorum R where
    fromQuorum (R q) = fromQ q
    {-# INLINE fromQuorum #-}

    toQuorum = fmap R . toQ
    {-# INLINE toQuorum #-}

instance Quorum W where
    fromQuorum (W q) = fromQ q
    {-# INLINE fromQuorum #-}

    toQuorum = fmap W . toQ
    {-# INLINE toQuorum #-}

instance Quorum RW where
    fromQuorum (RW q) = fromQ q
    {-# INLINE fromQuorum #-}

    toQuorum = fmap RW . toQ
    {-# INLINE toQuorum #-}

instance Quorum DW where
    fromQuorum (DW q) = fromQ q
    {-# INLINE fromQuorum #-}

    toQuorum = fmap DW . toQ
    {-# INLINE toQuorum #-}
