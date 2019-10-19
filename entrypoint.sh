#!/bin/sh -l

set -e

export IMAGE="${1}/${6}:${7}"

if [ -z "${9}" ]; then
    sh -c "docker build ${4} -f ${5} -t ${IMAGE}" || exit 1
else
    sh -c "docker build ${4} -f ${5} -t ${IMAGE} --target ${9}" || exit 1
fi

echo $3 | sh -c "docker login ${1} -u ${2} --password-stdin"

sh -c "push-image ${IMAGE}" || exit 2

if [ ! -z "${8}" ]; then
    export LATEST="${1}/${6}:${8}"

    sh -c "docker tag ${IMAGE} ${LATEST}"
    sh -c "push-image ${LATEST}" || exit 3
fi

sh -c "docker logout ${1}"
