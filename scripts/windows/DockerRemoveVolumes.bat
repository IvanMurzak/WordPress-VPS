call ./_configs.bat
title Docker Remove Volumes
cd ./../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/DockerRemoveVolumes.sh" -batch
pause