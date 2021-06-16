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
if [ -d /Volumes/WD4T/20 ] && [ -d /Volumes/500g ] ; then
	echo "backing up WD4t/20/ to 500g"
	/usr/bin/rsync -avS --del --delete-excluded \
	--exclude .Trashes \
	--exclude .Spotlight-*/ \
	--exclude .TemporaryItems \
	--exclude .DS_Store \
	--exclude .fseventsd \
	/Volumes/WD4T/20/ /Volumes/500g/20 
fi
