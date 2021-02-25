#!/usr/bin/env pwsh
${RUNPATH} = (get-item $PSScriptRoot ).parent.FullName
${VERSION} = $(Get-Content ${RUNPATH}\version -First 1)
docker run --rm -it --name="xeus-cling" -u 1000:100 -v ${PWD}\test:/home/jovyan/test -p 8888:8888 dkivanov/xeus-cling:${VERSION} @args
