"Daniel Kim /otter.pro
"notes: derived and modified mkdCode from vim-markdown/syntax/markdown.vim
" TODO: make into proper plugin

syn region mkdCode matchGroup=SingleBacktickCode start=/\(\([^\\]\|^\)\\\)\@<!`/ end=/\(\([^\\]\|^\)\\\)\@<!`/ concealends
