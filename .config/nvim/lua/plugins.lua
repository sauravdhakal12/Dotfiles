local packer = require("packer")

-- Have packer use a popup window
packer.init {
 display = {
   open_fn = function()
     return require("packer.util").float { border = "rounded" }
   end
 }
}

-- Plugins
return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


 -- LspConf
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocomplition plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin


   -- Color Scheme
  use 'navarasu/onedark.nvim'



  -- Status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use 'psliwka/vim-smoothie'  -- Smooth Scrolling

  -- Treesitter (better syntax highlighting)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Telescope (Fuzzy Finder)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  -- Autopair
  use {
    'windwp/nvim-autopairs',
  }

  -- Git interactive
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  -- Auto install packages
  if packer_bootstrap then
    require('packer').sync()
  end
end)
