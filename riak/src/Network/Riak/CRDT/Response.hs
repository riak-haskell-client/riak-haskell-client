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
import qualified Data.Map as Map
import           Data.Maybe (catMaybes)
import qualified Data.Riak.Proto as Proto

import           Network.Riak.CRDT.Types as CRDT
import           Network.Riak.Lens

get :: Proto.DtFetchResp -> Maybe CRDT.DataType
get resp = case resp ^. Proto.type' of
             Proto.DtFetchResp'COUNTER ->
                 DTCounter . Counter <$> ((^. Proto.maybe'counterValue) =<< (resp ^. Proto.maybe'value))
             Proto.DtFetchResp'SET ->
                 DTSet . setFromList . (^. Proto.setValue) <$> (resp ^. Proto.maybe'value)
             Proto.DtFetchResp'MAP ->
                 DTMap . deconstructMap . (^. Proto.mapValue) <$> (resp ^. Proto.maybe'value)

             -- We don't support hll or gset yet
             Proto.DtFetchResp'HLL -> Nothing
             Proto.DtFetchResp'GSET -> Nothing

deconstructMap :: [Proto.MapEntry] -> Map
deconstructMap = Map . Map.fromList . catMaybes . map f

f :: Proto.MapEntry -> Maybe (MapField, MapEntry)
f entry = sequenceA (MapField t (field ^. Proto.name), v)
    where field :: Proto.MapField
          field = entry ^. Proto.field
          type' :: Proto.MapField'MapFieldType
          type' = field ^. Proto.type'
          t :: MapEntryTag
          t = typeToTag type'
          v :: Maybe MapEntry
          v = case type' of
                Proto.MapField'COUNTER  -> MapCounter . Counter <$> (entry ^. Proto.maybe'counterValue)
                Proto.MapField'SET      -> Just . MapSet . setFromList $ (entry ^. Proto.setValue)
                Proto.MapField'REGISTER -> MapRegister . Register <$> (entry ^. Proto.maybe'registerValue)
                Proto.MapField'FLAG     -> MapFlag . Flag <$> (entry ^. Proto.maybe'flagValue)
                Proto.MapField'MAP      -> Just . MapMap . deconstructMap $ (entry ^. Proto.mapValue)

typeToTag :: Proto.MapField'MapFieldType -> MapEntryTag
typeToTag Proto.MapField'COUNTER  = MapCounterTag
typeToTag Proto.MapField'SET      = MapSetTag
typeToTag Proto.MapField'REGISTER = MapRegisterTag
typeToTag Proto.MapField'FLAG     = MapFlagTag
typeToTag Proto.MapField'MAP      = MapMapTag
