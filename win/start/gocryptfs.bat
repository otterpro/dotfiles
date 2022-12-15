@echo off

REM #### gocryptfs / cppcryptfs
REM *** use GUI's automount to load the encrypted drive using saved password, no need to use param if using AutoMount
REM pushd; try {...} # if using powershell
IF EXIST c:\app\cppcryptfs1.4.4.0\cppcryptfs.exe (
	start c:\app\cppcryptfs1.4.4.0\cppcryptfs.exe --tray
) 

