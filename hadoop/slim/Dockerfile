FROM openjdk:10-jdk-slim

LABEL maintainer="Dmitriy Ivanov <d.k.ivanov@live.com>"

ARG HADOOP_VERSION

ENV PATH $PATH:/hadoop/bin

RUN set -x                                                                                                        \
    && echo "---------------------------------------  HADOOP ---------------------------------------" > /dev/null \
    && apt-get -y update                                                                                          \
    && apt-get install -y wget gnupg                                                                              \
    && wget -q -O /tmp/KEYS https://archive.apache.org/dist/hadoop/core/KEYS                                      \
    && wget -q -O /tmp/hadoop-${HADOOP_VERSION}.tar.gz https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz         \
    && wget -q -O /tmp/hadoop-${HADOOP_VERSION}.tar.gz.asc https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz.asc \
    && gpg --import /tmp/KEYS                                                                                     \
    && gpg --verify /tmp/hadoop-${HADOOP_VERSION}.tar.gz.asc /tmp/hadoop-${HADOOP_VERSION}.tar.gz                 \
    && mkdir /hadoop                                                                                              \
    && tar zxf /tmp/hadoop-${HADOOP_VERSION}.tar.gz -C /hadoop --strip-components 1                               \
    && echo "--------------------------------------- CLEANUP ---------------------------------------" > /dev/null \
    && apt-get remove --purge -y wget gnupg                                                                       \
    && apt-get clean                                                                                              \
    && rm -rf /hadoop/share/doc                                                                                   \
              /hadoop/share/hadoop/common/sources                                                                 \
              /hadoop/share/hadoop/common/templates                                                               \
              /hadoop/share/hadoop/hdfs/sources                                                                   \
              /hadoop/share/hadoop/hdfs/templates                                                                 \
              /hadoop/share/hadoop/mapreduce/lib-examples                                                         \
              /hadoop/share/hadoop/mapreduce/sources                                                              \
              /hadoop/share/hadoop/tools/sources                                                                  \
              /hadoop/share/hadoop/yarn/sources                                                                   \
              /root/.wget-hsts /tmp/* /var/tmp/*                                                                  \
              /var/lib/apt/lists/*
