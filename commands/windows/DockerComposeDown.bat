call _configs.bat
title Docker Compose Down
cd..

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "commands/remote/DockerComposeDown.txt" -batch
pause