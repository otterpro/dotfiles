" .vimrc by codequickly
"
" based on sample by Bram Moolenaar <Bram@vim.org>

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off " required here

" {{{ Vundle
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'docunext/closetag.vim.git'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim.git'
Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'bling/vim-airline'
Plugin 'plasticboy/vim-markdown'
"Plugin 'tpope/vim-pathogen.git'
Plugin 'garbas/vim-snipmate.git'
Plugin 'honza/vim-snippets.git'
Plugin 'tpope/vim-surround.git'
call vundle#end()            " required"
" }}}

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
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

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
" endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
    set hlsearch      " highlight search terms
endif

"load color scheme from .vim/colors
if &t_Co >= 256 || has("gui_running")
    "colorscheme mustang    
endif


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" disable insert
set textwidth=0
set wrapmargin=0

set number 		"always show number
set nowrap

" TAB setting"
set tabstop=4	"hardtab width
set shiftwidth=4
" make "tab" insert indents instead of tabs at the beginning of a line
" set smarttab
" " always uses spaces instead of tab characters
" set expandtab
" set noexpandtab
"set expandtab	" use space instead of tab, enabled only for python.
set softtabstop=4	"space used in softtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent		" always set autoindenting on
set smartindent
set incsearch     " do incremental search / show search 

"set hidden		"open new file without having to save current file

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
" disable autobackup"
set nobackup
set noswapfile
"set autowrite	    " saves before changing to another buffer
"set autowriteall    " saves all buffer before quit,new,etc

set colorcolumn=80  "80 column shows vertical line
hi colorcolumn ctermbg=233

" change the mapleader space
" let mapleader=","
let mapleader="\<Space>"
let maplocalleader="\\"

" highlight cursorline
" *Note: cursorline may cause slowdown in large file/ long text
set cursorline
hi CursorLine cterm=NONE ctermbg=233  "cursorline color: grey7"

" make regex search compatible with php,perl,etc. using very magic
nn / /\v

" g, : clear search highlights
nn <leader>, :noh<cr> 

set termencoding=utf-8
set encoding=utf-8

set gdefault    "assumes that %s/abc/def/ is %s/abc/def/g, (no need for g)

"set cmdheight=2 " status bar that is 2 rows

"  shortcuts {{{
"  use ; as : to save keystrokes. ex: :w can be ;w
nn ; :
vn ; :
" also restore old ; by using ;; 
nn ;; ; 


" move vertically visual line, looks more natural when moving up/down. 
nn j gj
nn k gk

" Don't use Ex mode, use Q for formatting
vmap Q gq
nmap Q gqap

"Sudo to write
"Steve Losh's http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
" use w!! to write file I forgot to sudo
cnoremap w!! w !sudo tee % >/dev/null

" solve Paste problem with indents if autoindenting is enabled"
" <F2> will disable all indentation.
set pastetoggle=<F2>

" Map frequent actions
"
"<Space>o to open a new file:
nn <Leader>o :CtrlP<CR>

"<Space>w to save file (lot faster than :w<Enter>):
nn <Leader>w :w<CR>

" Rails 
" <Leader>r call rake
nn <Leader>r :!rake<CR>

"<Space>n : toggle number
nn <Leader>n :setlocal nonumber!<CR>

"
" Folding
" nnoremap <Space> za
" vnoremap <Space> za
" dont fold by default
set nofoldenable

"  }}}

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on  " required

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx

    " Remove ALL autocommands for the current group
  au!	

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

    "Python " 
    autocmd filetype python setlocal ts=4 sw=4 sts=4 expandtab
	"autocmd filetype python setlocal ts=2 sw=2 sts=2 expandtab

    "Ruby & rails" 
    autocmd filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd filetype eruby setlocal ts=2 sts=2 sw=2 expandtab

    "HTML" 
    autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab

    "automatically save document when it loses focus
    autocmd BufLeave,FocusLost * wall
  augroup END
else "if it doesn't have autocmd"
    
	"set autoindent		" always set autoindenting on

endif " has("autocmd")
" vim-airline =====================
" vim-airline wasn't showing. This forces status to be always visible
set laststatus=2

"set runtimepath^=~/.vim/bundle/ctrlp.vim

" vim-markdown: folding is enabled by default. disable now
let g:vim_markdown_folding_disabled=1

" tcomment
nm <Leader># gcc
vm # gc

" NERDTree ========================
let NERDTreeIgnore=['\~$', '^\.pyc','^\.git', '\.swp$', '\.DS_Store$']
let NERDTreeShowHidden=1
"nmap <LocalLeader>nn :NERDTreeToggle<cr>
nm <Leader>e :NERDTreeToggle<cr>


" removed pathgen for vundle
" OLD: enable pathogen ================
" call pathogen#infect()
" call pathogen#helptags()
