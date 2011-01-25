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
    , getMany
    , put
    , putMany
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
import Network.Riak.Basic hiding (get, put, put_)
import Network.Riak.JSON.Monoid (get, getMany, put, putMany)
