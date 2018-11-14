#!/usr/bin/env pwsh
$IMAGE_VERSION = $(Get-Content version -First 1)
$DIST = $(Get-Content version -First 2)[-1]
docker build `
  --rm `
  --tag python-jira-slave:${IMAGE_VERSION}-${DIST} .
