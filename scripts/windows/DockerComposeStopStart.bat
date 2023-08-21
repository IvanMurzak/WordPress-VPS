call _configs.bat
title Docker Compose Stop Start
cd..

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "../deployment/scripts/DockerComposeStopStart.sh" -batch
pause