#!/usr/bin/env bash
RUNPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
VERSION=$(head -1 ${RUNPATH}/version)
docker run --rm -it --name "browsermob-proxy-py" -p 8090:8090 dkivanov/browsermob-proxy-py:${VERSION} $@
