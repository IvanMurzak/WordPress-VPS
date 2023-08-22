call ./../_configs.bat
title Setup VPS Debian
cd ./../../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/setup/SetupVPS_Debian.sh" -batch

pause