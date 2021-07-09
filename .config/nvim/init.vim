" neovim setting.
" load .vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" TODO: nvim-qt only, not sure how to detect, or have separate setting
"source ~/.dotfiles/.config/gvim.init
