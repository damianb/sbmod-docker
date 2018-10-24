FROM node:8.12.0
WORKDIR /opt/

RUN set -x \
  && yarn global add sbpak sbtool \
  && apt-get update \
  && apt-get install --no-install-recommends -y dos2unix \
  && mkdir /opt/StarboundAssets \
  && dos2unix -F /usr/local/bin/sbpak \
  && dos2unix -F /usr/local/bin/sbtool \
  && apt-get remove dos2unix -y \
  && rm -rf /var/lib/apt/lists/*

ADD ./packed.pak /opt/
RUN set -x \
  && sbpak unpack /opt/packed.pak /opt/StarboundAssets/ \
  && rm -f /opt/packed.pak
