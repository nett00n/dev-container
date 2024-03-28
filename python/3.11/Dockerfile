FROM python:3.11-bookworm
ARG DEBIAN_FRONTEND=noninteractive

ARG GLAB_DISTR_ARCH
ARG GLAB_DISTR_VERSION
ARG GLAB_DISTR_URL=https://github.com/profclems/glab/releases/download/v${GLAB_DISTR_VERSION}/glab_${GLAB_DISTR_VERSION}_Linux_${GLAB_DISTR_ARCH}.deb

ARG GH_DISTR_ARCH
ARG GH_DISTR_VERSION
ARG GH_DISTR_URL=https://github.com/cli/cli/releases/download/v${GH_DISTR_VERSION}/gh_${GH_DISTR_VERSION}_linux_${GH_DISTR_ARCH}.deb
ARG USERNAME

COPY entrypoint.sh /
RUN apt-get update -qq \
    && apt-get install -qq -y \
        direnv \
        dropbear \
        sudo \
        net-tools \
        neovim \
    && curl -sL -o/var/cache/apt/archives/GLAB_DISTR.deb ${GLAB_DISTR_URL} && sudo dpkg -i /var/cache/apt/archives/GLAB_DISTR.deb \
    && curl -sL -o/var/cache/apt/archives/GH_DISTR.deb ${GH_DISTR_URL} && sudo dpkg -i /var/cache/apt/archives/GH_DISTR.deb \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/
CMD sh /entrypoint.sh
RUN useradd ${USERNAME} -u 1000 -o -s /bin/bash
WORKDIR /home/${USERNAME}

