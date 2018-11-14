#!/usr/bin/env pwsh
$JAVA_VERSION = $(Get-Content version -First 1)
$JAVA_ALPINE_VERSION = $(Get-Content version -First 2)[-1]
$DIST = $(Get-Content version -First 3)[-1]
docker build `
  --rm `
  --build-arg JAVA_VERSION=$JAVA_VERSION `
  --build-arg JAVA_ALPINE_VERSION=$JAVA_ALPINE_VERSION `
  --tag keepbot/jdk:$JAVA_VERSION-$DIST .
