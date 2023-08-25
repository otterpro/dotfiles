@echo off

REM #### gocryptfs / cppcryptfs
REM launch GUI version
REM *** use GUI's automount to load the encrypted drive using saved password, no need to use param if using AutoMount
REM          PATH: C:\Users\Otter\Dropbox\_doc_enc
REM          [x] Save Password, [x] Auto-mount
REM          mount point: K:
REM pushd; try {...} # if using powershell
REM Currently have original encrypted in Dropbox/_doc_enc/*
REM It is unencrypted to K:\ and also replicated as encrypted version in other HDD backup
IF EXIST c:\app\cppcryptfs1.4.4.0\cppcryptfs.exe (
	start c:\app\cppcryptfs1.4.4.0\cppcryptfs.exe --tray
) 

