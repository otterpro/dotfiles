#!/bin/sh
echo "======================"
echo ": "
# echo "HD0(TM0.sparsebundle): "
date "+%Y-%m-%d:%H:%M:%S"

# skip TimeMachine for now
# if [ -d /cygdrive/o/TM0.sparsebundle ] && [ -d /cygdrive/p ] ; then
# 	rsync -av --del /cygdrive/o/TM0.sparsebundle/ /cygdrive/p/TM0.sparsebundle
# fi

if [ -d /cygdrive/m/10b1 ] && [ -d /cygdrive/t ] ; then
	rsync -av --del /cygdrive/m/10b1/ /cygdrive/t/10b2
fi
