call _configs.bat
title Remote Server Web Logs
cd..

set ARCHIVE=source.tar.bz2

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "./../../deployment/scripts/LogCertBot.sh" -batch