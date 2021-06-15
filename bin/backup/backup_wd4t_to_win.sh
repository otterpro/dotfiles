#!/bin/sh
# makes wd4t backup to windows shared hdd
# 
# TODO: 
# * convert sparsebundle into encrypted disk instead?

echo "======================"
echo "backup_10.sh"
date "+%Y-%m-%d:%H:%M:%S"

# WARNING: using older rsync that comes with macOS, 
# with newer version of rsync (v3+), may need to change options, using -AX instead of -E
# also -E/-AX causes resource fork files (every file with ._ ) to be created on foreign filesystem
	# could be messy

# copies encrypted doc.sparsebundle/ into wd4t
if [ -d /Volumes/WD4T ] && [ -d /Users/otter/Documents/doc.sparsebundle ] ; then
	echo "backing up doc.sparsebundle to wd4t/"
	/usr/bin/rsync -avS --del --delete-excluded \
	--exclude .Trashes \
	--exclude .Spotlight-*/ \
	--exclude .TemporaryItems \
	--exclude .DS_Store \
	--exclude .fseventsd \
	/Users/otter/Documents/doc.sparsebundle/ /Volumes/WD4T/10/doc.sparsebundle 
fi
# copies HDD wd4t/10 to backup hdd
if [ -d /Volumes/WD4T/10 ] && [ -d /Volumes/1000G ] ; then
	echo "backing up 10/ to WD4T"
	/usr/bin/rsync -avS --del --delete-excluded \
	--exclude .Trashes \
	--exclude .Spotlight-*/ \
	--exclude .TemporaryItems \
	--exclude .DS_Store \
	--exclude .fseventsd \
	Volumes/WD4T/10/ /Volumes/1000G/10b1
fi
# if [ -d /Volumes/WD4T/HD0 ] && [ -d /Users/otter/Documents/doc.sparsebundle ] ; then
# 	/usr/bin/rsync -av --del /Users/otter/Documents/doc.sparsebundle/ /Volumes/WD4T/HD0/doc_backup/doc.sparsebundle 
# fi
# if [ -d /Volumes/HD0/doc.sparsebundle ] && [ -d /Users/otter/Box\ Sync ] ; then
# 	/usr/bin/rsync -av --del /Volumes/HD0/doc.sparsebundle/ /Users/otter/Box\ Sync/backups/doc.sparsebundle
# fi
