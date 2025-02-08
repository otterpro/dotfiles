-- load legacy vim

-- local vimrc = vim.fn.stdpath("config") .. "/load_vim_config.vim"
local vimrc = vim.fn.stdpath("config") .. "/legacy-vimrc.vim"
vim.cmd.source(vimrc)
