call ./_configs.bat
title MySQL Server Logs
cd ./../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/LogMySQL_Server.sh" -batch