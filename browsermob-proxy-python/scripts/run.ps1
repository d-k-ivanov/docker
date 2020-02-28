#!/usr/bin/env pwsh
${RUNPATH} = (get-item $PSScriptRoot ).parent.FullName
${VERSION} = $(Get-Content ${RUNPATH}\version -First 1)
docker run --rm -it --name="browsermob-proxy-py" keepbot/browsermob-proxy-py:${VERSION} @args
