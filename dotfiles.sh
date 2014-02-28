#!/bin/sh
# Daniel Kim 
#
# creates symlink of all dotfiles and also dot directories into home directory (~)
# WARNING: This is a destructive process.  Any existing files or directories will be overwritten!!!
#
#set -xv #debugging

#cd into script's path
cd $(dirname $0) ; pwd -P

# create symlink for all directories (.vim, ...)
find . -maxdepth 1 -mindepth 1 \! -name "*.git" -type d -exec rm -rf ~/{} ";" -exec ln -sf `pwd`/{} ~/{} ";"

# create symlink for dotfiles (.bashrc, .vimrc, ...)
find . -mindepth 1 -maxdepth 1 -type f -name ".*" -exec ln -sf `pwd`/{} ~/{} ";"
