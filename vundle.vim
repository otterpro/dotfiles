set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required

" Plugin 'docunext/closetag.vim.git'


" status line
Plugin 'bling/vim-airline'

" File
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'

"coding
Plugin 'Raimondi/delimitMate.git'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround.git'

"Markdown and text formatting
Plugin 'godlygeek/tabular' "required for vim-markdown"
Plugin 'plasticboy/vim-markdown'

"snippets
Plugin 'tomtom/tlib_vim.git' " required for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils.git'	" required for snipmate
Plugin 'garbas/vim-snipmate.git'
Plugin 'honza/vim-snippets.git'

" colorschemes-related 
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'  " requierd for colorscheme-switcher
Plugin 'xolox/vim-colorscheme-switcher' "quickly switch colorscheme with F8

call vundle#end()            " required"

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" 
