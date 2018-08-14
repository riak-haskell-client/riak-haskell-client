-- |
-- Module:      Network.Riak.CRDT.Riak
-- Copyright:   (c) 2016 Sentenai
-- Author:      Antonio Nikishaev <me@lelf.lu>
-- License:     Apache
-- Maintainer:  Tim McGilchrist <timmcgil@gmail.com>, Mark Hibberd <mark@hibberd.id.au>
-- Stability:   experimental
-- Portability: portable
--
-- CRDT operations
--
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE CPP #-}

module Network.Riak.CRDT.Riak (
    counterSendUpdate
  , setSendUpdate
  , mapSendUpdate
  , get
  ) where

#if __GLASGOW_HASKELL__ <= 708
import           Control.Applicative
import           Data.Int
#endif

import           Control.Exception (catchJust)

import qualified Data.ByteString.Lazy as BS

import qualified Network.Riak.CRDT.Request as Req
import qualified Network.Riak.CRDT.Response as Resp
import qualified Network.Riak.CRDT.Types as CRDT
import qualified Network.Riak.Connection as Conn
import qualified Network.Riak.Protocol.ErrorResponse as ER
import           Network.Riak.Types


counterSendUpdate :: Connection -> BucketType -> Bucket -> Key
                  -> [CRDT.CounterOp] -> IO ()
counterSendUpdate conn t b k ops = Conn.exchange_ conn $ Req.counterUpdate ops t b k


setSendUpdate :: Connection -> BucketType -> Bucket -> Key
              -> [CRDT.SetOp] -> IO ()
setSendUpdate conn t b k ops = handleEmpty . Conn.exchange_ conn $ Req.setUpdate ops t b k


mapSendUpdate :: Connection -> BucketType -> Bucket -> Key
              -> [CRDT.MapOp] -> IO ()
mapSendUpdate conn t b k ops = handleEmpty . Conn.exchange_ conn $ Req.mapUpdate ops t b k


get :: Connection -> BucketType -> Bucket -> Key
    -> IO (Maybe CRDT.DataType)
get conn t b k = Resp.get <$> Conn.exchange conn (Req.get t b k)


-- | Ignore a ‘not_present’ error on update.
--
-- This is a bit hacky, but that's the behaviour we want.
--
-- TODO: Add custom exceptions to riak-haskell-client and just catch a
-- NotPresent exception here
handleEmpty :: IO () -> IO ()
handleEmpty act = catchJust
                  (\(e :: ER.ErrorResponse) ->
                       if | "{precondition,{not_present,"
                               `BS.isPrefixOf` ER.errmsg e -> Just ()
                          | otherwise                      -> Nothing
                  )
                  act
                  pure
