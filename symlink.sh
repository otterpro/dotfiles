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

# make all the symlink. This step needs to come last, so it other install
# such as vim and oh-my-zsh won't interfere.  
#
#echo "Ensuring backup directory exists"
#mkdir -p "$HOME/.vim/backup"

# create symlink for all directories (.vim, ...)
# EXCEPT for all Directory that starts with underscore (such as _mac, _win, _optional)
# and EXCEPT .git folder
# TODO: instead of all folders except for underscore, just copy all folders starting with dot
find . -maxdepth 1 -mindepth 1 \! -name "*.git" \! -name "_*" -type d -exec rm -rf ~/{} ";" -exec ln -sf `pwd`/{} ~/{} ";"

# create symlink for dotfiles (.bashrc, .vimrc, ...)
find . -mindepth 1 -maxdepth 1 -type f -name ".*" ! -name ".DS_Store" -exec ln -sf `pwd`/{} ~/{} ";"
