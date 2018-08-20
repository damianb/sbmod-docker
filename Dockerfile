FROM node:8.11.1

RUN yarn global add sbpak
ADD ./packed.pak /opt/

WORKDIR /opt/
RUN mkdir ./StarboundAssets
RUN sbpak unpack ./packed.pak ./StarboundAssets
