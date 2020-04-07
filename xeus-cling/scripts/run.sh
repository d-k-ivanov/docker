#!/usr/bin/env bash
RUNPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
VERSION=$(head -1 ${RUNPATH}/version)
docker run --rm -it --name "xeus-cling" -u 1000:100 -v ${PWD}/test:/home/jovyan/test -p 8888:8888 keepbot/xeus-cling:${VERSION} $@
