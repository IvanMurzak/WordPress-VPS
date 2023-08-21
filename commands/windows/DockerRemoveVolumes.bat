call _configs.bat
title Docker Remove Volumes
cd..

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "commands/remote/DockerRemoveVolumes.sh" -batch
pause