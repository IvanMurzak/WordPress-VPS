call ./_configs.bat
title NGINX_CertBot Logs
cd ./../../

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./deployment/scripts/LogNGINX_CertBot.sh" -batch