#!/usr/bin/env bash
JAVA_VERSION=$(head -1 version)
JAVA_ALPINE_VERSION=$(head -2 version | tail -1)
$DIST=$(head -3 version | tail -1)
docker build \
  --rm \
  --build-arg JAVA_VERSION=${JAVA_VERSION} \
  --build-arg JAVA_ALPINE_VERSION=${JAVA_ALPINE_VERSION} \
  --tag dkivanov/jdk:${JAVA_VERSION}-${DIST} .
