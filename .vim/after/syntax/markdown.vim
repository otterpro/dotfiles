"Daniel Kim /otter.pro
" TODO: make into proper plugin

" HIDE backtick
"notes: derived and modified mkdCode from vim-markdown/syntax/markdown.vim
syn region mkdCode matchGroup=SingleBacktickCode start=/\(\([^\\]\|^\)\\\)\@<!`/ end=/\(\([^\\]\|^\)\\\)\@<!`/ concealends

" hide wikilink [[ ... ]] brackets
syn region mkdLink matchgroup=wikiLink start=/\v\[\[/ end=/\v\]\]/ concealends oneline
