FROM ubuntu:23.04 as builder

WORKDIR /tmp

RUN apt-get update
RUN apt-get install -y python3-pil python3-dev python3-numpy wget gcc
RUN wget https://github.com/overviewer/Minecraft-Overviewer/tarball/master
RUN tar xvf master --one-top-level=overviewer-source --strip-components 1

WORKDIR /tmp/overviewer-source

RUN python3 setup.py build

FROM ubuntu:23.04

RUN apt-get update
RUN apt-get install -y python3-pil python3-dev python3-numpy 

COPY --from=builder /tmp/overviewer-source/overviewer.py /opt/overviewer/
COPY --from=builder /tmp/overviewer-source/overviewer_core /opt/overviewer/overviewer_core