#!/bin/sh

# download Pure prompt from git
git clone git@github.com:sindresorhus/pure.git ~/.pure

# symlink to zsh functions....
ln -s ~/.pure/pure.zsh /usr/share/zsh/site-functions/prompt_pure_setup

# symlink cygwin compatible version of async 
# as the default async.zsh doesn't work well with cygwin
# assuming ~/.dotfiles/_win/zsh-async is already downloaded
# either git clone (or download just the no-zpty branch's `async.zsh`)
# git clone git@github.com:mafredri/zsh-async.git ~/.zsh-async
# cd ~/.zsh-async
# git checkout no-zpty   # go to no-zpty branch!!!
# link async version without zpty
ln -s ~/.dotfiles/_win/zsh_async_cygwin.zsh /usr/share/zsh/site-functions/async
