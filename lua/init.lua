-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'

vim.o.undodir="~/.config/nvim/undo"
vim.o.undofile = true
vim.g.mapleader = ','
vim.o.syntax = true

vim.o.wildignore = '**/cmake.bld/**,compile_commands.json'

vim.o.exrc = true
vim.o.hidden = true
vim.o.errorbells = false
vim.o.wrap = false
vim.o.swapfile = false
vim.o.hlsearch = false
vim.o.scrolloff = 8
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.colorcolumn = 80
vim.o.signcolumn = 'yes'
vim.o.cmdheight = 2
vim.o.shortmess = 'c'

require('plugins')
require('navigation')
require('style')
require('lsp')

vim.keymap.set('n', '<F12>', ':tabnew ~/.config/nvim/lua/init.lua<CR>')
