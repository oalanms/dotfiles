vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- PACKER.NVIM
  use 'wbthomason/packer.nvim'

  -- GIT
  use 'airblade/vim-gitgutter'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- TOOLS
  use 'mbbill/undotree'
  use 'tpope/vim-eunuch'
  use 'vim-scripts/DoxygenToolkit.vim'
  use 'tpope/vim-vinegar'
  use 'jremmen/vim-ripgrep'
  use 'sbdchd/neoformat'
  use 'farmergreg/vim-lastplace'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- FLUTTER
  use 'thosakwe/vim-flutter'

  -- NAVIGATION
  use 'scrooloose/nerdtree'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- AUTO-COMPLETE
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- EDIT
  use 'tommcdo/vim-exchange'
  use 'tpope/vim-surround'
  use 'L3MON4D3/LuaSnip'

  -- STYLE
  use 'kshenoy/vim-signature'
  use 'tomasiser/vim-code-dark'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end
)

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
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filesize', 'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {}
})
