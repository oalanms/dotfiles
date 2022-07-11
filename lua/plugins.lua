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
  use 'thosakwe/vim-flutter'
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
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	
	-- EDIT
	use 'tommcdo/vim-exchange'
	use 'tpope/vim-surround'
	--use 'dcampos/nvim-snippy'
  use 'L3MON4D3/LuaSnip'

	-- COLORSCHEMES
	use 'tomasiser/vim-code-dark'
	use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
end
)

vim.keymap.set('n', '<bslash><bslash>', ':NERDTreeToggle<CR>')
require('lualine').setup ({
	options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filesize', 'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})

-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- require('snippy').setup({
--     mappings = {
--         is = {
--             ['<leader><Tab>'] = 'expand_or_advance',
--         },
--         nx = {
--             ['<leader>x'] = 'cut_text',
--         },
--     },
-- })
