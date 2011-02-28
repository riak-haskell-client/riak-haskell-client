-- |
-- Module:      Network.Riak.Resolvable
-- Copyright:   (c) 2011 MailRank, Inc.
-- License:     Apache
-- Maintainer:  Bryan O'Sullivan <bos@mailrank.com>
-- Stability:   experimental
-- Portability: portable
--
-- Storage and retrieval of data with automatic conflict resolution.

module Network.Riak.Resolvable
    (
      Resolvable(..)
    , ResolvableMonoid(..)
    ) where

import Network.Riak.Resolvable.Internal (Resolvable(..), ResolvableMonoid(..))
