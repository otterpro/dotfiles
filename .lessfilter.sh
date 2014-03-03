#!/bin/sh
PYG="pygmentize -O style=monokai -f 256"
case "$1" in
    .bashrc|.aliases|.zshrc) # shell-related
        $PYG -l sh "$1";;

	*)  # all others	
        $PYG "$1";;
esac

exit 0
