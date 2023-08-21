call ../../configs.bat
title Setup Centos

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "commands/remote/SetupCentos.sh" -batch

pause