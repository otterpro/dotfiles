@echo off

REM #### Veracrypt drive in A: 
REM keyfile: B:\enc_key\gopher1.jpg
REM encrypted file: ~/enc
IF EXIST %USERPROFILE%\enc (
	REM "c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l a /tryemptypass /k b:\enc_key\gopher1.jpg /v %USERPROFILE%\enc
	"c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l a /tryemptypass /k b:\gopher1.jpg /v %USERPROFILE%\enc
)
