@rem ====================================================
@rem run cppcryptfs in background and give it time to start up
@rem ====================================================

start cppcryptfs.exe --tray
timeout /t 1 >nul

@rem ====================================================
@rem Mount drive k: 
@rem ====================================================

@rem cppcryptfs.exe --mount=o:\HD0\_he0 --drive=k  --saved-password --tray  --exit
cppcryptfs.exe --mount=o:\HD0\_he0 --mount=o:\HE0  --saved-password --tray  --exit

@rem ====================================================
@rem Mount drive V:
@rem ====================================================

@rem cppcryptfs.exe --mount=d:\TestCppCryptFS2 --drive=v --password=PASSWORD --tray  --exit

@rem ====================================================
@rem Run any command with the mounted drives
@rem ====================================================

