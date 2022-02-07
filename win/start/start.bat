@echo off

REM #### autohotkey
start %USERPROFILE%\dotfiles\win\keyboard.ahk

REM #### gocryptfs / cppcryptfs
REM *** use GUI's automount to load the encrypted drive using saved password, no need to use param if using AutoMount
REM pushd; try {...} # if using powershell
start c:\app\cppcryptfs1.4.3.11\cppcryptfs.exe --tray

REM #### Veracrypt drive in K:
REM start "c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l k /v %USERPROFILE%\Documents\enc
REM unmount H
REM "c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /d h

REM ##### WSL2 
start wsl.exe --status

REM WAIT until WSL2 has finished loading...sleep 5 sec, cannot skip using key, and don't show prompt
timeout /T 5 /NOBREAK > NUL

REM launch anything that depends on wsl2 here
REM

REM finally { popd } # if using powershell

