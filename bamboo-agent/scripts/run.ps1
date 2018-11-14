#!/usr/bin/env pwsh
${RUNPATH} = (get-item $PSScriptRoot ).parent.FullName
${VERSION} = $(Get-Content ${RUNPATH}\version -First 1)
docker run --rm -it --name="bamboo-agent" keepbot/bamboo-agent:${VERSION} @args
