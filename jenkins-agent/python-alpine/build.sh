#!/usr/bin/env bash
IMAGE_VERSION=$(head -1 version)
DIST=$(head -2 version | tail -1)
docker build \
  --rm \
  --tag python-jira-slave:${IMAGE_VERSION}-${DIST} .
