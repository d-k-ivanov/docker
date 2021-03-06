FROM jenkins/jnlp-slave

LABEL maintainer="Dmitry Ivanov <d.k.ivanov@live.com>"

USER root

RUN set -x                                                                                                        \
    && echo "---------------------------------------  Python ---------------------------------------" > /dev/null \
    && apt-get -y update                                                                                          \
    && apt-get install -y wget python3-pip gnupg                                                                  \
    && pip3 install jira                                                                                          \
    && apt-get clean                                                                                              \
    && rm -rf /root/.wget-hsts /tmp/* /var/tmp/*                                                                  \
              /var/lib/apt/lists/*

USER jenkins

ENTRYPOINT ["jenkins-slave"]
