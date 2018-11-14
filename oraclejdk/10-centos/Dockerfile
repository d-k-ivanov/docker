FROM centos:7

LABEL maintainer="Dmitriy Ivanov <d.k.ivanov@live.com>"

# Comment following line if you want to use wget to install JDK
ADD jdk-10.0.1_linux-x64_bin.tar.gz /opt/java/

ARG JAVA_VERSION

ENV JAVA_HOME="/opt/java/jdk" \
    # Uncomment following lines if you want to use wget to install JDK
    #JAVA_HEADER="Cookie: oraclelicense=accept-securebackup-cookie" \
    #JAVA_URL="http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}+10/fb4372174a714e6b8c52526dc134031e/jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz" \
    LANG="C.UTF-8" \
    PATH="${PATH}:${JAVA_HOME}/bin"

RUN echo "---------------------------------------  JAVA   ---------------------------------------" && \
    # Uncomment following lines if you want to use wget to install JDK
    #curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/jdk.tar.gz ${JAVA_URL} \
    #mkdir -p /opt/java && \
    #tar xzf /tmp/jdk.tar.gz -C /opt/java/ && \
    ln -s /opt/java/jdk-${JAVA_VERSION} ${JAVA_HOME} && \
    echo "export JAVA_HOME=${JAVA_HOME}" > /etc/profile.d/java.sh && \
    echo "export PATH=\${PATH}:${JAVA_HOME}/bin" >> /etc/profile.d/java.sh && \
    echo "--------------------------------------- CLEANUP ---------------------------------------" && \
    rm -rf  ${JAVA_HOME}/lib/src.zip \
            ${JAVA_HOME}/lib/missioncontrol \
            /root/.wget-hsts /tmp/*
