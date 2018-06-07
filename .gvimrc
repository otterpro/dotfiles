".gvimrc: macVim and gvim (GUI) setting

" colorscheme needs to come before all formating, to override defaults
" colorscheme moved to .vimrc
" set bg=evening
" set bg=darkblue

" fonts
" set guifont=NanumGothicCoding:h16
" set guifont=Ubuntu\ Mono:h16
"  was 12, but changed to 10 on Windows, it was too big
set guifont=Fantasque\ Sans\ Mono:h10
if has("gui_macvim")
	set guifont=Fantasque\ Sans\ Mono:h18
endif

" v0.2.2 gets stuck if Guifont is in here, but works after nvim loads
if has('nvim')
	"Guifont Fantasque\ Sans\ Mono:h12
endif

" Disable all cursor blinking:
:set guicursor+=a:blinkon0
