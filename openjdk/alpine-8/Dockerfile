FROM alpine:edge

LABEL maintainer="Dmitriy Ivanov <d.k.ivanov@live.com>"

ARG JAVA_VERSION
ARG JAVA_ALPINE_VERSION

ENV LANG C.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/bin

RUN apk add --no-cache openjdk8="$JAVA_ALPINE_VERSION"
