#!/bin/bash

root="$(hg root)"

if [[ -z "$root" ]]; then
    echo "error: don't know where we are!" 1>&2
    exit 1
fi

cd "$root"

hprotoc="$(which hprotoc)"

if [[ -z "$hprotoc" ]]; then
    echo "error: can't continue without hprotoc" 1>&2
    echo "to fix:" 1>&2
    echo 1>&2
    echo "cabal install hprotoc" 1>&2
    exit 1
fi

sed -e 's/Rpb//g' -e 's/Req\>/Request/g' -e 's/Resp\>/Response/g' \
    -e 's/MapRedR/MapReduceR/g' \
    src/riakclient.proto src/riakextra.proto > src/Protocol.proto

(cd src && hprotoc -p Network/Riak Protocol.proto)

rm src/Protocol.proto
