#!/usr/bin/env pwsh
$HADOOP_VERSION = $(Get-Content version -First 1)
$DIST = $(Get-Content version -First 2)[-1]
docker build `
  --rm `
  --build-arg HADOOP_VERSION=${HADOOP_VERSION} `
  --tag keepbot/hadoop:${HADOOP_VERSION}-${DIST} .
