vim.keymap.set('n', '<leader><leader>', ':Neoformat<CR>')
vim.keymap.set('v', '<leader><leader>', ':Neoformat<CR>')

vim.keymap.set('n', '<leader>s', ':mks! .session.vim<CR>')
vim.keymap.set('n', '<leader>S', ':so .session.vim<CR>')

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
	pattern = {"dart"}, 
	callback = function()
	vim.keymap.set('n', '<F4>', ':CocCommand flutter.devices<CR>')
	vim.keymap.set('n', '<F5>', ':CocCommand flutter.dev.hotReload<CR>')
	vim.keymap.set('n', '<F6>', ':CocCommand flutter.dev.openDevLog<CR>')
	vim.keymap.set('n', '<F7>', ':CocCommand flutter.run<CR>')
	vim.keymap.set('n', '<F8>', ':CocCommand flutter.dev.quit<CR>')
	end
	})
