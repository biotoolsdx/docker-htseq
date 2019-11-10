FROM python:3.5-slim-stretch
MAINTAINER Chen Yuelong <yuelong.chen@aegicare.com>


ARG BUILD_PACKAGES="build-essential zlib1g-dev  libbz2-dev liblzma-dev"
ARG DEBIAN_FRONTEND=noninteractive

ARG htseq_version=0.11.2

# Update the repository sources list
RUN apt-get update && \
    apt-get install --yes \
              $BUILD_PACKAGES && \
    pip install HTSeq==$htseq_version && \
    apt remove --purge --yes \
              build-essential && \
    apt autoremove --purge --yes && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

CMD bash