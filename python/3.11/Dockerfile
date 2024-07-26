FROM python:3.11-bookworm
ARG DEBIAN_FRONTEND=noninteractive

ARG GLAB_DISTR_ARCH
ARG GLAB_DISTR_VERSION
ARG GLAB_DISTR_URL=https://github.com/profclems/glab/releases/download/v${GLAB_DISTR_VERSION}/glab_${GLAB_DISTR_VERSION}_Linux_${GLAB_DISTR_ARCH}.deb

ARG GH_DISTR_ARCH
ARG GH_DISTR_VERSION
ARG GH_DISTR_URL=https://github.com/cli/cli/releases/download/v${GH_DISTR_VERSION}/gh_${GH_DISTR_VERSION}_linux_${GH_DISTR_ARCH}.deb

ARG STARSHIP_INSTALLATION_URL=https://starship.rs/install.sh

ARG USERNAME
ARG UID
ARG GID

COPY entrypoint.sh /
RUN apt-get update -qq \
    && apt-get install -qq -y \
        direnv \
        docker-compose \
        dropbear \
        iputils-ping \
        nala \
        neovim \
        net-tools \
        sudo \
        zoxide \
    && curl -sL -o/var/cache/apt/archives/GLAB_DISTR.deb "${GLAB_DISTR_URL}" && sudo dpkg -i /var/cache/apt/archives/GLAB_DISTR.deb \
    && curl -sL -o/var/cache/apt/archives/GH_DISTR.deb "${GH_DISTR_URL}" && sudo dpkg -i /var/cache/apt/archives/GH_DISTR.deb \
    && curl -sL -o/tmp/starship.sh "${STARSHIP_INSTALLATION_URL}" && sh /tmp/starship.sh -f && rm /tmp/starship.sh \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/
RUN adduser ${USERNAME} -uid ${UID} --shell /bin/bash
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN sudo usermod -aG docker ${USERNAME}
CMD sh /entrypoint.sh
WORKDIR /home/${USERNAME}
