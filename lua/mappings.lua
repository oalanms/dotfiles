local silent = { silent=true }
vim.keymap.set('n', 'zs', ':mks! .session.vim<CR>', silent)
vim.keymap.set('n', 'zS', ':so .session.vim<CR>', silent)

vim.keymap.set('n', '<leader><leader>', ':Neoformat<CR>', silent)
vim.keymap.set('v', '<leader><leader>', ':Neoformat<CR>', silent)

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"cpp", "h"}, 
	callback = function()
	vim.keymap.set('n', '<leader>c', ':e %<.cpp<CR>', silent)
	vim.keymap.set('n', '<leader>C', ':vnew %<.cpp<CR>', silent)
	vim.keymap.set('n', '<leader>h', ':e %<.h<CR>', silent)
	vim.keymap.set('n', '<leader>H', ':vnew %<.h<CR>', silent)
	vim.keymap.set('n', '<leader>b', ':vnew %:p:h/CMakeLists.txt<CR>', silent)
	end
	})

vim.keymap.set('n', '<F12>', ':tabnew ~/.config/nvim/lua/init.lua<CR>')
vim.keymap.set('n', '<F10>', ':so ~/.config/nvim/lua/init.lua<CR>')

vim.o.splitright = true
vim.o.splitbelow = true

vim.keymap.set('n', '<C-h>', '<C-w>h', silent)
vim.keymap.set('n', '<C-j>', '<C-w>j', silent)
vim.keymap.set('n', '<C-k>', '<C-w>k', silent)
vim.keymap.set('n', '<C-l>', '<C-w>l', silent)

vim.keymap.set('n', '<C-M-h>', '3<C-w><', silent)
vim.keymap.set('n', '<C-M-l>', '3<C-w>>', silent)
vim.keymap.set('n', '<C-M-k>', '1<C-w>-', silent)
vim.keymap.set('n', '<C-M-j>', '1<C-w>+', silent)

vim.keymap.set('n', '<leader>M', '<C-w>_<C-w><Bar> ', silent)
vim.keymap.set('n', '<leader>m', '<C-w>=', silent)

vim.keymap.set('n', '<leader>t', ':tabnew<CR>', silent)
vim.keymap.set('n', '<leader>n', ':new<CR>', silent)
vim.keymap.set('n', '<leader>v', ':vnew<CR>', silent)
vim.keymap.set('n', '<leader>q', ':q<CR>', silent)
vim.keymap.set('n', '<leader>Q', ':q!<CR>', silent)

vim.keymap.set('n', '<leader>1', '1gt', silent)
vim.keymap.set('n', '<leader>2', '2gt', silent)
vim.keymap.set('n', '<leader>3', '3gt', silent)
vim.keymap.set('n', '<leader>4', '4gt', silent)
vim.keymap.set('n', '<leader>5', '5gt', silent)
vim.keymap.set('n', '<leader>6', '6gt', silent)
vim.keymap.set('n', '<leader>7', '7gt', silent)
vim.keymap.set('n', '<leader>8', '8gt', silent)
vim.keymap.set('n', '<leader>9', '9gt', silent)

vim.keymap.set('n', 'gh', ':GitGutterNextHunk<CR>', silent)
vim.keymap.set('n', 'gH', ':GitGutterPrevHunk<CR>', silent)
                               
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', function()
		telescope.find_files({hidden=false})
end, silent)

vim.keymap.set('n', '<leader>F', function()
		telescope.find_files({hidden=true})
end, silent)

vim.keymap.set('n', '<leader>g', ':Telescope live_grep<CR>', silent)

vim.keymap.set('n', '<localleader>r', ':Telescope lsp_references<CR>', silent)
vim.keymap.set('n', '<localleader>c', ':Telescope commands<CR>', silent)
vim.keymap.set('n', '<localleader>d', ':Telescope lsp_definitions<CR>', silent)
vim.keymap.set('n', '<localleader>t', ':Telescope lsp_type_definitions<CR>', silent)
