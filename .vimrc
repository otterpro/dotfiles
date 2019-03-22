"=============================================================================
" .vimrc by Daniel Kim (otter.pro)
"
" Thanks to many, including Bram Moolenaar <Bram@vim.org>
"
" TODO: move autcmd into separate language files
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
set autowrite	    " saves before changing to another buffer
					" enabled on 2/2018, not sure how it will work
"set autowriteall    " saves all buffer before quit,new,etc
"set hidden		"open new file without having to save current file

set fileformats=unix,dos "wanted to make sure it's only UNIX, and not DOS format
					" unix = LF, DOS= CRLF
					" by default, uses unix to read/write
					" but also detects dos 


"set regexpengine=1 " 1=use old regex engine, supports everything - faster in some cases"

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
"set cryptmethod=blowfish		"encryption when using vim -x filename"
"temporarily removed cryptmethod because of incompatibility with nvim

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" ignore files for ctrlp, etc
set wildignore=*.swp,*.exe,*.dll,*.bak,*.pyc,*.class,node_modules
						" node_modules: ignore node files
						" also wildignore += to append

set title                " change the terminal's title
set novisualbell           " don't flash the screen for beep
set noerrorbells         " don't beep
set belloff=all

set termencoding=utf-8
set encoding=utf-8

" disable insert
set textwidth=0		" set this to N to force wrap at this margin
set wrapmargin=0	" Don't use this. For old vi compatibility
set nowrap			" no word-wrap
set nolist			" off by default, shows diff between tab and space

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
"   Now using Plug, replacing Vundle
"=============================================================================
filetype off " required here before plugin are loaded(?), but turned on later
" set rtp+=~/.vim/bundle/vundle
"
" call vundle#begin(): TODO: delete this line if vim-plugin is approved

" install vim-plug if it is not installed (need curl!)
" But removed - causing problem with windows setup 
" if empty(glob("~/.vim/autoload/plug.vim"))
" 	execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
" endif
"
"call plug#begin('~/.vim/plugged')
call plug#begin()
" arbitrary directory. I'm using plugged/, which is same as example

" CSS-color, shows color for #ffffff
Plug 'ap/vim-css-color'  
" disabled for performance issue

" status line
" Plug 'bling/vim-airline'  "OLD name, plugin moved to new name
Plug 'vim-airline/vim-airline'

"Easy motion -- not working???
Plug 'easymotion/vim-easymotion'  

" quick-scope for f,F,t,T, ;, movement
Plug 'unblevable/quick-scope'  

" File and Buffer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'kien/ctrlp.vim'  "# no longer maintained?
Plug 'ctrlpvim/ctrlp.vim'  " replaces old ctrlp
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Mini-Buffer Explorer Fork
" Removed - too much clutter on top
" Plug 'fholgado/minibufexpl.vim'
Plug 'jlanzarotta/bufexplorer'

"coding & auto-completion

"Plug 'sheerun/vim-polyglot'		" loads 70+ languages , disabled its markdown because it was causing slow loading of big files
Plug 'fatih/vim-go'				" loads full version. polyglot only gets highlight?
Plug 'tpope/vim-repeat'
Plug 'docunext/closetag.vim'  "closes html tag"

