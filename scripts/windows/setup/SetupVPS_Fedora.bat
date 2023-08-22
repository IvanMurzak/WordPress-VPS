call ./../_configs.bat
title Setup VPS Fedora
cd ./../../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/setup/SetupVPS_Fedora.sh" -batch

pause