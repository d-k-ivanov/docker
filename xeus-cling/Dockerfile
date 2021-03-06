FROM jupyter/minimal-notebook

LABEL maintainer="Dmitry Ivanov <d.k.ivanov@live.com>"

USER $NB_UID
WORKDIR $HOME

RUN set -x                                                                                          \
    && echo "------------------------ Installing Software ---------------------" > /dev/null        \
    && conda install --quiet --yes xeus-cling -c conda-forge                                        \
    && conda install -c conda-forge xtensor xtensor-blas                                            \
    && conda update --all --quiet --yes                                                             \
    && echo "------------------------------ Cleaning ---------------------------" > /dev/null       \
    && conda clean --all -f -y                                                                      \
    && rm -rf /home/$NB_USER/.cache/yarn                                                            \
    && echo "------------------------- Fixing permissions ----------------------" > /dev/null       \
    && fix-permissions $CONDA_DIR                                                                   \
    && fix-permissions /home/$NB_USER
