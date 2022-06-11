vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.colorcolumn = 80
vim.o.mouse = true

vim.cmd('colorscheme codedark')

vim.cmd([[
highlight WinSeparator guibg=None
]])

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"py", "dart", "lua", "go"}, 
	callback = function()
	vim.o.shiftwidth = 2
	vim.o.tabstop = 2
	end
	})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"cpp", "c", "h", "hpp"}, 
	callback = function()
	vim.o.shiftwidth = 4
	vim.o.tabstop = 4
	end
	})

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "lua", "go", "dart" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd([[
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'highlight': 'Comment' } }
]])

