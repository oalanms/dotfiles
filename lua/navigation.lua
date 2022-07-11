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
                               
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', function()
		telescope.find_files({hidden=false})
end, no_remap_silent)

vim.keymap.set('n', '<leader>F', function()
		telescope.find_files({hidden=true})
end, no_remap_silent)

vim.keymap.set('n', '<leader>g', ':Telescope live_grep<CR>', no_remap_silent)
vim.keymap.set('n', '<leader>gr', ':Telescope lsp_references<CR>', no_remap_silent)
vim.keymap.set('n', '<leader>gc', ':Telescope commands<CR>', no_remap_silent)
vim.keymap.set('n', '<leader>gd', ':Telescope lsp_definitions<CR>', no_remap_silent)
vim.keymap.set('n', '<leader>gt', ':Telescope lsp_type_definitions<CR>', no_remap_silent)
