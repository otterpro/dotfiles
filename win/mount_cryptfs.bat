@rem ====================================================
@rem run cppcryptfs in background and give it time to start up
@rem
@rem USING another version, gocryptfs.bat in win/start/
@rem NOT USING THIS VERSION
@rem As of now (11/2019), cppcryptfs does not work well
@rem It doesn't mount reverse mode via command line
@rem It is flakey with normal mount as well
@rem ====================================================

start cppcryptfs.exe --tray
timeout /t 1 >nul

@rem ====================================================
@rem Mount drive k: 
@rem ====================================================
@rem cppcryptfs.exe --mount=o:\HD0\_he0 --drive=k  --saved-password --tray  --exit
@rem cppcryptfs --mount=o:\hd0\_he0 -P --drive=k --tray --exit
@rem cppcryptfs --mount=o:\hd0\_he0 -P --drive=c:\_mount\he0 --tray --exit

@rem ====================================================
@rem Mount drive R: (reverse Mode of Q:/ for cloud backup)
@rem ====================================================
cppcryptfs -r -s --mount=q:\1\ -P --drive=r:\ --tray --exit

@rem ====================================================
@rem Mount drive V:
@rem ====================================================
@rem cppcryptfs.exe --mount=d:\TestCppCryptFS2 --drive=v --password=PASSWORD --tray  --exit

