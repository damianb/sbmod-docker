FROM node:8.11.1

RUN yarn global add sbpak
ADD ./packed.pak /opt/

SHELL ["/bin/bash", "-c"]

WORKDIR /opt/
RUN mkdir ./StarboundAssets
RUN sbpak unpack ./packed.pak ./StarboundAssets
RUN rm packed.pak
