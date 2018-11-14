#!/usr/bin/env bash
JAVA_VERSION=$(head -1 version)
docker build --rm --build-arg JAVA_VERSION=${JAVA_VERSION} -t oracle-jdk:${JAVA_VERSION}-slim .
