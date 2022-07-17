vim.keymap.set('n', 'zs', ':mks! .session.vim<CR>', no_remap_silent)
vim.keymap.set('n', 'zS', ':so .session.vim<CR>', no_remap_silent)

local no_remap_silent = { noremap=true, silent=true }
vim.keymap.set('n', '<leader><leader>', ':Neoformat<CR>', no_remap_silent)
vim.keymap.set('v', '<leader><leader>', ':Neoformat<CR>', no_remap_silent)

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

vim.o.splitright = true
vim.o.splitbelow = true

vim.keymap.set('n', '<C-h>', '<C-w>h', no_remap_silent)
vim.keymap.set('n', '<C-j>', '<C-w>j', no_remap_silent)
vim.keymap.set('n', '<C-k>', '<C-w>k', no_remap_silent)
vim.keymap.set('n', '<C-l>', '<C-w>l', no_remap_silent)

vim.keymap.set('n', '<C-M-h>', '3<C-w><', no_remap_silent)
vim.keymap.set('n', '<C-M-l>', '3<C-w>>', no_remap_silent)
vim.keymap.set('n', '<C-M-k>', '1<C-w>-', no_remap_silent)
vim.keymap.set('n', '<C-M-j>', '1<C-w>+', no_remap_silent)

vim.keymap.set('n', '<leader>M', '<C-w>_<C-w><Bar> ', no_remap_silent)
vim.keymap.set('n', '<leader>m', '<C-w>=', no_remap_silent)

vim.keymap.set('n', '<leader>t', ':tabnew<CR>', no_remap_silent)
vim.keymap.set('n', '<leader>n', ':new<CR>', no_remap_silent)
vim.keymap.set('n', '<leader>v', ':vnew<CR>', no_remap_silent)
vim.keymap.set('n', '<leader>q', ':q<CR>', no_remap_silent)
vim.keymap.set('n', '<leader>Q', ':q!<CR>', no_remap_silent)

vim.keymap.set('n', '<leader>1', '1gt', no_remap_silent)
vim.keymap.set('n', '<leader>2', '2gt', no_remap_silent)
vim.keymap.set('n', '<leader>3', '3gt', no_remap_silent)
vim.keymap.set('n', '<leader>4', '4gt', no_remap_silent)
vim.keymap.set('n', '<leader>5', '5gt', no_remap_silent)
vim.keymap.set('n', '<leader>6', '6gt', no_remap_silent)
vim.keymap.set('n', '<leader>7', '7gt', no_remap_silent)
vim.keymap.set('n', '<leader>8', '8gt', no_remap_silent)
vim.keymap.set('n', '<leader>9', '9gt', no_remap_silent)

vim.keymap.set('n', 'gh', ':GitGutterNextHunk<CR>', no_remap_silent)
vim.keymap.set('n', 'gH', ':GitGutterPrevHunk<CR>', no_remap_silent)
                               
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', function()
		telescope.find_files({hidden=false})
end, no_remap_silent)

vim.keymap.set('n', '<leader>F', function()
		telescope.find_files({hidden=true})
end, no_remap_silent)

vim.keymap.set('n', '<leader>g', ':Telescope live_grep<CR>', no_remap_silent)

vim.keymap.set('n', '<localleader>r', ':Telescope lsp_references<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>c', ':Telescope commands<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>d', ':Telescope lsp_definitions<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>t', ':Telescope lsp_type_definitions<CR>', no_remap_silent)
