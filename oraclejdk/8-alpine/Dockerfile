FROM alpine:3.7

LABEL maintainer="Dmitry Ivanov <d.k.ivanov@live.com>"

# Comment following line if you want to use wget to install JDK
ADD jdk-8u172-linux-x64.tar.gz /opt/java/

ARG JAVA_VERSION

ENV GLIBC_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download" \
    GLIBC_VERSION="2.27-r0" \
    JAVA_HOME="/opt/java/jdk" \
    # Uncomment following lines if you want to use wget to install JDK
    # JAVA_HEADER="Cookie: oraclelicense=accept-securebackup-cookie" \
    # JAVA_URL="http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}-b11/a58eab1ec242421181065cdc37240b08/jdk-${JAVA_VERSION}-linux-x64.tar.gz" \
    LANG="C.UTF-8" \
    PATH="${PATH}:${JAVA_HOME}/bin"

RUN echo "---------------------------------------  GLIBC  ---------------------------------------" && \
    apk -U upgrade && \
    apk --no-cache add ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    wget -q -O /tmp/glibc-${GLIBC_VERSION}.apk      ${GLIBC_URL}/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk      && \
    wget -q -O /tmp/glibc-bin-${GLIBC_VERSION}.apk  ${GLIBC_URL}/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk  && \
    wget -q -O /tmp/glibc-i18n-${GLIBC_VERSION}.apk ${GLIBC_URL}/${GLIBC_VERSION}/glibc-i18n-${GLIBC_VERSION}.apk && \
    apk add --allow-untrusted --no-cache /tmp/glibc-${GLIBC_VERSION}.apk       && \
    apk add --allow-untrusted --no-cache /tmp/glibc-bin-${GLIBC_VERSION}.apk   && \
    apk add --allow-untrusted --no-cache /tmp/glibc-i18n-${GLIBC_VERSION}.apk  && \
    rm /etc/apk/keys/sgerrand.rsa.pub && \
    /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true && \
    echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
    echo "---------------------------------------  JAVA   ---------------------------------------" && \
    # Uncomment following lines if you want to use wget to install JDK
    # wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" -O /tmp/jdk.tar.gz ${JAVA_URL} && \
    # mkdir -p /opt/java && \
    # tar xzf /tmp/jdk.tar.gz -C /opt/java/ && \
    ln -s /opt/java/jdk1.8.0_172 ${JAVA_HOME} && \
    echo "export JAVA_HOME=${JAVA_HOME}" > /etc/profile.d/java.sh && \
    echo "export PATH=\${PATH}:${JAVA_HOME}/bin" >> /etc/profile.d/java.sh && \
    echo '. /etc/profile' >> ~/.profile && \
    echo "--------------------------------------- CLEANUP ---------------------------------------" && \
    apk del glibc-i18n wget && \
    rm -rf  ${JAVA_HOME}/lib/src.zip \
            ${JAVA_HOME}/lib/missioncontrol \
            /root/.wget-hsts /tmp/* /var/cache/apk/*

