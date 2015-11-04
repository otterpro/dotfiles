" .vimrc by Daniel Kim (otter.pro)
"
" Thanks to many, including Bram Moolenaar <Bram@vim.org>
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off " required here

set nomodeline  " turn-off modeline, which interpretes text file as vim setting

" load vundles in ~/.dotfiles/vundle.vim
" if filereadable(expand("~/.dotfiles/vundle.vim"))
" 	source ~/.dotfiles/vundle.vim
" endif
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required


" status line
Plugin 'bling/vim-airline'

" File and Buffer
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'

" Mini-Buffer Explorer Fork
" Removed - too much clutter on top
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'jlanzarotta/bufexplorer'

"coding & auto-completion
Plugin 'docunext/closetag.vim.git'  "closes html tag"
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround.git'  "add surrounding brackets,quotes,tags"
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
" Plugin 'Raimondi/delimitMate.git'	"closes < >, (), [], {}"
" Temporarily disabled, until I can selectively close delimiters"

Plugin 'scrooloose/syntastic'	"syntax checker engine
Plugin 'nvie/vim-flake8'		" python syntax checker
Plugin 'nathanaelkane/vim-indent-guides'   " show indent guidelines


"Markdown and text formatting
" Plugin 'godlygeek/tabular' "required for vim-markdown
" Plugin 'plasticboy/vim-markdown' "unfortunately,uses mkd, not markdown as filetype"
" replaced with simpler plugin
Plugin 'tpope/vim-markdown'
"folding is not in tpope's version. we need this to fold
Plugin 'nelstrom/vim-markdown-folding'
		
"snippets
Plugin 'tomtom/tlib_vim.git' " required for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils.git'	" required for snipmate
Plugin 'garbas/vim-snipmate.git'  " SnipMate plugin"
Plugin 'honza/vim-snippets.git'		" all snippets"

" colorschemes-related 
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'  " requierd for colorscheme-switcher
Plugin 'xolox/vim-colorscheme-switcher' "quickly switch colorscheme with F8



call vundle#end()            " required

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

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use: filetype plugin on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"set backspace=2	"this should always be 2

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set cryptmethod=blowfish		"encryption when using vim -x filename"
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set termencoding=utf-8
set encoding=utf-8


" let &guioptions = substitute(&guioptions, "t", "", "g")

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"make sure color is running. doesn't seem to be necessary, as t_Co is set to 256.
"if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
"	set t_Co=256
"endif

" Disable BCE (background-color-erase), because it causes color problem in
" tmux
if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
    set hlsearch      " highlight search terms
endif

"load color scheme from .vim/colors
if &t_Co >= 256 || has("gui_running")
	"echo "256 color mode"
    colorscheme codeschool
	highlight NonText guibg=#060606
	highlight Folded  guibg=#0A0A0A guifg=#9090D0
	set background=dark
endif


"wildmenu allows filename autocompletion with graphical menu
set wildmenu 

"lazyredraw - draws only when needed, faster for doing macro
" if there's problem, then disable it
set lazyredraw



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
set nowrap

set number numberwidth=4 "show line number and show 4 digit

" TAB setting"
set tabstop=4	"hardtab width
set shiftwidth=4 " make "tab" insert indents instead of tabs at the beginning of a line
"set expandtab	" use space instead of tab, also enabled for txt,md,ruby,python.
set softtabstop=4	"space used in softtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent		" always set autoindenting on
"set smartindent	" disabled because it was not indenting # 

"set hidden		"open new file without having to save current file

" disable autobackup"
set nobackup
set noswapfile
"set autowrite	    " saves before changing to another buffer
"set autowriteall    " saves all buffer before quit,new,etc

set colorcolumn=80  "column shows vertical line
"set colorcolumn=+1	"column shows vertical line
hi colorcolumn ctermbg=233 guibg=grey7

" Leader is <Space> 
let mapleader="\<Space>"
let maplocalleader="\\"

" highlight cursorline  *Note: may cause slowdown in large file
set cursorline
hi CursorLine cterm=NONE ctermbg=238 guibg=grey7

" clipboard (macvim/ gvim)
set clipboard=unnamed

"================= Search ===============
set incsearch     " do incremental search / show search 
" make regex search compatible with php,perl,etc. using very magic
" uses magic. see help on "pattern" and "magic"
nn / /\v
" in Visual mode, allow selected text to become search text
" by pressing // "slash twice"
vn // y/<C-R>"<CR>
" in visual mode, <C-r> to replace search text, based on selected text
" http://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
" vn <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" replaced above with this, to escape special characters like backslash
vn <C-r> ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>")

