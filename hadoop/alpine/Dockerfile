FROM dkivanov/jdk:11-alpine

LABEL maintainer="Dmitry Ivanov <d.k.ivanov@live.com>"

ARG HADOOP_VERSION

ENV PATH $PATH:/hadoop/bin

RUN set -x                                                                                                        \
    && echo "---------------------------------------  HADOOP ---------------------------------------" > /dev/null \
    && apk -U upgrade                                                                                             \
    && apk --no-cache add ca-certificates wget gnupg bash                                                         \
    && wget -q -O /tmp/KEYS https://archive.apache.org/dist/hadoop/core/KEYS                                      \
    && wget -q -O /tmp/hadoop-${HADOOP_VERSION}.tar.gz https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz         \
    && wget -q -O /tmp/hadoop-${HADOOP_VERSION}.tar.gz.asc https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz.asc \
    && gpg -q --import /tmp/KEYS                                                                                  \
    && gpg -q --verify /tmp/hadoop-${HADOOP_VERSION}.tar.gz.asc /tmp/hadoop-${HADOOP_VERSION}.tar.gz              \
    && mkdir /hadoop                                                                                              \
    && tar zxf /tmp/hadoop-${HADOOP_VERSION}.tar.gz -C /hadoop --strip-components 1                               \
    && echo "--------------------------------------- CLEANUP ---------------------------------------" > /dev/null \
    && apk del gnupg wget                                                                                         \
    && rm -rf /hadoop/share/doc                                                                                   \
              /hadoop/share/hadoop/common/sources                                                                 \
              /hadoop/share/hadoop/common/templates                                                               \
              /hadoop/share/hadoop/hdfs/sources                                                                   \
              /hadoop/share/hadoop/hdfs/templates                                                                 \
              /hadoop/share/hadoop/mapreduce/lib-examples                                                         \
              /hadoop/share/hadoop/mapreduce/sources                                                              \
              /hadoop/share/hadoop/tools/sources                                                                  \
              /hadoop/share/hadoop/yarn/sources                                                                   \
              /root/.wget-hsts /tmp/* /var/cache/apk/*
