#!/usr/bin/env bash

IMAGE_VERSION=$(head -1 version)

docker build --rm --tag dkivanov/gentoo:${IMAGE_VERSION} .
