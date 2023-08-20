call ../../configs.bat
title Setup Centos

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "commands/remote/SetupCentos.txt" -batch

pause