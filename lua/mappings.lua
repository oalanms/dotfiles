local utils = require('utils')

local nmap = utils.nmap
local vmap = utils.vmap

nmap('<leader><leader>', ':Neoformat<CR>')
vmap('<leader><leader>', ':Neoformat<CR>')

nmap('<F12>', ':tabnew ~/.config/nvim/lua/init.lua<CR>')
nmap('<F10>', ':so ~/.config/nvim/lua/init.lua<CR>')

nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

nmap('<C-M-h>', '3<C-w><')
nmap('<C-M-l>', '3<C-w>>')
nmap('<C-M-k>', '1<C-w>-')
nmap('<C-M-j>', '1<C-w>+')

nmap('<leader>M', '<C-w>_<C-w><Bar> ')
nmap('<leader>m', '<C-w>=')

nmap('<leader>t', ':tabnew<CR>')
nmap('<leader>n', ':new<CR>')
nmap('<leader>v', ':vnew<CR>')
nmap('<leader>q', ':q<CR>')
nmap('<leader>Q', ':q!<CR>')

nmap('<leader>1', '1gt')
nmap('<leader>2', '2gt')
nmap('<leader>3', '3gt')
nmap('<leader>4', '4gt')
nmap('<leader>5', '5gt')
nmap('<leader>6', '6gt')
nmap('<leader>7', '7gt')
nmap('<leader>8', '8gt')
nmap('<leader>9', '9gt')

nmap('gh', ':GitGutterNextHunk<CR>')
nmap('gH', ':GitGutterPrevHunk<CR>')

local telescope = require('telescope.builtin')

nmap('<leader>f', function() telescope.find_files({hidden=false}) end)
nmap('<leader>F', function() telescope.find_files({hidden=true}) end)

nmap('<leader>g', telescope.live_grep)
nmap('<localleader>r', telescope.lsp_references)
nmap('<localleader>c', telescope.commands)
nmap('<localleader>d', telescope.lsp_definitions)
nmap('<localleader>t', telescope.lsp_type_definitions)
nmap('<localleader>/', ':noh<CR>')
nmap('<localleader>u', ':UndotreeShow<CR>:UndotreeFocus<CR>')
nmap('<localleader>U', ':UndotreeHide<CR>')

-- Store / Restore a session.
nmap('zS', ':mks! .session.vim<CR>')
nmap('zs', ':so .session.vim<CR>')

nmap('<bslash><bslash>', ':NERDTreeToggle<CR>')
