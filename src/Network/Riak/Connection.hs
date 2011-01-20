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
    , sendRequest
    , recvResponse
    , recvMaybeResponse
    , recvResponse_
    -- ** Composing and parsing
    , putRequest
    , getResponse
    ) where

import Network.Riak.Connection.Internal
