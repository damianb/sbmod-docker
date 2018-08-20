FROM node:8.11.1

RUN yarn global add git+ssh://gitlab.nebula.local/smtk/sbpak.git#master
ADD ./packed.pak /opt/

WORKDIR /opt/
RUN mkdir ./StarboundAssets
RUN sbpak unpack ./packed.pak ./StarboundAssets
