call ./../_configs.bat
title Setup VPS Centos
cd ./../../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/setup/SetupVPS_Centos.sh" -batch

pause