" g, : clear search highlights
nn <leader>, :noh<cr> 

set gdefault    "assumes that %s/abc/def/ is %s/abc/def/g, (no need for g)

"set cmdheight=2 " status bar that is 2 rows. However, this is too high

"================== keyboard remapping ======================
"  use ; as : to save keystrokes. ex: :w can be ;w
nn ; :
vn ; :
" also restore old ; by using ;; 
nn ;; ; 

" remap ;; as Escape. but removed - interferes with java/c-type language 
" inoremap ;; <Esc>
" ESC acts as CR. Use C-c instead, to prevent execution.
" cnoremap ;; <C-c> 
"
" remap "qq" as Escape.  Convenient. replace ";;" 
" originally, was "aa", but it was typed too often
inoremap qq <Esc>
" ESC acts as CR. Use C-c instead, to prevent execution.
cnoremap qq <C-c> 

" move vertically visual line, looks more natural when moving up/down. 
" similar to ^n, ^
nn j gj
nn k gk

" Don't use Ex mode, use Q for formatting
vmap Q gq
nmap Q gqap

"Sudo to write. use w!! to write file if I forgot to sudo
"Steve Losh's http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
cnoremap w!! w !sudo tee % >/dev/null

" solve Paste problem with indents if autoindenting is enabled"
" <F2> (or space-p) to go into paste mode. it en(dis)ables indentation.
set pastetoggle=<F2>
nn <Leader>p <F2>

" Map frequent actions
"
"<Space>o to open a new file: also <c-p> does the same"
nn <Leader>o :CtrlP<CR> 

"<Space>w to save file (lot faster than :w<Enter>):
"nn <Leader>w :w<CR>
"vn <Leader>w :w<CR>
" C-s to save. TO use C-s, some terminals require "stty -ixon" in shell 
" In some terminal, C-s disables all input, until C-q. 
nn <C-s> :w<CR>
vn <C-s> :w<CR>
ino <C-s> <ESC>:w<CR>

" Switch between last two files
nn <Leader><Leader> <c-^>

"
" go to buffer quickly
" control-] overrides tag lookup
" control-[ overrides esc/etc, but doesn't work. cannot override esc
nn <C-]> :bnext<CR>

" Tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" Rails 
" <Leader>r call rake
" nn <Leader>r :!rake<CR>

"<Space>n : toggle number
nn <Leader>n :setlocal nonumber!<CR>

" Display extra whitespace
" MAYBE: move it to code-specific files, setlocal
" set list listchars=tab:»\ ,trail:·,nbsp:·
"
" ====== Folding ===============================
" nn <Space> za
" vn <Space> za
" dont fold by default. If not set, it will open text as folded
" set nofoldenable
set foldenable
set foldlevelstart=1
set foldnestmax=10		" maximum folding level. beyond 10 is crazy

highlight Folded guibg=grey7 ctermbg=238 " set color (one of dark grey=238)

"  Change foldtext (http://dhruvasagar.com/2013/03/28/vim-better-foldtext)
if filereadable(expand("~/.dotfiles/foldtext.vim"))
	source ~/.dotfiles/foldtext.vim
endif

"  Prettify XML (http://vim.wikia.com/wiki/Pretty-formatting_XML)
"  <leader>x 
"  TODO: use it in autocmd, 
"		and use <leader><something> that prettifies all
"		depending on the context
"		for ex: json, xml, etc
if filereadable(expand("~/.dotfiles/prettyxml.vim"))
	source ~/.dotfiles/prettyxml.vim
endif

" prettify JSON
"nmap <leader>j :%!python -m json.tool
"map <Leader>j !python -m json.tool<CR>

