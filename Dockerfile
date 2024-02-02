FROM ubuntu:mantic-20240122 as builder

WORKDIR /tmp

RUN apt-get update
RUN apt-get install -y python3-pil python3-dev python3-numpy wget gcc
RUN wget https://github.com/overviewer/Minecraft-Overviewer/tarball/master
RUN tar xvf master --one-top-level=overviewer-source --strip-components 1

WORKDIR /tmp/overviewer-source

RUN python3 setup.py build

FROM ubuntu:mantic-20240122

ENV OVERVIEWER_MC_VERSION=latest
ENV OVERVIEWER_MC_WORLD_TAR_DIR=NULL
ENV OVERVIEWER_MC_WORLD_TAR_SEARCH_TERM=NULL
ENV OVERVIEWER_MC_WORLD_DIR=~/world/
ENV OVERVIEWER_OUTPUT_DIR=/mnt/nginx

RUN useradd -ms /bin/bash overviewer

RUN apt-get update
RUN apt-get install -y python3-pil python3-numpy wget vim

COPY --from=builder /tmp/overviewer-source/overviewer.py /opt/overviewer/
COPY --from=builder /tmp/overviewer-source/overviewer_core /opt/overviewer/overviewer_core

COPY /scripts /opt/overviewer/scripts

RUN ln -s /opt/overviewer/overviewer.py /usr/local/bin/overviewer

RUN chown -R 1001 /opt/overviewer
RUN chgrp -R 1001 /opt/overviewer

USER overviewer

CMD sh /opt/overviewer/scripts/startOverviewer 
