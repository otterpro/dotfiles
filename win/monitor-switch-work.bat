echo off
rem controlmymonitor.exe /SetValue "HWP3117" 60 15
rem VCP code 60 : Input switch
rem * 15 = DP
rem * 17 = HDMI
SET DisplayPort=15
SET HDMI=17
controlmymonitor.exe /SetValue "DELA1C5" 60 %HDMI%
controlmymonitor.exe /SetValue "DELA1C4" 60 %HDMI%
rem controlmymonitor.exe /SetValue "DELA1C5" 60 15
rem controlmymonitor.exe /SetValue "DELA1C4" 60 15
