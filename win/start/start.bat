@echo off

REM #### autohotkey
start %USERPROFILE%\dotfiles\win\keyboard-v2.ahk

REM #### gocryptfs / cppcryptfs
REM *** use GUI's automount to load the encrypted drive using saved password, no need to use param if using AutoMount
REM pushd; try {...} # if using powershell
REM IF EXIST c:\app\cppcryptfs1.4.3.11\cppcryptfs.exe (
	REM start c:\app\cppcryptfs1.4.3.11\cppcryptfs.exe --tray
REM ) 

REM #### Veracrypt drive in A: 
REM keyfile: B:\enc_key\gopher1.jpg
REM encrypted file: ~/enc
REM IF EXIST %USERPROFILE%\enc (
	REM "c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l a /tryemptypass /k b:\enc_key\gopher1.jpg /v %USERPROFILE%\enc
	REM "c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l a /tryemptypass /k b:\gopher1.jpg /v %USERPROFILE%\enc
REM )

REM unmount H
REM "c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /d h


REM #####    WSL2 ###########################
REM start wsl.exe --status
REM # Currently we don't run WSL here anymore, since Terminal loads automatically in setting (set to launch on login)
REM # WAIT until WSL2 has finished loading...sleep 5 sec, cannot skip using key, and don't show prompt
REM timeout /T 5 /NOBREAK > NUL

REM # launch anything that depends on wsl2 here
REM #

REM #####    END  ###########################
REM finally { popd } # if using powershell

