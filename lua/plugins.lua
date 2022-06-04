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

	use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

	use 'sbdchd/neoformat'

	-- COLORSCHEMES
	use 'tomasiser/vim-code-dark'
end
)

vim.keymap.set('n', '<bslash><bslash>', ':NERDTreeToggle<CR>')

