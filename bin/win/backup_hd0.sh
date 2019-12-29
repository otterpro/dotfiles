#!/bin/sh
echo "======================"
echo "HD0: "
# echo "HD0(TM0.sparsebundle): "
date "+%Y-%m-%d:%H:%M:%S"

# skip TimeMachine for now
# if [ -d /cygdrive/o/TM0.sparsebundle ] && [ -d /cygdrive/p ] ; then
# 	rsync -av --del /cygdrive/o/TM0.sparsebundle/ /cygdrive/p/TM0.sparsebundle
# fi

if [ -d /cygdrive/n ] && [ -d /cygdrive/q ] ; then
	rsync -av --del /cygdrive/n/1/ /cygdrive/q/1
fi
