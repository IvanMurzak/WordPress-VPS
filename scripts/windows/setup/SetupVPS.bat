call ../../_configs.bat
title Setup VPS

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "../deployment/scripts/setup/SetupVPS.sh" -batch

pause