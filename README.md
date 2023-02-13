# docker-minecraft-overviewer
[![Dockerhub BUILD and PUSH](https://github.com/TheMrPuffin/docker-minecraft-overviewer/actions/workflows/docker-publish.yml/badge.svg?event=release)](https://github.com/TheMrPuffin/docker-minecraft-overviewer/actions/workflows/docker-publish.yml)
## What is this repo?
A **docker image** containing **Minecraft Overviewer** which is a tool for rendering high-resolution maps of Minecraft worlds. 

**Minecraft Overviewer is not created by myself but by Andrew Brown and many other contributors. The source code for it can be found here: https://github.com/overviewer/Minecraft-Overviewer**

## How to use this image
There are two main ways this use this image; allow the container to run the bash scripting by default which uses environment variables and has a basic dynamic configuration file or override the scripting which allows you to use the Overviewer binary manually.  

### Automatic script trigger 
This method will automatically trigger scripting to generate your map when the container is created. You use environment variables (see below table) as parameters for the script. This script allows for the extraction if your Minecraft world if it is in a tar and selecting the most recent tar if there are multiple. This is done by setting values for **OVERVIEWER_MC_WORLD_TAR_DIR** and **OVERVIEWER_MC_WORLD_TAR_SEARCH_TERM** from **null** values otherwise the script will not treat the source as a tar file and just a **Minecraft** world folder. 

Sample **Docker** command:
``` sh
docker run -it themrpuffin/docker-minecraft-overviewer 
```

### Manual Binary
To create a simple container and start using **Minecraft-Overviewer** without custom included scripting, config and the need to worry about the defined environment variables run the following **Docker** command;
``` sh
docker run -it themrpuffin/docker-minecraft-overviewer /bin/bash
``` 
**Minecraft-Overviwer** tool is installed and ready to go! It as easy as just typing the command below into the command line; 
``` sh
overviewer
```
For more information on how to use **Overviewer** itself have look at the docs https://docs.overviewer.org/en/latest/ provided by the official team. 

### Environment Variables: 
| Env Variable                        | Description                                                                       | Default Value | Manual Value Input Required                                                                  |   
|-------------------------------------|-----------------------------------------------------------------------------------|---------------|----------------------------------------------------------------------------------------------|
| OVERVIEWER_MC_VERSION               | Target **Minecraft** version for obtaining textures                               | LATEST        | Only if non-latest version is being used                                                     |
| OVERVIEWER_MC_WORLD_DIR             | Target location of minecraft world to be mapped (where level .dat file is)        | ~/world/      | Only if world folder is located else where or not called **world**                           |
| OVERVIEWER_OUTPUT_DIR               | Target location for the output from Overviewer                                    | /mnt/nginx    | Only if output is not at default location                                                    |
| OVERVIEWER_MC_WORLD_TAR_DIR         | Target location of directory that includes tar files of **Minecraft** worlds      | NULL          | Only use if **Minecraft** worlds are in tar when set to not **NULL** the scripts will use it |
| OVERVIEWER_MC_WORLD_TAR_SEARCH_TERM | Target tar file to be extracted or search parameter for selecting latest tar file | NULL          | Only use if tar method use, using *.tar to find any tar for the latest to be selected        |

## Additional included tools / scripts

This **Docker** image contains other scripts / tools to make the use of the image easier. They can be found at;
```sh
/opt/overviewer/scripts/
```

### Scripts:
| Script Name         | Description                                                                                                                                                |   
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| toolGetTextures     | Gets textures for required **Minecraft** version (env **$MCVERSION**) and stores it in folder for overviewer to use                                        |
| startOverviewer     | Run the several steps to generate **Overviewer** maps, including getting textures, processing tar files and running overviewer binary with a custom config | 
| overviewerConfig.py | Dynamic configuration for overviewer binary                                                                                                                |


----------- 

## Maintainer
[@TheMrPuffin](https://github.com/TheMrPuffin)
