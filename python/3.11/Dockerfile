FROM python:3.11-bookworm
ARG DEBIAN_FRONTEND=noninteractive
ARG GLAB_DISTR_URL=https://github.com/profclems/glab/releases/download/v1.22.0/glab_1.22.0_Linux_x86_64.deb
ARG GH_DISTR_URL=https://github.com/cli/cli/releases/download/v2.46.0/gh_2.46.0_linux_amd64.deb
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
    && rm -rf /var/lib/apt/lists/*
CMD sh /entrypoint.sh
RUN useradd nett00n -u 1000 -o -s /bin/bash
WORKDIR /home/nett00n
