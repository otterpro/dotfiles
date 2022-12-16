#!/bin/sh
echo "======================"
echo "HD2: "
date "+%Y-%m-%d:%H:%M:%S"
if [ -d /cygdrive/m/hd2 ] && [ -d /cygdrive/x ] ; then
	rsync -av --del /cygdrive/m/hd2/ /cygdrive/x/hd2
fi
