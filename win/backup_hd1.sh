#!/bin/sh
echo "======================"
echo "HDD 10/"
date "+%Y-%m-%d:%H:%M:%S"
if [ -d /cygdrive/m/3 ] && [ -d /cygdrive/t ] ; then
	rsync -av --del /cygdrive/m/3/ /cygdrive/t/3
fi
