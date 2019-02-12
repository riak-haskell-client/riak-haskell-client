#!/bin/sh

OUTDIR=src-proto

echo "Generating $OUTDIR/Proto/Riak.hs"
echo "Generating $OUTDIR/Proto/Riak_Fields.hs"

echo 'syntax = "proto2";' > riak.proto
cat proto/*.proto >> riak.proto

protoc \
  --plugin=protoc-gen-haskell=$(which proto-lens-protoc) \
  --haskell_out="$OUTDIR" riak.proto

rm riak.proto
