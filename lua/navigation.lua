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

vim.keymap.set('n', '<leader>1', '1gt')
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')
                               
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', function()
		telescope.find_files({hidden=false})
end)

vim.keymap.set('n', '<leader>F', function()
		telescope.find_files({hidden=true})
end)

vim.keymap.set('n', '<leader>C', ':Telescope commands<CR>')
vim.keymap.set('n', '<leader>C', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>r', ':Telescope lsp_references<CR>')
vim.keymap.set('n', '<leader>D', ':Telescope lsp_definitions<CR>')
vim.keymap.set('n', '<leader>T', ':Telescope lsp_type_definitions<CR>')