if has("autocmd") " Only do this part when compiled with support for autocommands.

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.

  " Put these in an autocmd group, so that we can delete them easily.
  "


  augroup vimrcEx

  " Clear ALL previously set autocommands for the current group
	au! 

	"General default behavior
	"
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	" Also don't do it on gitcommit messages
	autocmd BufReadPost *
		\ if &ft != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif

	"automatically save document when it loses focus
	autocmd BufLeave,FocusLost * wall

	"======== text file ==========="
	" force wrap at 80 characters for all text files
	" however, *.txt are considered as markdown. see below
	autocmd fileType text setlocal textwidth=80 expandtab

	"======== Markdown ============="
	"treat all .txt file as markdown
	autocmd BufNewFile,BufReadPost  *.txt set filetype=markdown
	" enable spellchecking for markdown. TODO: spell file needed?
	autocmd filetype markdown setlocal spell
	" force text wrap at 80 columns
	autocmd filetype markdown setlocal textwidth=80 expandtab

	"========== Python ===============" 
	autocmd filetype python setlocal ts=4 sw=4 sts=4 expandtab fileformat=unix 

	"========= Ruby & rails ==============" 
	autocmd filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd filetype eruby setlocal ts=2 sts=2 sw=2 expandtab

	"========== html & css  ===============" 
	autocmd filetype html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd filetype css setlocal ts=2 sts=2 sw=2 expandtab

	" au BufNewFile,BufRead *.js, *.html, *.css
    " \ set tabstop=2
    " \ set softtabstop=2
    " \ set shiftwidth=2

	"optional, for closetag plugin
	autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1 setlocal ts=2 sts=2 sw=2 expandtab

	"========= nginx ==============="
	au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 


  augroup END

else "if it doesn't have autocmd"
	set autoindent		" always set autoindenting on
	" TODO:this is already set somewhere above(?), 
endif " has("autocmd")

" ============== surround ====================
" quickly enclosing 'vv' encloses current text with angled bracket <>
" usually when pasting URL, Ctrl(or Cmd)V, then quickly hit 'vv'"
" cannot use << since it is used for indenting 
imap vv <Esc>ysiW>
nmap vv ysiW>

imap [[ <Esc>ysiW]<Esc>Ea
" below doesn't work. not sure why. "[{action}" is reserved, so...
" nmap [[ ysiW]<Esc>E
" this also won't work, as [ is reserved in Visual??? 
" vmap [[ S]


imap '' <Esc>ysiW'Ea
nmap '' ysiW'
vmap '' S'
nmap <Leader>' ysiW'

imap "" <Esc>ysiW"Ea
nmap ""  ysiW"
vmap "" S"
nmap <Leader>" ysiW"

imap \\ <Esc>ysiW`Ea
nmap \\  ysiW`
vmap `` S`

nmap <Leader>) ysiW)
nmap <Leader>] ysiW]
nmap <Leader>> ysiW>
nmap <Leader>} ysiW}

" converts 2 lines into markdown URL [text](url) 
" ex:  
" line1: text something
" line2: http://google.com
" {action}
" line1: [text something](http://google.com)
" uses Surround plugin
"<Space>n : toggle number
nmap <Leader>j yss]jysiW)kJdlj

"
"============= gitgutter ================
" disable all gitguter mapping
let g:gitgutter_map_keys = 0

"============= airline  ================
set laststatus=2 "without it, status bar is hidden for airline plugin. it forces status to be always visible

" ============== plasticboy/vim-markdown =====================
" NOT USED ANYMORE
" vim-markdown: folding is enabled by default. disable now
"let g:vim_markdown_folding_disabled=1
" let g:vim_markdown_frontmatter=1  "highlight jekyll frontmatter



" ============== tcomment =======================
nm <Leader># gcc
vm # gc

" ============== NERDTree ========================{{{
let NERDTreeIgnore=['\~$', '^\.pyc','^\.git', '\.swp$', '\.DS_Store$']
let NERDTreeShowHidden=1
"nmap <LocalLeader>nn :NERDTreeToggle<cr>
nn <Leader>e :NERDTreeToggle<cr>
nn <C-e> :NERDTreeToggle<cr>
vn <C-e> :NERDTreeToggle<cr>
ino <C-e> <ESC>:NERDTreeToggle<cr>


" ctrl-p to search only cwd. autochdir & lcd will change cwd 
" This changes cwd whenever file is loaded
" autocmd BufEnter * silent! lcd %:p:h

" instead, I just needed it to Dropbox/_notes
" Should I just use a bash script instead?
" nm <Leader>v :cd ~/Dropbox/_notes
" YES.
"
" Treat <li> and <p> tags like the block tags they are
" this could be placed in .vim/after/indent/html.vim
" also, .= means concat,
" might be fixed in html5
" let g:html_indent_tags .= 'li\|p\|nav'

" Always use vertical diffs
set diffopt+=vertical

" spellfile. I don't have any spell file.
" set spellfile=$HOME/.vim-spell-en.utf-8.add
"
" ========= Ag ============="
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Local config, not used yet.
" if filereadable($HOME . "/.vimrc.local")
"    source ~/.vimrc.local
" endif
