module Network.Riak
    (
    -- * Client configuration and identification
      ClientID
    , Client(..)
    , defaultClient
    , getClientID
    -- * Connection management
    , Connection(..)
    , connect
    , disconnect
    , ping
    , getServerInfo
    -- * Data management
    , get
    , put
    , delete
    -- * Metadata
    , listBuckets
    , listKeys
    , getBucket
    , setBucket
    -- * Map/reduce
    , mapReduce
    ) where

import Network.Riak.Connection
import Network.Riak.Types
import Network.Riak.Simple
