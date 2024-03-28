FROM ubuntu:noble
RUN apt-get update -qq \
    && apt-get install -qq -y \
        openssh-server \
        pipx \
        sudo \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /home/nett00n/
RUN userdel ubuntu \
    && useradd nett00n -u 1000 \
    && chown -R nett00n /home/nett00n/
USER nett00n
RUN whoami
RUN pipx install \
    docker-compose \
    ansible \
    isort \
    black \
    pre-commit \
    --quiet
EXPOSE 22
