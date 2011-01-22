module Network.Riak.Connection
    (
    -- * Connection management
      connect
    , disconnect
    -- * Client configuration
    , defaultClient
    , makeClientID
    -- * Requests and responses
    -- ** Sending and receiving
    , exchange
    , exchangeMaybe
    , exchange_
    -- ** Composing and parsing
    , putRequest
    , getResponse
    ) where

import Network.Riak.Connection.Internal
