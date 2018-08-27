FROM node:8.11.1

RUN yarn global add sbpak sbtool
ADD ./packed.pak /opt/

RUN apt-get update
RUN apt-get install dos2unix

WORKDIR /opt/
RUN mkdir ./StarboundAssets
RUN dos2unix -F /usr/local/bin/sbpak
RUN dos2unix -F /usr/local/bin/sbtool
RUN sbpak unpack ./packed.pak ./StarboundAssets/
RUN rm packed.pak
