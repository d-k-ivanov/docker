#!/usr/bin/env bash
RUNPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
VERSION=$(head -1 ${RUNPATH}/version)
docker run --rm -it --name "selenoid-firefox-proxy" keepbot/browsermob-proxy-py:${VERSION} $@
