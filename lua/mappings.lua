vim.keymap.set('n', '<leader><leader>', ':Neoformat<CR>', no_remap_silent)
vim.keymap.set('v', '<leader><leader>', ':Neoformat<CR>', no_remap_silent)

vim.keymap.set('n', '<leader>s', ':mks! .session.vim<CR>', no_remap_silent)
vim.keymap.set('n', '<leader>S', ':so .session.vim<CR>', no_remap_silent)

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"cpp", "h"}, 
	callback = function()
	vim.keymap.set('n', '<leader>c', ':e %<.cpp<CR>', no_remap_silent)
	vim.keymap.set('n', '<leader>C', ':vnew %<.cpp<CR>', no_remap_silent)
	vim.keymap.set('n', '<leader>h', ':e %<.h<CR>', no_remap_silent)
	vim.keymap.set('n', '<leader>H', ':vnew %<.h<CR>', no_remap_silent)
	vim.keymap.set('n', '<leader>b', ':vnew %:p:h/CMakeLists.txt<CR>', no_remap_silent)
	end
	})

vim.keymap.set('n', '<F12>', ':tabnew ~/.config/nvim/lua/init.lua<CR>')
vim.keymap.set('n', '<F10>', ':so ~/.config/nvim/lua/init.lua<CR>')
