".gvimrc: macVim and gvim (GUI) setting

" colorscheme needs to come before all formating, to override defaults
" colorscheme moved to .vimrc
" set bg=evening
" set bg=darkblue

" fonts
" set guifont=NanumGothicCoding:h16
" set guifont=Fantasque\ Sans\ Mono:h12
if has("gui_macvim")
	set guifont=Fantasque\ Sans\ Mono:h16
	" set guifont=Menlo:h16
	" set guifont=D2Coding:h16
	" set guifont=Code\ New\ Roman:h16
	" set guifont=Input\ Mono:h16
	" set guifont=Liberation\ Mono:h16
	" set guifont=Monoid\ Tight:h16
	" set guifont=DejaVu\ Sans\ Mono:h16
	" set guifont=mononoki:h16
	" set guifont=source\ code\ pro:h16
	" set guifont=Ubuntu\ Mono:h18
	" set guifont=Bitstream\ Vera\ Sans\ Mono:h16
	" set guifont=Cascadia\ Code:h16
elseif has("gui_win32")
	"set guifont=Consolas:h12:cANSI
	" set guifont=Consolas:h12
	" set guifont=Lucida\ Console:h12
	" set guifont=Lucida\ Sans\ Typewriter:h12
	" (DejaVu Sans: supports unicode symbols)
	" set guifont=DejaVu\ Sans\ Mono:h11
	" set guifont=Inconsolata:h12
	" set guifont=Cascadia\ Code:h12
	" set guifont=IosevkaCC:h12
	" set guifont=Iosevka:h12
	" set guifont=sudo:h14
	" set guifont=JetBrains\ Mono:h12
	set guifont=Fantasque\ Sans\ Mono:h12
elseif has("gui_gtk2")
    set guifont=Inconsolata\ 12
elseif has("gui_gtk3")
    set guifont=Inconsolata\ 12
endif

" highlight Comment cterm=italic term=italic gui=italic 
"highlight Comment cterm=italic term=italic gui=italic font='Courier New:h11'
"highlight Comment cterm=italic term=italic gui=italic font='Liberation Mono Italic:h11'
"highlight Comment cterm=italic term=italic gui=italic font='DejaVu Sans Mono:h12'
	"set guifont=Inconsolata:h12
"ighlight Comment cterm=italic term
" v0.2.2 gets stuck if Guifont is in here, but works after nvim loads
if has('nvim')
	"Guifont Fantasque\ Sans\ Mono:h12
endif

" Disable all cursor blinking:
:set guicursor+=a:blinkon0
