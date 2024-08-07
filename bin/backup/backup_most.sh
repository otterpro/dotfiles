#!/bin/sh
echo "======================"
echo "backup_20.sh"
date "+%Y-%m-%d:%H:%M:%S"
# WARNING: using older rsync that comes with macOS, 
# with newer version of rsync (v3+), may need to change options, using -AX instead of -E
# also -E/-AX causes resource fork files (every file with ._ ) to be created on foreign filesystem
	# could be messy

# copies WD4t/3 to HDD 
#if [ -d /Volumes/WD4T/3 ] && [ -d /Volumes/500gb2 ] ; then
if [ -d /Volumes/WD4T ] && [ -d /Volumes/F4TB ] ; then
	echo "backing up WD4t to F4TB"
	/usr/bin/rsync -avS --del --delete-excluded \
	--exclude .Trashes \
	--exclude .Spotlight-*/ \
	--exclude .DocumentRevisions-*/ \
	--exclude .TemporaryItems \
	--exclude .DS_Store \
	--exclude .fseventsd \
	/Volumes/WD4T/ /Volumes/F4TB 
fi
