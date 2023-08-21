call ./../_configs.bat
title Setup VPS Ubuntu
cd ./../../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/setup/SetupVPS_Ubuntu.sh" -batch

pause