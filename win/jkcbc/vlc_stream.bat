@echo off
REM wait 30 sec for it to catch up
timeout /T 30 /NOBREAK > NUL

REM VLC
cd "C:\Program Files\VideoLAN\vlc"
start vlc.exe  -f --one-instance -L rtmp://127.0.0.1:5119/live/jkcbc
