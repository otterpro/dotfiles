#!/bin/sh
#./debian

# essential for .dotfiles
apt install -y git vim htop curl wget 

# other essentials
apt install -y rsync build-essential unzip imagemagick ffmpeg tmux emacs

# install node.js
curl -fsSL https://deb.nodesource.com/setup_15.x
apt install -y nodejs

# TODO:
# oh-my-zsh or zim or zplug or other zsh plugin system
