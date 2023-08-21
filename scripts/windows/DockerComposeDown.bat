call _configs.bat
title Docker Compose Down
cd..

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "../deployment/scripts/DockerComposeDown.sh" -batch
pause