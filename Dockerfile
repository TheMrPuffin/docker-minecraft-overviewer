FROM ubuntu:23.04 as builder

WORKDIR /home/ubuntu

RUN apt-get update
RUN apt-get install -y python3-pil python3-dev python3-numpy wget gcc
RUN wget https://github.com/overviewer/Minecraft-Overviewer/tarball/master
RUN tar xvf master --one-top-level=overviewer-source --strip-components 1

WORKDIR /home/ubuntu/overviewer-source

RUN python3 setup.py build

