# docker-minecraft-overviewer
[![Dockerhub BUILD and PUSH](https://github.com/TheMrPuffin/docker-minecraft-overviewer/actions/workflows/docker-publish.yml/badge.svg?event=release)](https://github.com/TheMrPuffin/docker-minecraft-overviewer/actions/workflows/docker-publish.yml)
## What is this repo?
A **docker image** containing **Minecraft Overviewer** which is a tool for rendering high-resolution maps of Minecraft worlds. 

**Minecraft Overviewer is not created by myself but by Andrew Brown and many other contributors. The source code for it can be found here: https://github.com/overviewer/Minecraft-Overviewer**

## How to use this image

To create a simple container and start using **Minecraft-Overviewer** run the following **Docker** command;
``` sh
docker run -it themrpuffin/docker-minecraft-overviewer
``` 
**Minecraft-Overviwer** tool is installed and ready to go! It as easy as just typing the command below into the command line; 
``` sh
overviewer
```
For more information on how to use **Overviewer** itself have look at the docs https://docs.overviewer.org/en/latest/ provided by the official team. 

### Environment Variables: 
| Env Variable  | Description                                         | Default Value |   
|---------------|-----------------------------------------------------|---------------|
| MCVERSION     | Target **Minecraft** version for obtaining textures | LATEST        |


## Additional included tools / scripts

This **Docker** image contains other scripts / tools to make the use of the image easier. They can be found at;
```sh
/opt/overviewer/scripts/
```

### Scripts:
| Script Name   | Description                                                                                                     |   
|---------------|-----------------------------------------------------------------------------------------------------------------|
| getTextures   | Gets textures for required minecraft version (env **$MCVERSION**) and stores it in folder for overviewer to use |



----------- 

## Maintainer
[@TheMrPuffin](https://github.com/TheMrPuffin)
