call ../../configs.bat
title Setup Centos

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "../deployment/scripts/setup/SetupCentos.sh" -batch

pause