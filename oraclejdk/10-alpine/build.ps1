#!/usr/bin/env pwsh
$JAVA_VERSION = $(Get-Content version -First 1)
docker build --rm --build-arg JAVA_VERSION=$JAVA_VERSION -t oracle-jdk:$JAVA_VERSION-alpine .
