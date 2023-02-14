import os

MCVERSION = os.environ['OVERVIEWER_MC_VERSION']

worlds['world'] = os.environ['OVERVIEWER_MC_WORLD_DIR'] 

renders['render'] = {
	'world': 'world',
    'title': 'Overworld (Day)',
    }

outputdir = os.environ['OVERVIEWER_OUTPUT_DIR']
texturepath = '~/.minecraft/versions/$OVERVIEWER_MC_VERSION/$OVERVIEWER_MC_VERSION.jar' 
