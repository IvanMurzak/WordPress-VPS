call _configs.bat
title Docker Compose Down Build Up
cd..

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "../deployment/scripts/DockerComposeDownBuildUp.sh" -batch
pause