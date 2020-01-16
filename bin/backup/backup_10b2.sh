#!/bin/sh
echo "======================"
echo "backup_10b2.sh"
date "+%Y-%m-%d:%H:%M:%S"
# copies WD4T/10b1 to HDD/10b2
if [ -d /Volumes/WD4T/10b1 ] && [ -d /Volumes/10b2 ] ; then
	echo "backing up 10/ to WD4T"
	/usr/bin/rsync -av --del /Volumes/WD4T/10b1/ /Volumes/10b2 
fi
# if [ -d /Volumes/WD4T/HD0 ] && [ -d /Users/otter/Documents/doc.sparsebundle ] ; then
# 	/usr/bin/rsync -av --del /Users/otter/Documents/doc.sparsebundle/ /Volumes/WD4T/HD0/doc_backup/doc.sparsebundle 
# fi
# if [ -d /Volumes/HD0/doc.sparsebundle ] && [ -d /Users/otter/Box\ Sync ] ; then
# 	/usr/bin/rsync -av --del /Volumes/HD0/doc.sparsebundle/ /Users/otter/Box\ Sync/backups/doc.sparsebundle
# fi
