-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'

vim.o.undodir=os.getenv("HOME").."/.config/nvim/undo"
vim.o.undofile = true
vim.g.mapleader = ','
vim.o.syntax = true

vim.o.wildignore = '**/cmake.bld/**,compile_commands.json'

vim.o.exrc = true
vim.o.hidden = true
vim.o.errorbells = false
vim.o.wrap = false
vim.o.swapfile = false
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.colorcolumn = 80
vim.o.signcolumn = 'yes'
vim.o.cmdheight = 1
vim.o.shortmess = 'c'
vim.o.mouse = 'a'
-- vim.o.laststatus = 3

-- vim.cmd([[
-- set guifont=Essential\ PragmataPro:h14
-- ]])

require('plugins')
require('shortcuts')
require('navigation')
require('style')
require('lsp')

