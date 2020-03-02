#!/bin/sh
echo "======================"
echo "backup_40.sh"
date "+%Y-%m-%d:%H:%M:%S"
# WARNING: using older rsync that comes with macOS, 
# with newer version of rsync (v3+), may need to change options, using -AX instead of -E
# also -E/-AX causes resource fork files (every file with ._ ) to be created on foreign filesystem
	# could be messy

# copies WD4t/4 to HDD 500gb
if [ -d /Volumes/WD4T/4 ] && [ -d /Volumes/500gb2 ] ; then
	echo "backing up WD4t/3/ to 500gb2"
	/usr/bin/rsync -avS --del --delete-excluded \
	--exclude .Trashes \
	--exclude .Spotlight-*/ \
	--exclude .TemporaryItems \
	--exclude .DS_Store \
	--exclude .fseventsd \
	/Volumes/WD4T/4/ /Volumes/500gb2/4
fi

# copies WD4t/42 to HDD 300GB
if [ -d /Volumes/WD4T/42 ] && [ -d /Volumes/300GB ] ; then
	echo "backing up WD4t/3/ to 500gb2"
	/usr/bin/rsync -avS --del --delete-excluded \
	--exclude .Trashes \
	--exclude .Spotlight-*/ \
	--exclude .TemporaryItems \
	--exclude .DS_Store \
	--exclude .fseventsd \
	/Volumes/WD4T/42/ /Volumes/300GB/42
fi
