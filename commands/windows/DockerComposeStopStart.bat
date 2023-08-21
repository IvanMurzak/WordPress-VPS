call _configs.bat
title Docker Compose Stop Start
cd..

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "commands/remote/DockerComposeStopStart.sh" -batch
pause