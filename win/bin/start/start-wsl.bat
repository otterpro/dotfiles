@echo off
REM start WSL2
wsl.exe --status

REM WAIT until WSL2 has finished loading...sleep 5 sec, cannot skip using key, and don't show prompt
timeout /T 5 /NOBREAK > NUL

REM launch anything that depends on wsl2
