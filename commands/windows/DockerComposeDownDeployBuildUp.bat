call _configs.bat
title Docker Compose Down Deploy Build Up
cd..

set ARCHIVE=source.tar.bz2

del %ARCHIVE%

7z a -ttar -so wordpress -x!.git -x!.gitignore -x!.vs -x!Ignore -x!Commands | 7z a -tbzip2 -si %ARCHIVE%
pscp -P 22 -pw %PASSWORD% ./%ARCHIVE% %USER%@%SERVER%:./archives

del %ARCHIVE%

plink -ssh %USER%@%SERVER% -pw %PASSWORD% -m "commands/remote/DockerComposeDownDeployBuildUp.sh" -batch
pause