"Plug 'townk/vim-autoclose'    " close (,{, ... (Not tested yet)

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'  "add surrounding brackets,quotes,tags"

Plug 'airblade/vim-gitgutter' " Temp disabled for perf check? so far, not too bad

Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'  "closes < >, (), [], {}
" Temporarily disabled, until I can selectively close delimiters"
Plug 'valloric/MatchTagAlways'  "HTML tag is highlighted, requires python

Plug 'prettier/vim-prettier'  "Prettier for Javascript

Plug 'scrooloose/syntastic'	"syntax checker engine
Plug 'nvie/vim-flake8'		" python syntax checker
Plug 'tmhedberg/SimpylFold'	" python folding
Plug 'nathanaelkane/vim-indent-guides'   " show indent guidelines
Plug 'ervandew/supertab'
" Plug 'Shougo/neocomplete.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'davidhalter/jedi-vim'
"
"Plug 'rking/ag.vim.git'	"silver searcher
" according to maintainer, it is deprecated due to licensing
" instead, use ack.vim to run ag.vim (as recommended)
Plug 'mileszs/ack.vim'
" somehow, the :Ack is not working at all

"Markdown and text formatting
"Plug 'SidOfc/mkdx'   " New Markdown "just testing for now
Plug 'godlygeek/tabular' "required for vim-markdown. 
Plug 'plasticboy/vim-markdown' 
" Plasticboy's markdown is included in Polyglot but that is missing features
" such as TOC, so it is loaded here 

" Tpope's version is now default Vim, so it is no longer needed
" Plug 'tpope/vim-markdown'
"folding is not in tpope's version. we need this to fold, but we're using plasticboy so this is not needed?
" Plug 'nelstrom/vim-markdown-folding'

Plug 'dhruvasagar/vim-table-mode'    "Create table

"bullets - add bullets easily and convert bullets easily
Plug 'dkarter/bullets.vim'		" bullet points

"bookmark - show bookmarks
Plug 'kshenoy/vim-signature'

"Emoji
Plug 'junegunn/vim-emoji'

"snippets
" http://jmatthews.us/blog/2013/03/10/managing-vim-python-plugins/
if (has('python') || has('python3'))
	Plug 'SirVer/ultisnips'
else
	Plug 'MarcWeber/vim-addon-mw-utils' "pre-requisites
	Plug 'tomtom/tlib_vim' "pre-requisites
	Plug 'garbas/vim-snipmate'
endif
Plug 'honza/vim-snippets'		" all snippets"

" colorschemes-related 
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-misc'  " requierd for colorscheme-switcher
Plug 'xolox/vim-colorscheme-switcher' "quickly switch colorscheme with F8,sF8

"shell
" Plug 'Shougo/vimshell'  " shell, not as useful
" Plug 'Shougo/vimproc'  "required by vimshell. also need to be 'make'

" Plug 'lrvick/Conque-Shell'	" conque shell fork, works
"Plug 'vim-scripts/Conque-Shell'  "shell, won't work in VUndle!

" smooth scroll
Plug 'terryma/vim-smooth-scroll'

" Wakatime plugin for monitoring programming activity
" - Slows down load time, disabled!!!
" Plug 'wakatime/vim-wakatime'

" Undotree (Vim 7.0+)
Plug 'mbbill/undotree'

"Golden Ratio - automatically resize window to golden ratio
Plug 'roman/golden-ratio'

" testing livedown markdown preview
" Plug 'shime/vim-livedown'
" above works ok, but not live in windows

Plug 'suan/vim-instant-markdown'

" testing for now, not really worth it yet???
" Plug 'bagrat/vim-workspace'

" --- TO TRY ------
" improve folding speed, as too many fold slows down 
" Plug 'Konfekt/FastFold'

" highlight sections/paragraphs
" Plug 'limelight.vim'

"Remember setting esp folded state
" Plug 'zhimsel/vim-stay'

call plug#end()
" call vundle#end()            " required

filetype plugin indent on    " required, enables all filetype detection based on	
" file extension, turns on all including detection, plugin, and indent
" To ignore indent , instead use just : filetype plugin on
" ME: not sure if this is needed. Vestige from Vundle???


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

	"some of my highlighting
	hi htmlH2 guifg=#afdf00 ctermfg=148
	hi htmlH3 guifg=#afaf00 ctermfg=142
	hi htmlH4 guifg=#af8700 ctermfg=136
	hi htmlH5 guifg=#af5f00 ctermfg=130

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
" LocalLeader set to single backslash for now
let maplocalleader="\\"

" remap <ctrl><space> to underscore, easier!!!
" also it is same as <C-@>
" disabled: not used, underscore is rarely used and easy reach for finger"
" also wanted to use <c-o>"
" inoremap <C-space> _

" remap <ctrl><space> to <c-o> insert
" hard to remember <c-o> during insert mode"
inoremap <C-space> <c-o>

" I want to use <C-d> but that is taken by indent"
" disabled: instead use <C-space>dd above (which is <C-o>dd)"
" inoremap <C-l> <C-o>dd

" remap << and >> to tab/untab in insert"
inoremap << <C-D>
inoremap >> <C-T>

" semicolon to colon
"  use ; as : to save keystrokes. ex: :w can be ;w
"  disabled, now using ; to open buffer or MRU
"nn ; :
"vn ; :
" also restore old ; by using ;; 
nn ;; ; 

" <ESC> alternative
" remap ;; as Escape. but removed - interferes with java/c-type language 
" inoremap ;; <Esc>
" ESC acts as CR. Use C-c instead, to prevent execution.
" cnoremap ;; <C-c> 
" remap "qq" as Escape.  Convenient. replace ";;" 
" originally, was "aa", but it was typed too often
" disabled because typing q was slow"
" inoremap qq <Esc>

" in cmd mode, ESC acts as CR. Use C-c instead, to prevent execution.
cnoremap qq <C-c> 
" also qq in normal mode was annoying, as it records macro. Disable it.
nnoremap qq <Nop>

" move vertically visual line, looks more natural when moving up/down. 
" similar to ^n, ^
nn j gj
nn k gk

" ctrl-J and ctrl-K as page down/up
" NOTE: <C-J> is also mapped to other pluggins in insert/ select mode/ NERDTREE, etc
" Also on other system, I use 10j, 10k instead, moving only certain # of lines
nn <C-J> <C-d>
nn <C-K> <C-u>
vn <C-J> <C-d>
vn <C-K> <C-u>

" <c-j>, <c-k> moves cursor up/down a line while in insert"
inoremap <C-J> <down>
inoremap <C-K> <up>
" <c-h>, <c-l> moves cursor left/right while in insert"
inoremap <C-h> <left>
inoremap <C-l> <right>

" common remap, also found in :help yank
nn Y y$

" Don't use Ex mode, use Q for formatting
vmap Q gq
nmap Q gqap

" Capitalize the 1st letter of the line/sentence 
" Current: <leader>u to capitalize OLD: use "uu" to capitalize, annoying -
" undo took too long time
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

" refresh syntax highlighting - esp for long problemetic markdown
" doesn't work always, and is also very slow operation
" it's faster to :syntax sync minlines=500
noremap <F5> <Esc>:syntax sync fromstart<CR>
inoremap <F5> <C-o>:syntax sync fromstart<CR>

" when tabbing using > to indent, stay in visual mode. Normal behavior is to
" get out of visual mode
vn > >gv
vn < <gv

" toggle word-wrap
nmap <Leader>w :set wrap!<CR>

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
" in insert mode, save and return to insert mode
" Before: stay at NORMAL mode after saving
" ino <C-s> <ESC>:w<CR>
" After: return to INSERT mode after saving
ino <C-s> <C-o>:w<CR>

" Switch between last two files (:b#/:e#)
nn <Leader><Leader> <c-^>

" highlighted text - remove all empty lines
vn <Leader>d :g/^$/d<CR>

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

"<Space>v : paste from clipboard
" added because in Windows, Shift+Insert was awkward
" and Autohotkey's ctrl-v got ctrl key stuck on down position
" TODO: when I get a programmable keyboard, this can be removed...
nn <Leader>v "+gP

"use <left> and <right> for my buffers.  Better use of arrows
" but disabled, as sometimes, I want to use arrow for moving cursors
" nnoremap <silent> <right> :bnext<cr>
" nnoremap <silent> <left> :bprev<cr>

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
"  TODO: improve folding, want hierarchical /tree structure instead
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
" tagbar
"=============================================================================
let g:tagbar_type_markdown = {
	    \ 'ctagstype' : 'markdown',
	    \ 'kinds' : [
	        \ 'h:Heading_L1',
	        \ 'i:Heading_L2',
	        \ 'k:Heading_L3'
	    \ ]
\}

"=============================================================================
" Plasticboy vim-markdown TOC function (used internally when opening doc)
"=============================================================================
function! s:Toc()
	" allows Toc to be loaded when document is opened, see autocmd below
	" however, it seems to be slow, esp on bigger document
	" and adds 1 second of delay 
	if &filetype == 'markdown'                                                                                                                                                      
		"autocmd! syntastic BufEnter
		:Toc
	endif
endfunction

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
	" however, *.txt are considered as markdown. see below
	
	"disabled expandtab for now
	"autocmd fileType text setlocal expandtab

	" temporary disabled: force wrap at 80 characters for all text files
	"autocmd fileType text setlocal textwidth=80 expandtab

	"======== Markdown ============="
	"treat all .txt file as markdown
	autocmd BufNewFile,BufReadPost  *.txt set filetype=markdown

	" fix indent issue with bullet 
	"also can be placed in .vim/after/indent/markdown.vim:
	autocmd filetype markdown setlocal formatoptions=tqlnrcj comments=b:>
	" ME: added 'j' to join comments without comment leaders
	

	" no longer needed? (was for TPope's md plugin)
    "autocmd BufNewFile,BufReadPost *.md set filetype=markdown
	
	" enable spellchecking for markdown. TODO: spell file needed?
	" autocmd filetype markdown setlocal spell
	" However, I disabled it since I didn't have spell file
	
	"disabled expandtab for now
	"autocmd filetype markdown setlocal expandtab
	
	" temporarily disabled: force text wrap at 80 columns?
	"autocmd filetype markdown setlocal textwidth=80 expandtab
	
	" Force all opened doc to show Toc. Is this useful???
	" should be disabled, as it was slowing the load time of large files
	" increases load time by 1 second on large file
	autocmd BufWinEnter *.md call s:Toc()
    autocmd BufWinEnter *.txt call s:Toc()

	" Fix bullet point list issue

	"========== Python ===============" 
	autocmd filetype python setlocal ts=4 sw=4 sts=4 expandtab fileformat=unix 
	autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
	autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

	"========== Win/DOS ===============" 
	" Dos batch, autohotkey, ps1 for now
	" Note: PS1 is not built-in filetype, but is provided as part of polyglot plugin?
	autocmd filetype dosbatch,autohotkey,ps1 setlocal ts=4 sw=4 sts=4 expandtab fileformat=dos

	"=============== GOLANG ================="
	autocmd FileType go nmap <leader>b  <Plug>(go-build)
	autocmd FileType go nmap <leader>r  <Plug>(go-run)

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
	autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1 

	"========= nginx ==============="
	au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 

	"============ crontab ============="
	autocmd FileType crontab setlocal nowritebackup	
	" This is specific to Mac

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
" CURRENTLY just using LEADER > instead... sometimes vv slows down v
" quickly enclosing 'vv' encloses current text with angled bracket <>
" usually when pasting URL, Ctrl(or Cmd)V, then quickly hit 'vv'"
" cannot use << since it is used for indenting 
" 
" imap vv <Esc>ysiW>
" nmap vv ysiW>

" [[ will surround current typing text into [ xxx ]
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

	" as testing this h
" \\ => surround with `backtick` for markdown codes 
imap \\ <Esc>ysiW`Ea
nmap \\  ysiW`
"vmap `` S`
vmap \\ S`
" surround ` ` for entire line
nmap <Leader>\ 0ys$`
" remove surrounding backticks ` ` 
" nmap d\ ds`
" same as ||, but | must be escaped or use <bar>
nmap <bar><bar> ds`

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
" updated so that it will trim trailing witespace first
"nmap <Leader>j :call TrimWhitespace()<CR>yss]jysiW)kJdlj
" updated, strangely it stopped going to first column, so force it to go to first column 
nmap <Leader>j :call TrimWhitespace()<CR>0yss]jysiW)kJdlj
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
	"not as useful, since `t` or `f` can be highlighted using `Quickscope` plugin

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

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
	" disable Trigger for normal / Supertab
	" enable for YCM or others
	" let g:UltiSnipsExpandTrigger="<c-j>"
	" :
	" Instead of <TAB>, use <C-j> since Tab is taken by 
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"

	" keep all private snippets in .vim/Ultisnips/ 
	" however, public snippets are still available
	let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
	" :UltiSnipsEdit to split window.
	let g:UltiSnipsEditSplit="vertical"

	
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

" ============== polyglot ==========================
"let g:polyglot_disabled = ['markdown']
" disabled markdown handling from polyglot, since it is handled by plasticboy plugin. Polyglot's markdown conflicts with Plasticboy's -- causes slowdown?
" however, above still didn't help much...

" ============== plasticboy/vim-markdown =====================
" vim-markdown: folding is enabled by default. disable now
"let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1  "highlight jekyll frontmatter

" [..](...) will follow without need for .MD extension
" [link](file1) works as [link](file1.md)
let g:vim_markdown_no_extensions_in_markdown = 1

" make sure to disable this, or $ will cause highlight to stop
let g:vim_markdown_math = 0

" increase markdown buffer so that highlighting doesn't break in long code
" Temp disabled both lines to check perf
" syntax sync minlines=300
" let g:markdown_minlines = 100

" fix issues with bullet point * and unwanted indents 
" [Vim with Markdown, how to remove blankspace after bullet point? - Stack Overflow](https://stackoverflow.com/questions/46876387/vim-with-markdown-how-to-remove-blankspace-after-bullet-point)
" also can be placed in .vim/ftplugin/markdown.vim
let g:vim_markdown_new_list_item_indent = 0

" also see autocmd above for additional `setlocal`

"limit bold/italic to single line
" also removes ugly situation where there's hanging _ or * 
let g:vim_markdown_emphasis_multiline = 0

" folding had to be disabled, as it was causing vim to slow down on any large files
" it only affects plasticboy's plugin, as Foldexpr_markdown() was causing problems
let g:vim_markdown_folding_disabled = 1

" see if TOC autofit works well
let g:vim_markdown_toc_autofit = 1

" ============== Bullets.vim =======================
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

" ============== vim-table-mode =======================
let g:table_mode_corner="|" " make table compatible with Markdown.

" ============== tcomment =======================
" This is not useful. More conveninet to use `gcc`
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
" autocmd BufEnter * silent! lcd %:p:h
	" *** above, completely disabled for now, and using noautchdir for now
	" testing: see if it is ok.

" not sure if I want dir changed when buffer loaded
" not sure how this will affect above line
set noautochdir
" doesn't seem to work???
" could be reset in ctrlp plugin

" instead, I just needed it to Dropbox/_notes
" Should I just use a bash script instead?
" nm <Leader>v :cd ~/Dropbox/_notes
" YES.

" semicolon - open buffers list
" OR if not, load MRU using :CtrlPMRU as an alternative
nn ; :CtrlPBuffer<Enter>
vn ; :CtrlPBuffer<Enter>


" ========= rg: ripgrep  ============="
if executable('rg') 
    set grepprg=rg\ --vimgrep\ -i
	"removed because it is case-sensitive by default, but ag is not
endif

"temp testing
"
" ========= Ag silversearcher ============="
if executable('ag')
  " Use Ag over Grep
	  " Problem with ag: some file with colon ":" not opening?
  "set grepprg=ag\ --nogroup\ --nocolor
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    if has( 'win32' )
		" temporarily skip, if on Win
		" but ag works fine, but
		"1. Too slow on Windows for file listing
		"2. just that ctrl/esc was too sensitive, and ag had a little bit of
		"		delay so it wasn't registereing fast enough sometimes
		"		but will go back to AG if ok
		"		if windows version won't work on Mac, change back to this or use
		"TODO: change to rg?
	  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
	  " ag is not fast enough in Windows
	  " let g:ctrlp_use_caching = 0
  else
	  " CtrlP uses ag if it can
		" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
	  " ag is fast enough that CtrlP doesn't need to cache
	  let g:ctrlp_use_caching = 0

	  "replace grep
		"set grepprg=ag\ --nogroup\ --nocolor

	  " Ack should also use ag instead, although considering ripgrep
	  let g:ackprg = 'ag --vimgrep'
	  "let g:ackprg = 'rg\ --vimgrep'
	endif
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
" I may get rid of it... not as useful...
" remap <c-b>,<c-f> vim scroll to plugin's smooth-scroll 
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"
"================= quick-scope ========================
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


"================= VimWiki ========================
let g:vimwiki_list = [{'path': '~/Dropbox/_notes/',
                        \ 'syntax': 'markdown', 'ext': '.md' }]
" disable mapping which I don't like, we need to map these
" By mapping these to anything, it disables the mapping.  
nmap <Leader>wb1 <Plug>VimwikiGoBackLink
nmap <Leader>wn1 <Plug>VimwikiNextLink
nmap <Leader>wp1 <Plug>VimwikiPrevLink
nmap <Leader>wp-- <Plug>VimwikiRemoveHeaderLevel
nmap <Leader>wp== <Plug>VimwikiAddHeaderLevel
nmap <Leader>wp++ <Plug>VimwikiNormalizeLink
nmap <Leader>wtl <Plug>VimwikiTableMoveColumnLeft
nmap <Leader>wdp		<Plug>VimwikiDiaryPrevDay
nmap <Leader>wdn		<Plug>VimwikiDiaryNextDay
" imap <Leader>wp3 <Plug>VimwikiDecreaseLvlSingleItem
" imap <Leader>wp4 <Plug>VimwikiIncreaseLvlSingleItem
" imap <Leader>wp5 <Plug>VimwikiListNextSymbol
" imap <Leader>wp6 <Plug>VimwikiListPrevSymbol
" imap <Leader>wp7 <Plug>VimwikiListToggle

"============ instant-markdown-preview
"if has( 'win32' )
	let g:instant_markdown_slow = 1 " recommended, esp for Windows
"endif
let g:instant_markdown_autostart = 0  "don't autostart...
nmap <Leader>m :InstantMarkdownPreview
"================= settings that must override all ========================

" Highlight matching braces { }, [ ], ( ), etc
"Disable matchparen because it was slowing down Win Vim! Slowed down during match!
" In the future, try enabling it again
let loaded_matchparen = 1
" set color for matching braces, etc.  Disabled since above is also disabled
"hi MatchParen ctermbg=yellow ctermfg=blue guifg=blue guibg=yellow

" comments in italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic 

" conceals, hides markdown punctuations, etc
set conceallevel=2

"============= abbreviations ===========================================
iab => ⇒ 
iab ==> ⟹
iab -> → 
iab <= ⇐ 
iab <- ← 
iab euro €

"================== Must be last line and in quote and modelines=1 ======================
" currently disabled, since I didn't want to use modelines
" vim:foldmethod=marker:foldlevel=0
