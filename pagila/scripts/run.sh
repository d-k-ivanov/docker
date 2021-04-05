#!/usr/bin/env bash
RUNPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
VERSION=$(head -1 ${RUNPATH}/version)
docker run --rm -it --name "postgres-pagila" -p 5432:5432 dkivanov/postgres-pagila:${VERSION} $@
