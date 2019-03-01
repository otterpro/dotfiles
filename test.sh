#!/usr/bin/env bash
#
# Daniel Kim 
#
# creates symlink of all dotfiles and also dot directories into home directory (~)
# WARNING: This is a destructive process.  Any existing files or directories will be overwritten!!!
#
# set -xv #debugging
# part of vim backup from https://github.com/swaroopch/dotvim/blob/master/install.sh
#
# also, make sure to get bin files first.  In Bin, we have z.sh

#cd into script's path
cd $(dirname $0) ; pwd -P
