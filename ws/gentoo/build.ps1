#!/usr/bin/env pwsh

$IMAGE_VERSION  = $(Get-Content version -First 1)

docker build --rm --tag dkivanov/gentoo:${IMAGE_VERSION} .
