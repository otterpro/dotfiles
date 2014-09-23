Dotfiles
============
My dotfiles (  .vimrc, .bashrc, .tmux.conf, .vim/,... ) and vim plugins in my github account. 

Download and install

	git clone https://github.com/otterpro/dotfiles.git .dotfiles
	.dotfiles/dotfiles.sh
	
Warning
-------------
I am not liable for any damage you do to your computer or files if you use these files.   
Also, the dotfiles.sh will delete existing dot files and directories as it creates the symlinks.  You have been warned.

Prerequisites
---------------
* vim
* git (obviously)
* tmux, zsh
* curl


Symlinking these files
-----------------------
Creating symlinks appear to be the best solution to keep them in sync.   Run dotfiles.sh to create symlinks of all directories and dot files to ~.  The script contains these lines to create the symlinks.  

	# create symlink for all directories (.vim, ...), but ignore .git/ dir
	find . -maxdepth 1 -mindepth 1 \! -name "*.git" -type d -exec rm -rf ~/{} ";" -exec ln -sf `pwd`/{} ~/{} ";"
	
	# create symlink for dotfiles (.bashrc, .vimrc, ...) but ignore .git* files
	find . -mindepth 1 -maxdepth 1 -type f -name ".*" ! -name ".git*" -exec ln -sf `pwd`/{} ~/{} ";"


