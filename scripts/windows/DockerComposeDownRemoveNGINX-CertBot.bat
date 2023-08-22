call ./_configs.bat
title Docker Compose Down Remove NGINX and CertBot
cd ./../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/DockerComposeDownRemoveNGINX-CertBot.sh" -batch
pause