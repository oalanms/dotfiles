local telescope = require('telescope.builtin')
local no_remap_silent = { noremap=true, silent=true }

function set_map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, no_remap_silent)
end

function nmap(lhs, rhs)
  set_map('n', lhs, rhs)
end

function vmap(lhs, rhs)
  set_map('v', lhs, rhs)
end

nmap('<leader><leader>', ':Neoformat<CR>')
vmap('<leader><leader>', ':Neoformat<CR>')

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"cpp", "h"}, 
	callback = function()
	nmap('<leader>c', ':e %<.cpp<CR>')
	nmap('<leader>C', ':vnew %<.cpp<CR>')
	nmap('<leader>h', ':e %<.h<CR>')
	nmap('<leader>H', ':vnew %<.h<CR>')
	nmap('<leader>b', ':vnew %:p:h/CMakeLists.txt<CR>')
	end
	})

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
                               
nmap('<leader>f', function() telescope.find_files({hidden=false}) end)
nmap('<leader>F', function() telescope.find_files({hidden=true}) end)

nmap('<leader>g', ':Telescope live_grep<CR>')

nmap('<localleader>r', ':Telescope lsp_references<CR>')
nmap('<localleader>c', ':Telescope commands<CR>')
nmap('<localleader>d', ':Telescope lsp_definitions<CR>')
nmap('<localleader>t', ':Telescope lsp_type_definitions<CR>')
nmap('<localleader>/', ':noh<CR>')

nmap('zs', ':mks! .session.vim<CR>')
nmap('zS', ':so .session.vim<CR>')
