call ./_configs.bat
title Remote Server Web Logs
cd ./../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/LogCertBot.sh" -batch