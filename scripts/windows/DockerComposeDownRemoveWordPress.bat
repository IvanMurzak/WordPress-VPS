call ./_configs.bat
title Docker Compose Down Remove WordPress
cd ./../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/DockerComposeDownRemoveWordPress.sh" -batch
pause