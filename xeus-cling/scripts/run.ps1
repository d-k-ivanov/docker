#!/usr/bin/env pwsh
${RUNPATH} = (get-item $PSScriptRoot ).parent.FullName
${VERSION} = $(Get-Content ${RUNPATH}\version -First 1)
docker run --rm -it --name="xeus-cling" -v ${PWD}\test:/tmp/test -p 9888:8888 keepbot/xeus-cling:${VERSION} @args
