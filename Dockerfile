FROM node:19-bullseye
# Create app directory
WORKDIR /usr/src/app
LABEL maintainer="surendra.a@pycube.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /etc/ansible/ /ansible
RUN echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts

RUN apt-get update && apt-get install -y \
    git \
    ansible \
    apt-transport-https \
    ca-certificates-java \
    curl \
    init \
    openssh-server openssh-client \
    unzip \
    rsync \
    sudo \
    fuse snapd snap-confine squashfuse \
    && rm -rf /var/lib/apt/lists/*

# Configure udev for docker integration
RUN dpkg-divert --local --rename --add /sbin/udevadm && ln -s /bin/true /sbin/udevadm

RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

ENTRYPOINT ["/sbin/init"]
