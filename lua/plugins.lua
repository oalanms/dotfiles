vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	-- PACKER.NVIM
	use 'wbthomason/packer.nvim'

	-- GIT
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'

	-- TOOLS
	use 'mbbill/undotree'
	use 'tpope/vim-eunuch'
	use 'vim-scripts/DoxygenToolkit.vim'
	use 'scrooloose/nerdtree'
	use 'tpope/vim-vinegar'
	use 'jremmen/vim-ripgrep'
	use 'luochen1990/rainbow'
	use 'sbdchd/neoformat'
	use 'farmergreg/vim-lastplace'
	use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
	}
	use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

	-- C++
	use 'octol/vim-cpp-enhanced-highlight'

	-- AUTO-COMPLETE
	use {'neoclide/coc.nvim', run = 'yarn install'}
	
	-- EDIT
	use 'tommcdo/vim-exchange'
	use 'tpope/vim-surround'
	use 'SirVer/ultisnips'

	-- COLORSCHEMES
	use 'tomasiser/vim-code-dark'
end
)

vim.keymap.set('n', '<bslash><bslash>', ':NERDTreeToggle<CR>')

