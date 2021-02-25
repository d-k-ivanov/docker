#!/usr/bin/env pwsh
${RUNPATH} = (get-item $PSScriptRoot ).parent.FullName
${VERSION} = $(Get-Content ${RUNPATH}\version -First 1)
docker push dkivanov/browsermob-proxy-py:${VERSION}
