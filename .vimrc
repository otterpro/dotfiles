"=============================================================================
" .vimrc by Daniel Kim (otter.pro)
"
" Thanks to many, including Bram Moolenaar <Bram@vim.org>
"
"=============================================================================
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"=============================================================================
" Global setting
"=============================================================================
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set nomodeline  " turn-off modeline, which interpretes text file as vim setting
"set modelines=1	" enable modeline, interprets last line /commented as vim setting
" disable autobackup"
set nobackup
set noswapfile
"set autowrite	    " saves before changing to another buffer
"set autowriteall    " saves all buffer before quit,new,etc
"set hidden		"open new file without having to save current file

set fileformats=unix "wanted to make sure it's only UNIX, and not DOS format
					" unix = LF, DOS= CRLF

"=============================================================================
" Default Setting
"=============================================================================
set path+=**	"for :find, Search down into subfolders, Provides tab-completion for all file-related tasks

"wildmenu allows filename autocompletion with graphical menu
set wildmenu 

"lazyredraw - draws only when needed, faster for doing macro
" if there's problem, then disable it
set lazyredraw

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"set backspace=2	"this should always be 2

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set cryptmethod=blowfish		"encryption when using vim -x filename"
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" ignore files for ctrlp, etc
set wildignore=*.swp,*.bak,*.pyc,*.class,node_modules
						" node_modules: ignore node files
						" also wildignore += to append

set title                " change the terminal's title
set novisualbell           " don't flash the screen for beep
set noerrorbells         " don't beep

set termencoding=utf-8
set encoding=utf-8

" disable insert
set textwidth=0
set wrapmargin=0
set nowrap

set number numberwidth=4 "show line number and show 4 digit

" TAB and indent setting"
set tabstop=4	"hardtab width
set shiftwidth=4 " make "tab" insert indents instead of tabs at the beginning of a line
"set expandtab	" use space instead of tab, also enabled for txt,md,ruby,python.
set softtabstop=4	"space used in softtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent		" always set autoindenting on
"set smartindent	" disabled because it was not indenting # 
"
"
"=============================================================================
" Terminal setting, color, etc
"=============================================================================
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

" clipboard (macvim/ gvim)
set clipboard=unnamed

" When typing braces { }, [ ], etc, blink the matching brace
" show matching parenthesis
set showmatch
" set matchtime=3		" blink 0.3 seconds
"

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"vertical line - right margin
set colorcolumn=80  
"set colorcolumn=+1	"column shows vertical line
hi colorcolumn ctermbg=233 guibg=grey7

" highlight cursorline  *Note: may cause slowdown in large file
set cursorline
hi CursorLine cterm=NONE ctermbg=238 guibg=grey7

" Treat <li> and <p> tags like the block tags they are
" this could be placed in .vim/after/indent/html.vim
" also, .= means concat,
" might be fixed in html5
" let g:html_indent_tags .= 'li\|p\|nav'

" Always use vertical diffs
set diffopt+=vertical

" spellfile. I don't have any spell file.
" set spellfile=$HOME/.vim-spell-en.utf-8.add

"=============================================================================
"	Vundle packages
"=============================================================================
filetype off " required here before plugin are loaded(?), but turned on later
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

