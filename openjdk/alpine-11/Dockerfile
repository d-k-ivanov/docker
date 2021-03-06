FROM alpine:edge

LABEL maintainer="Dmitry Ivanov <d.k.ivanov@live.com>"

ARG JAVA_VERSION
ARG JAVA_ALPINE_VERSION

ENV JAVA_URL "https://download.java.net/java/early_access/alpine/${JAVA_VERSION}/binaries/openjdk-${JAVA_ALPINE_VERSION}_linux-x64-musl_bin.tar.gz"
ENV JAVA_HOME /usr/lib/jvm/java-${JAVA_VERSION}-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-${JAVA_VERSION}-openjdk/bin

RUN set -x                                                                                                        \
    && echo "---------------------------------------  JAVA   ---------------------------------------" > /dev/null \
    && apk -U upgrade                                                                                             \
    && apk --no-cache add ca-certificates wget                                                                    \
    && wget -q -O /tmp/jdk.tar.gz ${JAVA_URL}                                                                     \
    && mkdir -p ${JAVA_HOME}                                                                                      \
    && tar xzf /tmp/jdk.tar.gz -C ${JAVA_HOME} --strip-components 1                                               \
    && ln -s /opt/java/jdk-${JAVA_VERSION} ${JAVA_HOME}                                                           \
    && echo "export JAVA_HOME=${JAVA_HOME}" > /etc/profile.d/java.sh                                              \
    && echo "export PATH=\${PATH}:${JAVA_HOME}/bin" >> /etc/profile.d/java.sh                                     \
    && echo '. /etc/profile' >> ~/.profile                                                                        \
    && echo "--------------------------------------- CLEANUP ---------------------------------------" > /dev/null \
    && apk del wget                                                                                               \
    && rm -rf  ${JAVA_HOME}/lib/src.zip /root/.wget-hsts /tmp/* /var/cache/apk/*
