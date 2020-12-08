FROM centos:8

RUN set -eux                                            \
    && dnf -y install glibc-locale-source               \
    && dnf -y install glibc-langpack-en                 \
    && localedef -i en_US -f UTF-8 en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN set -eux                                            \
    && dnf -y update                                    \
    && dnf -y install epel-release                      \
    && dnf -y update                                    \
    && dnf -y install dnf-plugins-core                  \
    && dnf config-manager --set-enabled powertools      \
    && dnf -y update                                    \
    && dnf -y groupinstall 'Development Tools'          \
    && dnf -y install armadillo-devel                   \
    && dnf -y install ncurses-compat-libs               \
    && dnf -y install mlpack-devel                      \
    && dnf -y install openssl-devel                     \
    && dnf -y install libcurl-devel                     \
    && dnf -y install wget                              \
    && dnf -y clean all                                 \
    && rm -rf /var/cache/dnf

ENV MRO_VERSION 4.0.2
ENV R_HOME=/opt/microsoft/ropen/$MRO_VERSION/lib64/R

RUN set -eux                                            \
    && cd /tmp/                                         \
    && wget https://mran.blob.core.windows.net/install/mro/${MRO_VERSION}/Rhel/microsoft-r-open-${MRO_VERSION}.tar.gz \
    && tar -xf microsoft-r-open-${MRO_VERSION}.tar.gz   \
    && cd microsoft-r-open/                             \
    && ./install.sh -a -s                               \
    && rm -rf microsoft-r-open-${MRO_VERSION}.tar.gz    \
    && rm -rf microsoft-r-open

RUN set -eux                                            \
    && echo 'options("download.file.method" = "libcurl")' >> /opt/microsoft/ropen/$MRO_VERSION/lib64/R/etc/Rprofile.site

RUN Rscript -e 'install.packages(c("devtools", "curl", "Rcpp", "rjson", "dplyr", "data.table", "openxlsx", "codetools"))'

CMD ["/usr/bin/R", "--no-save"]
# CMD ["/usr/bin/RScript", "--no-save"]
