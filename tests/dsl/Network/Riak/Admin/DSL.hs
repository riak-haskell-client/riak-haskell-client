-- | A simple "riak-admin DSL", which is nothing more than strings of stitched
-- together riak-admin shell commands.

module Network.Riak.Admin.DSL
  ( -- * Riak admin commands
    waitForService
  , bucketTypeCreate
  , bucketTypeActivate
    -- * Riak admin runners
  , riakAdmin
  , riakAdminWith
  ) where

import Utils


-- | Bucket props string, e.g. "{\"props\":{\"n_val\":\"1\"}}"
type BucketProps = String

type BucketTypeName = String

-- | Docker container id or name
type ContainerId = String

-- | Erlang node name, e.g. "riak@172.17.0.2"
type NodeName = String

-- | riak-admin shell command
type RiakAdmin = String

-- | Riak service name, e.g. "yokozuna"
type ServiceName = String


-- | riak-admin wait-for-service
waitForService :: ServiceName -> Maybe NodeName -> RiakAdmin
waitForService name node =
  "riak-admin wait-for-service " ++ name ++ maybe "" (" " ++) node

-- | riak-admin bucket-type create
bucketTypeCreate :: BucketTypeName -> Maybe BucketProps -> RiakAdmin
bucketTypeCreate name props =
  "riak-admin bucket-type create " ++ name ++ maybe "" (" " ++) props

-- | riak-admin bucket-type activate
bucketTypeActivate :: BucketTypeName -> RiakAdmin
bucketTypeActivate name = "riak-admin bucket-type activate " ++ name


-- | Run a list of riak-admin commands locally, and throw an exception if any of
-- them fail.
riakAdmin :: [RiakAdmin] -> IO ()
riakAdmin = riakAdminWith ""

-- | Like 'riakAdmin', but prefix each command with the given 'String' (plus a
-- space).
riakAdminWith :: String -> [RiakAdmin] -> IO ()
riakAdminWith ""     = mapM_ shell
riakAdminWith prefix = mapM_ (\s -> shell (prefix ++ " " ++ s))
