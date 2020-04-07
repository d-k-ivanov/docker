#!/usr/bin/env bash
RUNPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
VERSION=$(head -1 ${RUNPATH}/version)
docker push keepbot/xeus-cling:${VERSION}
