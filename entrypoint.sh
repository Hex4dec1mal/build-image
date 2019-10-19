#!/bin/sh -l

set -e

export IMAGE="${1}/${6}:${7}"

if [ -z "$9" ]; then
    docker build $4 -f $5 -t "${IMAGE}"
else
    docker build $4 -f $5 -t "${IMAGE}" --target "$9"
fi

echo $3 | docker login "${1}" -u "${2}" --password-stdin

push-image "${IMAGE}"

if [ ! -z "$8" ]; then
    export LATEST="${1}/${6}:${8}"
    docker tag "${IMAGE}" "${LATEST}"
    push-image "${LATEST}"
fi

docker logout "${1}"
