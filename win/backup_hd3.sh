#!/bin/sh
echo "======================"
echo "HD3: "
date "+%Y-%m-%d:%H:%M:%S"
if [ -d /cygdrive/m/hd3 ] && [ -d /cygdrive/y ] ; then
	rsync -av --del /cygdrive/m/hd3/ /cygdrive/y/hd3
fi
