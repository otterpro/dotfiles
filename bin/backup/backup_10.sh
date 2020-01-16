#!/bin/sh
echo "======================"
echo "backup_10.sh"
date "+%Y-%m-%d:%H:%M:%S"
# copies encrypted doc.sparsebundle/ into 
if [ -d /Volumes/10 ] && [ -d /Users/otter/Documents/doc.sparsebundle ] ; then
	echo "backing up doc.sparsebundle to 10/"
	/usr/bin/rsync -av --del /Users/otter/Documents/doc.sparsebundle/ /Volumes/10/doc_backup/doc.sparsebundle 
fi
# copies HDD "10" to WD4T
if [ -d /Volumes/WD4T/10b1 ] && [ -d /Volumes/10 ] ; then
	echo "backing up 10/ to WD4T"
	/usr/bin/rsync -av --del /Volumes/10/ /Volumes/WD4T/10b1 
fi
# if [ -d /Volumes/WD4T/HD0 ] && [ -d /Users/otter/Documents/doc.sparsebundle ] ; then
# 	/usr/bin/rsync -av --del /Users/otter/Documents/doc.sparsebundle/ /Volumes/WD4T/HD0/doc_backup/doc.sparsebundle 
# fi
# if [ -d /Volumes/HD0/doc.sparsebundle ] && [ -d /Users/otter/Box\ Sync ] ; then
# 	/usr/bin/rsync -av --del /Volumes/HD0/doc.sparsebundle/ /Users/otter/Box\ Sync/backups/doc.sparsebundle
# fi