"experimental - current
" VimWiki
Plugin 'vimwiki/vimwiki.git'
let g:vimwiki_list = [{'path': '~/Dropbox/_notes/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

" status line
Plugin 'bling/vim-airline'

"Easy motion -- not working???
Plugin 'easymotion/vim-easymotion'  

" File and Buffer
Plugin 'scrooloose/nerdtree.git'
" Plugin 'kien/ctrlp.vim'  "# no longer maintained?
Plugin 'ctrlpvim/ctrlp.vim'  " replaces old ctrlp

" Mini-Buffer Explorer Fork
" Removed - too much clutter on top
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'jlanzarotta/bufexplorer'

"coding & auto-completion
Plugin 'sheerun/vim-polyglot'		" loads 70+ languages

Plugin 'docunext/closetag.vim.git'  "closes html tag"
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround.git'  "add surrounding brackets,quotes,tags"
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
" Plugin 'Raimondi/delimitMate.git'	"closes < >, (), [], {}"
" Temporarily disabled, until I can selectively close delimiters"
Plugin 'valloric/MatchTagAlways'  "HTML tag is highlighted
" 

Plugin 'scrooloose/syntastic'	"syntax checker engine
Plugin 'nvie/vim-flake8'		" python syntax checker
Plugin 'tmhedberg/SimpylFold'	" python folding
Plugin 'nathanaelkane/vim-indent-guides'   " show indent guidelines

Plugin 'Valloric/YouCompleteMe'
" Plugin 'davidhalter/jedi-vim'
"
Plugin 'rking/ag.vim.git'	"silver searcher

"Markdown and text formatting
Plugin 'godlygeek/tabular' "required for vim-markdown. 
" Plugin 'plasticboy/vim-markdown' "unfortunately,uses mkd, not markdown as filetype"
"
" Temporary disabled while using vim-polyglot
" replaced with simpler plugin
" Plugin 'tpope/vim-markdown'
"folding is not in tpope's version. we need this to fold
"
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'dhruvasagar/vim-table-mode'    "Create table

"snippets
" Plugin 'tomtom/tlib_vim.git' " required for snipmate
" Plugin 'MarcWeber/vim-addon-mw-utils.git'	" required for snipmate
" Plugin 'garbas/vim-snipmate.git'  " SnipMate plugin"
" http://jmatthews.us/blog/2013/03/10/managing-vim-python-plugins/
if (has('python') || has('python3'))
  Plugin 'SirVer/ultisnips'
else
  Plugin 'garbas/vim-snipmate'
endif
Plugin 'honza/vim-snippets.git'		" all snippets"

" colorschemes-related 
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'  " requierd for colorscheme-switcher
Plugin 'xolox/vim-colorscheme-switcher' "quickly switch colorscheme with F8,sF8

"shell
" Plugin 'Shougo/vimshell'  " shell, not as useful
" Plugin 'Shougo/vimproc'  "required by vimshell. also need to be 'make'

" Removed for now
" Plugin 'lrvick/Conque-Shell'	" conque shell fork, works

"Plugin 'vim-scripts/Conque-Shell'  "shell, won't work in VUndle!

" smooth scroll
Plugin 'terryma/vim-smooth-scroll'

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

filetype plugin indent on    " required, enables all filetype detection based on	
" file extension, turns on all including detection, plugin, and indent
" To ignore indent , instead use just : filetype plugin on


"=============================================================================
" Settings to override after plugin installed
"=============================================================================
" let &guioptions = substitute(&guioptions, "t", "", "g")

"load color scheme from .vim/colors
if &t_Co >= 256 || has("gui_running")
	"echo "256 color mode"
    "colorscheme slate
    "colorscheme darkblue
	colorscheme badwolf "colorscheme by Steve Losh
	
	highlight NonText guibg=#060606
	highlight Folded  guibg=#0A0A0A guifg=#9090D0
	set background=dark  "well-behaved colorschemes will respect it
endif

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
"  00 => ), 99=> (.  avoid pressing shift
"inoremap 00 )
"inoremap 99 (
"
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Leader is <Space> 
let mapleader="\<Space>"
let maplocalleader="\\"

" remap <ctrl><space> to underscore, easier!!!
inoremap <C-space> _

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
" in cmd mode, ESC acts as CR. Use C-c instead, to prevent execution.
cnoremap qq <C-c> 
" also qq in normal mode was annoying, as it records macro. Disable it.
nnoremap qq <Nop>

" move vertically visual line, looks more natural when moving up/down. 
" similar to ^n, ^
nn j gj
nn k gk

" Don't use Ex mode, use Q for formatting
vmap Q gq
nmap Q gqap

" Capitalize the 1st letter of the line/sentence 
" Current: <leader>u to capitalize
" OLD: use "uu" to capitalize, annoying - undo took too long time
" Note: U is mapped to repeat undo plugin
nnoremap <Leader>u 0gUl
"nnoremap uu 0gUl

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
" Decide to remove it for now, because it conflicts with ctag lookup
" nn <C-]> :bnext<CR>
" TODO: :b# as well

" Tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" Rails 
" <Leader>r call rake
" nn <Leader>r :!rake<CR>

"<Space>n : toggle number
nn <Leader>n :setlocal nonumber!<CR>

"use <left> and <right> for my buffers.  Better use of arrows
nnoremap <silent> <right> :bnext<cr>
nnoremap <silent> <left> :bprev<cr>

" highlight last inserted text - does it work? 
nnoremap gV `[v`]

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
set foldlevelstart=10	"open most folds by default"
set foldnestmax=10		" maximum folding level. beyond 10 is crazy

highlight Folded guibg=grey7 ctermbg=238 " set color (one of dark grey=238)

"  Change foldtext (http://dhruvasagar.com/2013/03/28/vim-better-foldtext)
if filereadable(expand("~/.dotfiles/foldtext.vim"))
	source ~/.dotfiles/foldtext.vim
endif

"=============================================================================
" 
"=============================================================================
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

"=============================================================================
" autocmd
"=============================================================================

if has("autocmd") " Only do this part when compiled with support for autocommands.

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.

  " Put these in an autocmd group, so that we can delete them easily.

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
	" autocmd filetype markdown setlocal spell
	" However, I disabled it since I didn't have spell file
	
	" force text wrap at 80 columns
	autocmd filetype markdown setlocal textwidth=80 expandtab

	"========== Python ===============" 
	autocmd filetype python setlocal ts=4 sw=4 sts=4 expandtab fileformat=unix 
	autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
	autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

	"========= Ruby & rails ==============" 
	autocmd filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd filetype eruby setlocal ts=2 sts=2 sw=2 expandtab

	"========== js,html & css  ===============" 
	"autocmd filetype html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript,html,htmldjango,jinjahtml,eruby,mako setlocal ts=2 sts=2 sw=2 expandtab
	autocmd filetype css setlocal ts=2 sts=2 sw=2 expandtab

	" au BufNewFile,BufRead *.js, *.html, *.css
    " \ set tabstop=2
    " \ set softtabstop=2
    " \ set shiftwidth=2

	"optional, for closetag plugin
	" Make sure to comment this out if not using closetag plugin.
	"autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1 setlocal ts=2 sts=2 sw=2 expandtab

	"========= nginx ==============="
	au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 

	"========= after grep,make, open quickfix window automatically ==============="
	" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
	" Automatically open, but do not go to (if there are errors) the quickfix /
	" location list window, or close it when is has become empty.
	"
	" Note: Must allow nesting of autocmds to enable any customizations for quickfix
	" buffers.
	" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
	" (but not if it's already open). However, as part of the autocmd, this doesn't
	" seem to happen.
	autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost l*    nested lwindow

  augroup END

else "if it doesn't have autocmd"
	set autoindent		" always set autoindenting on
	" TODO:this is already set somewhere above(?), 
endif " has("autocmd")

"=============================================================================
"  plugin settings
"=============================================================================
"
" 
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
"nmap <Leader>j yss]jysiW)kJdlj
nmap <Leader>j :call TrimWhitespace()<CR>yss]jysiW)kJdlj
" updated so that it will trim trailing whitespace first
"
"============= easymotion ================
" not working???
let g:EasyMotion_do_mapping=0  " disable all default mapping/too many maps"

