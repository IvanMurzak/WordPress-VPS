call ./_configs.bat
title WordPress Logs
cd ./../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/LogWordPress.sh" -batch