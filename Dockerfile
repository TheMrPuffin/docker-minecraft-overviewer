FROM ubuntu:23.04 as builder

WORKDIR /tmp

RUN apt-get update
RUN apt-get install -y python3-pil python3-dev python3-numpy wget gcc
RUN wget https://github.com/overviewer/Minecraft-Overviewer/tarball/master
RUN tar xvf master --one-top-level=overviewer-source --strip-components 1

WORKDIR /tmp/overviewer-source

RUN python3 setup.py build

FROM ubuntu:23.04

ENV MCVERSION=latest

RUN apt-get update
RUN apt-get install -y python3-pil python3-numpy wget

COPY --from=builder /tmp/overviewer-source/overviewer.py /opt/overviewer/
COPY --from=builder /tmp/overviewer-source/overviewer_core /opt/overviewer/overviewer_core

RUN ln -s /opt/overviewer/overviewer.py /usr/local/bin/overviewer

RUN useradd -ms /bin/bash overviewer
USER overviewer

COPY /scripts /opt/overviewer/scripts