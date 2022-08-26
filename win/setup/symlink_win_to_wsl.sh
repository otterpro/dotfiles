#!/bin/bash
# Run it from WSL's bash/shell
# to create symlink from c:/User/john -> ~/win/
# creates win, and notes symlink
export WINHOME=$(wslpath $(cmd.exe /c "echo %UserProfile%") | sed 's/\r$//')
ln -s $WINHOME ~/win
if [[ -d $WINHOME/notes ]]; then 
	ln -s $WINHOME/notes ~/notes
fi
