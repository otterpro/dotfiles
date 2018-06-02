#!/bin/bash
#
#
# another alternative
#!/usr/bin/env bash
#
# Daniel Kim 
#
# creates symlink of all dotfiles and also dot directories into home directory (~)
# WARNING: This is a destructive process.  Any existing files or directories will be overwritten!!!
# TODO: rename to install.sh 
#
#set -xv #debugging
# part of vim backup from https://github.com/swaroopch/dotvim/blob/master/install.sh
#
# also, make sure to get bin files first.  In Bin, we have z.sh

#cd into script's path
cd $(dirname $0) ; pwd -P

# Git and Curl required
# note: command -v is better than `which`	

if command -v git &> /dev/null; then
    echo "Install git ( http://git-scm.com ) first"
    exit 1
fi

# if [[ $(which curl) == "" ]]
# then
#     echo "Install curl ( http://curl.haxx.se ) first"
#     exit 1
# fi

if command -v curl &> /dev/null; then
    echo "Install curl ( http://curl.haxx.se ) first"
    exit 1
fi

## Check OS, OS-dependent code
if [[ "$OSTYPE" =~ "darwin" ]]
then
    export OS="mac"
	# first install brew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# git, vim, etc
	brew install git vim
	# zsh
    brew install zsh && \
    sudo sh -c 'echo $(brew --prefix)/bin/zsh >> /etc/shells' && \
    chsh -s $(brew --prefix)/bin/zsh

	#Visual Code - assuming it exists. Hopefully it does
	ln -sf `pwd`/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	ln -sf `pwd`/.dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	ln -sf `pwd`/.dotfiles/VSCode/snippets/ ~/Library/Application\ Support/Code/User/snippets

elif [[ "$OSTYPE" == "linux-gnu" ]]
then
    export OS="linux"
elif [[ "$OSTYPE" == "cygwin" ]]
then
    export OS="cygwin"
elif [[ "$OSTYPE" =~ "freebsd" ]]
then
    export OS="freebsd"
else
    echo "Don't know what to do with '$OSTYPE' operating system"
    exit 1
fi

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh

#vim backup - not as reliable...
# temporarily not using it.
# export VIM_BACKUP_DIR="$HOME/.vim_backup"
# mkdir -p $VIM_BACKUP_DIR
# echo "Backing up existing vim files to $VIM_BACKUP_DIR"
# for f in $(ls -a $VIM_BACKUP_DIR| grep -v '^.$' | grep -v '^..$')
# do
#     rm -rf "$VIM_BACKUP_DIR/$f"
# done
# for f in "$HOME/.vimrc" "$HOME/.gvimrc" "$HOME/.vimrc.local" "$HOME/.vim"
# do
#     [[ -s "$f" ]] && mv -f "$f" $VIM_BACKUP_DIR
# done

# vim Vundle  - no longer installed. 
#echo "Download Vundle
# mkdir -p $HOME/.vim/bundle
# [[  -d "$HOME/.vim/bundle/vundle" ]] || { echo ".vim/bundle/ dir not found";exit 1;}
# git clone http://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"


# make all the symlink. This step needs to come last, so it other install
# such as vim and oh-my-zsh won't interfere.  
#
#echo "Ensuring backup directory exists"
#mkdir -p "$HOME/.vim/backup"

# create symlink for all directories (.vim, ...)
find . -maxdepth 1 -mindepth 1 \! -name "*.git" -type d -exec rm -rf ~/{} ";" -exec ln -sf `pwd`/{} ~/{} ";"

# create symlink for dotfiles (.bashrc, .vimrc, ...)
# except for .git*. <-- however, temporaily I still want .gitconfig file
# so I am copying .gitconfig
# however, there could be other files such as .gitmodules.
#find . -mindepth 1 -maxdepth 1 -type f -name ".*" ! -name ".git*" -exec ln -sf `pwd`/{} ~/{} ";"
find . -mindepth 1 -maxdepth 1 -type f -name ".*" ! -name ".git" -exec ln -sf `pwd`/{} ~/{} ";"

# Vim Plug
echo "Vim-Plug: download all the scripts"
vim +PlugInstall +qall 
