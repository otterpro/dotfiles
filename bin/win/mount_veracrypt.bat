@echo off
REM This needs to be inside a bitlocker volume 
REM enter password in the parameter
REM 
REM /l <drive-letter> /v <file> /q (quit)

REM "c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l h /v %USERPROFILE%\edata

REM HE0 (encrypted HDD0 O:\HE0 -> N:)
if NOT exist n:\ ("c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l N /v O:\HE0 /p "<EnterValueHere>")

REM HE0 Backup (Y: -> W:)
REM currently auto-mounted as USB, so no need for this yet?
REM if NOT exist w:\ ("c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l W /v \Device\harddisk4\Partition1 /p "<EnterValueHere>")

REM unmount H
REM "c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /d h 
