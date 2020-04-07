#!/usr/bin/env bash
RUNPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
VERSION=$(head -1 ${RUNPATH}/version)
docker run --rm -it --name "xeus-cling" -v ${PWD}/test:/tmp/test -p 8090:8090 keepbot/xeus-cling:${VERSION} $@
