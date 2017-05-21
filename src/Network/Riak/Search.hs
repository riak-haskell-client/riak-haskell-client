-- | module:    Network.Riak.Search
--   copyright: (c) 2016 Sentenai
--   author:    Antonio Nikishaev <me@lelf.lu>
--   license:   Apache
--
-- Solr search
--
-- http://docs.basho.com/riak/2.1.3/dev/using/search/
{-# LANGUAGE CPP #-}
module Network.Riak.Search
  ( IndexInfo
  , SearchResult(..)
  , Score
  , indexInfo
  , getIndex
  , putIndex
  , deleteIndex
  , searchRaw
  ) where

#if __GLASGOW_HASKELL__ <= 708
import           Control.Applicative
#endif
import           Data.Sequence (Seq)
import           Network.Riak.Connection.Internal
import           Network.Riak.Protocol.Content (Content)
import           Network.Riak.Protocol.YzIndex (YzIndex(YzIndex))
import qualified Network.Riak.Request as Req
import qualified Network.Riak.Response as Resp
import           Network.Riak.Types.Internal

-- | 'IndexInfo' smart constructor.
--
-- If 'Nothing', @schema@ defaults to @"_yz_default"@.
--
-- If 'Nothing', @n@ defaults to the default @n@ value for buckets that have not
-- explicitly set the property. In the default installation of @riak@, this is
-- 3 (see https://github.com/basho/riak_core/blob/develop/priv/riak_core.schema).
indexInfo :: Index -> Maybe Schema -> Maybe N -> IndexInfo
indexInfo = YzIndex

-- | Get an index info for @Just index@, or get all indexes for @Nothing@.
--
-- https://docs.basho.com/riak/kv/2.1.4/developing/api/protocol-buffers/yz-index-get/
getIndex :: Connection -> Maybe Index -> IO [IndexInfo]
getIndex conn ix = Resp.getIndex <$> exchange conn (Req.getIndex ix)

-- | Create a new index or modify an existing index.
--
-- https://docs.basho.com/riak/kv/2.1.4/developing/api/protocol-buffers/yz-index-put/
putIndex :: Connection -> IndexInfo -> Maybe Timeout -> IO (Seq Content, VClock)
putIndex conn info timeout = Resp.put <$> exchange conn (Req.putIndex info timeout)

-- | Delete an index.
--
-- https://docs.basho.com/riak/kv/2.1.4/developing/api/protocol-buffers/yz-index-delete/
deleteIndex :: Connection -> Index -> IO ()
deleteIndex conn ix = exchange_ conn (Req.deleteIndex ix)

-- | Search by raw 'SearchQuery' request (a 'Data.ByteString.Lazy.Bytestring')
-- using an 'Index'.
searchRaw :: Connection -> SearchQuery -> Index -> IO SearchResult
searchRaw conn q ix = Resp.search <$> exchange conn (Req.search q ix)
