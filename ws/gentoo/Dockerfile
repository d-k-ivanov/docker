FROM gentoo/portage:20210225 as portage
FROM gentoo/stage3:20210225

LABEL maintainer="Dmitry Ivanov <d.k.ivanov@live.com>"

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
RUN set -eux                    \
    # && emerge-webrsync          \
    # && emerge --sync            \
    && emerge -qv               \
        dev-vcs/git             \
        dev-lang/python

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# Make work folders
RUN set -eux                                            \
    && mkdir -p /root/workspace/my                      \
    && git clone --recurse-submodules                   \
        https://github.com/d-k-ivanov/dotfiles.git      \
        /root/workspace/my/dotfiles                     \
    && /root/workspace/my/dotfiles/install.sh dev

WORKDIR /root
CMD ["/bin/bash"]
