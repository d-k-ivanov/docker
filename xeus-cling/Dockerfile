FROM jupyter/minimal-notebook

LABEL maintainer="Dmitriy Ivanov <d.k.ivanov@live.com>"


RUN set -x                                                                                          \
    && echo "------------------------------ Soft  -----------------------------" > /dev/null        \
    && conda install --quiet --yes xeus-cling -c conda-forge                                        \
    && conda install -c conda-forge xtensor

# RUN set -x                                                                                          \
#     && echo "------------------------------ Users ------------------------------" > /dev/null       \
#     && find / -path /proc -prune -o -group 1000 -exec chgrp -h bamboo {} \;                         \
#     && find / -path /proc -prune -o -user 1000 -exec chown -h bamboo {} \;

# RUN set -x                                                                                          \
#     && echo "------------------------------ Clean ------------------------------" > /dev/null       \
#     && apt-get clean
