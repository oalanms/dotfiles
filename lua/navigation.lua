vim.o.splitright = true
vim.o.splitbelow = true

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<C-M-h>', '3<C-w><')
vim.keymap.set('n', '<C-M-l>', '3<C-w>>')
vim.keymap.set('n', '<C-M-k>', '1<C-w>-')
vim.keymap.set('n', '<C-M-j>', '1<C-w>+')

vim.keymap.set('n', '<leader>M', '<C-w>_<C-w><Bar> ')
vim.keymap.set('n', '<leader>m', '<C-w>=')

vim.keymap.set('n', '<leader>t', ':tabnew<CR>')
vim.keymap.set('n', '<leader>n', ':new<CR>')
vim.keymap.set('n', '<leader>v', ':vnew<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>Q', ':q!<CR>')
                               
-- Call telescope find files
vim.keymap.set('n', '<leader>f', function()
		require('telescope.builtin').find_files()
end)

vim.keymap.set('n', '<leader>G', function()
		require('telescope.builtin').live_grep()
end)
                               
vim.keymap.set('n', '<leader>g', 'y:Rg -j1 --glob "!{**/cmake.bld/**,compile_commands.json}" <C-r>"<CR>')
-- vim.keymap.set('n', '<leader>G', 'y:Rg -j1 --glob "!{**/cmake.bld/**,compile_commands.json}" ""<Left>')

vim.o.incsearch = true
vim.o.ignorecase = true
vim.keymap.set('n', '<leader>m', ':noh<CR>')

vim.keymap.set('n', '<leader>1', '1gt')
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"cpp", "h"}, 
	callback = function()
	vim.keymap.set('n', '<leader>c', ':e %<.cpp<CR>')
	vim.keymap.set('n', '<leader>C', ':vnew %<.cpp<CR>')
	vim.keymap.set('n', '<leader>h', ':e %<.h<CR>')
	vim.keymap.set('n', '<leader>H', ':vnew %<.h<CR>')
	vim.keymap.set('n', '<leader>b', ':e %:p:h/CMakeLists.txt<CR>')
	end
	})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"go"}, 
	callback = function()
	vim.keymap.set('n', '<leader><leader>', ':Neoformat<CR>')
	end
	})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"dart"}, 
	callback = function()
	vim.keymap.set('n', '<F4>', ':CocCommand flutter.devices<CR>')
	vim.keymap.set('n', '<F5>', ':CocCommand flutter.hotReload<CR>')
	vim.keymap.set('n', '<F6>', ':CocCommand flutter.dev.openDevLog<CR>')
	vim.keymap.set('n', '<F7>', ':CocCommand flutter.run<CR>')
	vim.keymap.set('n', '<F8>', ':CocCommand flutter.dev.quit<CR>')
	end
	})
