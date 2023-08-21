call ./_configs.bat
title Docker Compose Down Remove MySQL database
cd ./../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/DockerComposeDownRemoveDB.sh" -batch
pause