call ./_configs.bat
title Remote Server Terminal

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -batch