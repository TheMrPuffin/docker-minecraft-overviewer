# docker-minecraft-overviewer
[![Dockerhub Buid and Push](https://github.com/TheMrPuffin/docker-minecraft-overviewer/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/TheMrPuffin/docker-minecraft-overviewer/actions/workflows/docker-publish.yml)
## What is this repo?
A **docker image** containing **Minecraft Overviewer** which is a tool for rendering high-resolution maps of Minecraft worlds. 

**Minecraft Overviewer is not created by myself but Andrew Brown and many other contributors. The source code for it can be found here: https://github.com/overviewer/Minecraft-Overviewer**

## How to use this image

To create a simple container and start using **Minecraft-Overviewer** run the following **Docker** command;
``` sh
docker run -it TheMrPuffin/docker-minecraft-overviewer /bin/bash
``` 
**Minecraft-Overviwer** tool is installed and ready to go! It as easy as just typing the command below into the command line; 
``` sh
overviewer
```
For more information on how to use **Overviewer** itself have look at the docs https://docs.overviewer.org/en/latest/ provided by the official team. 

------------ 

## Maintainer
[@TheMrPuffin](https://github.com/TheMrPuffin)
