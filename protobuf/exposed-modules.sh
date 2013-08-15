#!/bin/bash

protobuf=$((readlink $0 || printf $0) | xargs dirname)

if [[ -z "$protobuf" ]]; then
    echo "error: don't know where we are!" 1>&2
    exit 1
fi

cd "$protobuf"

find src/Network -name \*.hs |sort | sed -e 's/.hs//' -e 's:src/:    :' -e 's:/:.:g'
