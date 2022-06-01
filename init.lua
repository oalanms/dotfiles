vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-eunuch'
	use 'mbbill/undotree'
	use 'octol/vim-cpp-enhanced-highlight'
	use {'neoclide/coc.nvim', run = 'yarn install'}
	use 'vim-scripts/DoxygenToolkit.vim'
	use 'scrooloose/nerdtree'
	use 'tpope/vim-vinegar'
	use 'jremmen/vim-ripgrep'

	use 'tommcdo/vim-exchange'
	use 'tpope/vim-surround'
	use 'SirVer/ultisnips'
	use 'luochen1990/rainbow'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
	}

	-- COLORSCHEMES
	use 'tomasiser/vim-code-dark'
end
)

-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.mouse = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.undodir="~/.confir/nvim/undo"
vim.o.undofile = true

vim.cmd('colorscheme codedark')

vim.keymap.set('n', '<C-M-h>', '3<C-w><')
vim.keymap.set('n', '<C-M-l>', '3<C-w>>')
vim.keymap.set('n', '<C-M-k>', '1<C-w>-')
vim.keymap.set('n', '<C-M-j>', '1<C-w>+')

vim.g.mapleader = ','

vim.keymap.set('n', '<leader>t', ':tabnew<CR>')
vim.keymap.set('n', '<leader>n', ':new<CR>')
vim.keymap.set('n', '<leader>v', ':vnew<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>Q', ':q!<CR>')
                               
vim.keymap.set('n', '<leader>f', ':FZF<CR>')
vim.keymap.set('n', '<leader>F', ':e **/*')
                               
vim.keymap.set('n', '<leader>g', 'y:Rg -j1 --glob "!{**/cmake.bld/**,compile_commands.json}" <C-r>"<CR>')
vim.keymap.set('n', '<leader>G', 'y:Rg -j1 --glob "!{**/cmake.bld/**,compile_commands.json}" ""<Left>')

-- autocmd FileType cpp,h noremap <leader>c :e %<.cpp<CR>
-- autocmd FileType cpp,h noremap <leader>C :vnew %<.cpp<CR>
-- autocmd FileType cpp,h noremap <leader>h :e %<.h<CR>
-- autocmd FileType cpp,h noremap <leader>H :vnew %<.h<CR>
-- 
-- noremap <leader>b :vnew %:p:h/CMakeLists.txt<CR>

vim.o.wildignore = '**/cmake.bld/**,compile_commands.json'
vim.o.incsearch = true
vim.o.ignorecase = true
vim.keymap.set('n', '<leader>m', ':noh<CR>')

vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
vim.keymap.set('n', 'gD', '<Plug>(coc-declaration)')
vim.keymap.set('n', 'gt', '<Plug>(coc-type-definition)')
vim.keymap.set('n', 'gr', '<Plug>(coc-references)')
vim.keymap.set('n', 'gR', '<Plug>(coc-rename)')
vim.keymap.set('n', 'gn', '<Plug>(coc-diagnostic-next)')
vim.keymap.set('n', 'gp', '<Plug>(coc-diagnostic-prev)')
vim.keymap.set('n', 'gb', ':bp<CR>')
vim.keymap.set('n', 'gA', ':CocAction<CR>')

vim.keymap.set('n', '<leader>M', '<C-w>_<C-w><Bar> ')
vim.keymap.set('n', '<leader>m', '<C-w>=')

vim.o.syntax = true

vim.keymap.set('n', '<bslash><bslash>', ':NERDTreeToggle<CR>')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

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
	pattern = {"py", "dart", "lua", "go"}, 
	callback = function()
	vim.o.shiftwidth = 2
	vim.o.tabstop = 2
	end
	})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"cpp", "c", "h", "hpp"}, 
	callback = function()
	vim.o.shiftwidth = 2
	    vim.o.tabstop = 2
	end
	})

-- vim.keymap.set('n', '<leader><leader>', ':CocCommand prettier.formatFile')
--
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
