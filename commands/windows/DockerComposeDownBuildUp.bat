call _configs.bat
title Docker Compose Down Build Up
cd..

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "commands/remote/DockerComposeDownBuildUp.sh" -batch
pause