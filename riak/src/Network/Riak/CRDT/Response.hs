-- |
-- Module:      Network.Riak.CRDT.Response
-- Copyright:   (c) 2016 Sentenai
-- Author:      Antonio Nikishaev <me@lelf.lu>
-- License:     Apache
-- Maintainer:  Tim McGilchrist <timmcgil@gmail.com>, Mark Hibberd <mark@hibberd.id.au>
-- Stability:   experimental
-- Portability: portable
--

{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE CPP #-}
module Network.Riak.CRDT.Response (get) where

#if __GLASGOW_HASKELL__ <= 708
import           Control.Applicative ((<$>))
import           Data.Traversable
#endif
import qualified Data.Sequence as Seq
import qualified Data.Map as Map
import           Data.Foldable (toList)
import           Data.Maybe (catMaybes)
import           Network.Riak.Protocol.DtFetchResponse (DtFetchResponse,value,type')
import           Network.Riak.Protocol.DtFetchResponse.DataType (DataType(..))
import           Network.Riak.Protocol.DtValue (counter_value,set_value,map_value)

import qualified Network.Riak.Protocol.MapEntry as M (MapEntry(..))
import qualified Network.Riak.Protocol.MapField as M
import qualified Network.Riak.Protocol.MapField.MapFieldType as M

import           Network.Riak.CRDT.Types as CRDT

get :: DtFetchResponse -> Maybe CRDT.DataType
get resp = case type' resp of
             COUNTER ->
                 DTCounter . Counter <$> (counter_value =<< value resp)
             SET ->
                 DTSet . setFromSeq . set_value <$> value resp
             MAP ->
                 DTMap . deconstructMap . map_value <$> value resp

deconstructMap :: Seq.Seq M.MapEntry -> Map
deconstructMap = Map . Map.fromList . catMaybes . map f . toList

f :: M.MapEntry -> Maybe (MapField, MapEntry)
f (M.MapEntry{..}) = sequenceA (MapField t name, v)
    where M.MapField{..} = field
          t :: MapEntryTag
          t = typeToTag type'
          v :: Maybe MapEntry
          v = case type' of
                M.COUNTER  -> MapCounter . Counter <$> counter_value
                M.SET      -> Just . MapSet . setFromSeq $ set_value
                M.REGISTER -> MapRegister . Register <$> register_value
                M.FLAG     -> MapFlag . Flag <$> flag_value
                M.MAP      -> Just . MapMap . deconstructMap $ map_value

typeToTag :: M.MapFieldType -> MapEntryTag
typeToTag M.COUNTER  = MapCounterTag
typeToTag M.SET      = MapSetTag
typeToTag M.REGISTER = MapRegisterTag
typeToTag M.FLAG     = MapFlagTag
typeToTag M.MAP      = MapMapTag
