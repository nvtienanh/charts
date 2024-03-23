FROM debian:bookworm-slim
LABEL maintainer="melroy@melroy.org"

ENV DEBIAN_FRONTEND noninteractive

# APT Update
RUN apt-get --allow-releaseinfo-change update
RUN apt-get update && apt-get upgrade -y

# APT install (base) packages
RUN apt-get install -y build-essential cmake libboost-all-dev pkg-config
RUN apt-get install -y ninja-build ccache
RUN apt-get install -y --no-install-recommends curl wget

# Get cppcheck dependencies from stable; that's good enough
RUN echo "deb-src http://deb.debian.org/debian bookworm main" >>/etc/apt/sources.list
RUN apt-get update

# APT install additional packages
RUN apt-get install -y --no-install-recommends \
    locales \
    python3-pip \
    ca-certificates \
    clang-format \
    libssl-dev && \
    apt-get clean

# Clean-up
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# set the locale to en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >/etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8