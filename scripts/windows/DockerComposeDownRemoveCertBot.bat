call ./_configs.bat
title Docker Compose Down Remove All
cd ./../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/DockerComposeDownRemoveCertBot.sh" -batch
pause