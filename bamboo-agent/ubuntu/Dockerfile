FROM atlassian/bamboo-agent-base

LABEL maintainer="Dmitry Ivanov <d.k.ivanov@live.com>"

USER root

RUN set -x                                                                                          \
    && echo "------------------------------ Soft  -----------------------------" > /dev/null        \
    && apt-get update -y                                                                            \
    && apt-get install -y git                                                                       \
    && apt-get install -y python3                                                                   \
    && apt-get install -y python3-pip                                                               \
    && pip3 install virtualenv                                                                      \
    && echo "------------------------------ Users ------------------------------" > /dev/null       \
    && usermod -u 901 bamboo                                                                        \
    && groupmod -g 901 bamboo                                                                       \
    && find / -path /proc -prune -o -group 1000 -exec chgrp -h bamboo {} \;                         \
    && find / -path /proc -prune -o -user 1000 -exec chown -h bamboo {} \;                          \
    && echo "------------------------------ Clean ------------------------------" > /dev/null       \
    && apt-get clean

USER ${BAMBOO_USER}

RUN set +x                                                                                          \
    && ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.g++.executable" /usr/bin/g++         \
    && ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.gcc.executable" /usr/bin/gcc         \
    && ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.git.executable" /usr/bin/git         \
    && ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.link.executable" /usr/bin/link       \
    && ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.perl.executable" /usr/bin/perl       \
    && ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.pip3.executable" /usr/bin/pip3       \
    && ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.python3.executable" /usr/bin/python3 \
    && chown -R ${BAMBOO_USER} ${BAMBOO_USER_HOME}
