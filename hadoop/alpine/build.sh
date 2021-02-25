#!/usr/bin/env bash
HADOOP_VERSION=$(head -1 version)
DIST=$(head -2 version | tail -1)
docker build \
  --rm \
  --build-arg HADOOP_VERSION=${JAVA_VERSION} \
  --tag dkivanov/hadoop:${HADOOP_VERSION}-${DIST} .
