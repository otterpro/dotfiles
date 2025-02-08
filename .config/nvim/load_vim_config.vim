" load legacy vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" ### this is a copy of vimrc but is meant to be slowly migrated to init.lua
source legacy-vimrc
" source ~/.vim/vimrc
" ### since gvimrc is no longer used, it is commented out
" source ~/.vim/gvimrc
