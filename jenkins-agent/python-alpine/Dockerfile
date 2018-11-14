FROM openjdk:8-jdk-alpine

LABEL maintainer="Dmitriy Ivanov <d.k.ivanov@live.com>"

ENV HOME /home/jenkins
ENV JENKINS_HOME /home/jenkins

COPY start.sh /usr/local/bin/start.sh

RUN set -x                                                                                                                                          \
    && adduser -S -h "$HOME" jenkins jenkins                                                                                                        \
    && apk add --update --no-cache git python3 curl bash openssh                                                                                    \
    && pip3 install jira                                                                                                                            \
    && curl --create-dirs -sSLo /usr/share/jenkins/slave.jar http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/3.10/remoting-3.10.jar  \
    && chmod 755 /usr/share/jenkins                                                                                                                 \
    && chmod 644 /usr/share/jenkins/slave.jar

RUN chmod +x /usr/local/bin/start.sh

WORKDIR /home/jenkins

ENTRYPOINT ["/usr/local/bin/start.sh"]
