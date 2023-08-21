call _configs.bat
title Docker Compose Down Remove All
cd..

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "commands/remote/DockerComposeDownRemoveAll.sh" -batch
pause