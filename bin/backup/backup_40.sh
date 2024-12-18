#!/bin/sh
echo "======================"
date "+%Y-%m-%d:%H:%M:%S"
# WARNING: using older rsync that comes with macOS, 
# with newer version of rsync (v3+), may need to change options, using -AX instead of -E
# also -E/-AX causes resource fork files (every file with ._ ) to be created on foreign filesystem
	# could be messy

# copies WD4t/4 to HDD 500gb
echo "backup_4.sh"
if [ -d /Volumes/WD4T/4 ] && [ -d /Volumes/500g ] ; then
	echo "backing up WD4t/4/ to 500gb2"
	/usr/bin/rsync -avS --del --delete-excluded \
	--exclude .Trashes \
	--exclude .Spotlight-*/ \
	--exclude .TemporaryItems \
	--exclude .DS_Store \
	--exclude .fseventsd \
	/Volumes/WD4T/4/ /Volumes/500g/4
fi

# copies WD4t/42 to HDD 300GB
echo "backup_42.sh"
if [ -d /Volumes/WD4T/42 ] && [ -d /Volumes/500g ] ; then
	echo "backing up WD4t/42/ to 500gb2"
	/usr/bin/rsync -avS --del --delete-excluded \
	--exclude .Trashes \
	--exclude .Spotlight-*/ \
	--exclude .TemporaryItems \
	--exclude .DS_Store \
	--exclude .fseventsd \
	/Volumes/WD4T/42/ /Volumes/500g/42
fi
