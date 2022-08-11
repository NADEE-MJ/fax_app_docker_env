#! /bin/bash

set -e

read -p "Tag (nadeemj51/fax_env:latest): " TAG
read -p "Use Cache (yes): " CACHE

if [[ -z $TAG ]]; then
    TAG=nadeemj51/fax_env:latest
fi

args=( -t $TAG -f fax_env.dockerfile )

if [[ -z $CACHE ]]; then
    echo "********Building using cache********"
else
    echo "********Building without cache********"
    args+=(--no-cache)
fi

sudo docker build "${args[@]}" .

read -p "Push? (no): " PUSH

if [[ ! -z $PUSH ]]; then
    docker push nadeemj51/fax_env
fi