" s<char> to jump to that char
nmap S <Plug>(easymotion-s2)
	"search 2 char"
	"Becareful, since S in Visual mode is used by Surround"
	"Replaces S, which is same as 'cc'"
nmap s <Plug>(easymotion-s)
	" search 1 char"
	"s replaces normal s where it deletes char and inserts.
	"s is same as `cl`"

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
"

"
"============= gitgutter ================
" disable all gitguter mapping
let g:gitgutter_map_keys = 0

"============= youcompleteme ================
let g:ycm_autoclose_preview_window_after_completion=1

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"		go to definition
"
"========== snipmate/Utilsnips =========================
"YouCompleteMe causes conflict as it overrides TAB
"replace tab with C-J instead for now
"TODO: combine YouCompleteMe with UtilSnip's TAB
"		https://github.com/Valloric/YouCompleteMe/issues/36
if (has('python') || has('python3'))
	"======== utilsnips ===================
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"
	
else
	"======== snipmate ====================
	"imap <C-J> <Plug>snipMateNextOrTrigger
	" use below instead of above for now
	imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
	smap <C-J> <Plug>snipMateNextOrTrigger
endif


"============= airline  ================
set laststatus=2 "without it, status bar is hidden for airline plugin. it forces status to be always visible
let g:airline#extensions#whitespace#enabled = 0  "disable whitespace detection
	" and hides "mixed-indent [], trailing [] on the status line
