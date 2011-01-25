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
    , Quorum(..)
    , get
    , put
    , put_
    , delete
    -- * Metadata
    , listBuckets
    , foldKeys
    , getBucket
    , setBucket
    -- * Map/reduce
    , mapReduce
    ) where

import Network.Riak.Connection
import Network.Riak.Types
import Network.Riak.Basic
