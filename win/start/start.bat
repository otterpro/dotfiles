@echo off

REM #### autohotkey
start %USERPROFILE%\dotfiles\win\keyboard.ahk

REM #### gocryptfs / cppcryptfs
REM *** use GUI's automount to load the encrypted drive using saved password, no need to use param if using AutoMount
REM pushd; try {...} # if using powershell
IF EXIST c:\app\cppcryptfs1.4.3.11\cppcryptfs.exe (
	start c:\app\cppcryptfs1.4.3.11\cppcryptfs.exe --tray
) 

REM #### Veracrypt drive in B: 
REM keyfile: e:\enc_key\gopher1.jpg
REM encrypted file: ~/enc
IF EXIST %USERPROFILE%\enc (
	"c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l b /tryemptypass /k E:\enc_key\gopher1.jpg /v %USERPROFILE%\enc
)

REM unmount H
REM "c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /d h

REM ##### WSL2 
start wsl.exe --status

REM WAIT until WSL2 has finished loading...sleep 5 sec, cannot skip using key, and don't show prompt
timeout /T 5 /NOBREAK > NUL

REM launch anything that depends on wsl2 here
REM

REM finally { popd } # if using powershell