let g:airline_detect_spell=0
	" hide SPELL CHECKING status 
let g:airline#extensions#wordcount#enabled = 0
	" disable word counting. 


" ============== plasticboy/vim-markdown =====================
" NOT USED ANYMORE
" vim-markdown: folding is enabled by default. disable now
"let g:vim_markdown_folding_disabled=1
" let g:vim_markdown_frontmatter=1  "highlight jekyll frontmatter


" ============== vim-table-mode =======================
let g:table_mode_corner="|" " make table compatible with Markdown.

" ============== tcomment =======================
nm <Leader># gcc
vm # gc

" ============== NERDTree ========================{{{
let NERDTreeIgnore=['\~$', '^\.pyc','^\.git', '\.swp$', '\.DS_Store$']
let NERDTreeShowHidden=1
"nmap <LocalLeader>nn :NERDTreeToggle<cr>
" added % at end of NERDTreeToggle so that it opens cwd(?) and not old dir
nn <Leader>e :NERDTreeToggle %<cr>
"nn <C-e> :NERDTreeToggle %<cr>
"vn <C-e> :NERDTreeToggle %<cr>
"ino <C-e> <ESC>:NERDTreeToggle %<cr>

" old way - could be useful
" nn <Leader>e :NERDTreeToggle<cr>
" nn <C-e> :NERDTreeToggle<cr>
" vn <C-e> :NERDTreeToggle<cr>
" ino <C-e> <ESC>:NERDTreeToggle<cr>

" ============== ctrlp ========================{{{
" ctrl-p to search only cwd. autochdir & lcd will change cwd 
"	autochdir breaks Nerdtree. using lcd instead
" This changes cwd whenever file is loaded
autocmd BufEnter * silent! lcd %:p:h

" instead, I just needed it to Dropbox/_notes
" Should I just use a bash script instead?
" nm <Leader>v :cd ~/Dropbox/_notes
" YES.
"

"
" ========= Ag ============="
if executable('ag')
  " Use Ag over Grep
  " Original: works on Mac, Linux
  " set grepprg=ag\ --nogroup\ --nocolor
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore

  "	original, works on Unix, Mac
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "	if windows version won't work on Mac, change back to this or use
  "	conditional
  "	 if has( 'unix' )
    "    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    "elsif has( 'win32' )
        " ?
	"endif
	

  " windows version
	let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Local config, not used yet.
" if filereadable($HOME . "/.vimrc.local")
"    source ~/.vimrc.local
" endif
"
" Trim trailing whitespace
"http://vi.stackexchange.com/a/456
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

"================= vim-smooth-scroll ========================
" remap <c-b>,<c-f> vim scroll to plugin's smooth-scroll 
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


"================= settings that must override all ========================

" Highlight matching braces { }, [ ], ( ), etc
"let loaded_matchparen = 0
"DoMatchParen
hi MatchParen ctermbg=yellow ctermfg=blue guifg=blue guibg=yellow
" set color for matching braces, etc

" comments in italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic 




"================== Must be last line and in quote and modelines=1 ======================
" currently disabled, since I didn't want to use modelines
" vim:foldmethod=marker:foldlevel=0
