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

  use 'nvim-lua/popup.nvim' -- Required for some other plugin
  use 'nvim-lua/plenary.nvim' -- Required for some other plugin

  -- Impatient to load fast
  use {
    'lewis6991/impatient.nvim',
    config = function()
      require("impatient").enable_profile()
    end
  }

  -- LspConf
  use {
    'neovim/nvim-lspconfig',
    event = "BufWinEnter",
    config = function()
      require("plugins.lspconfig_conf")
    end
  }

  -- Autocomplete plugin
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      use 'L3MON4D3/LuaSnip', -- Snippets plugin
      use {'hrsh7th/cmp-nvim-lsp', after="nvim-cmp"} ,-- LSP source for nvim-cmp
      use {'saadparwaiz1/cmp_luasnip', after="nvim-cmp"},-- Snippets source for nvim-cmp
    },
    event = "InsertEnter *",
    config = function()
      require("plugins.cmp_conf")
    end

  }

   -- Color Scheme
  use {
    'navarasu/onedark.nvim',
    config = function()
      require("themes.onedark_conf")
    end
  }

  -- Status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    event = "BufWinEnter",
    config = function()
      require('plugins.lualine_conf')
    end
  }

  use 'psliwka/vim-smoothie'  -- Smooth Scrolling

  -- Treesitter (better syntax highlighting)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = "BufWinEnter",
    config = function()
      require("plugins.treesitter_conf")
    end,
  }

  -- Telescope (Fuzzy Finder)
  use {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    config = function()
      require("plugins.telescope_conf")
    end,
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs_conf")
    end,
  }

  -- Git interactive
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    event = "BufWinEnter",
    config = function()
      require("plugins.gitsigns_conf")
    end
  }

 -- Fast comment
  use {
    "terrortylor/nvim-comment",
    config = function()
      require("plugins.comment_conf")
    end,
  }

  -- Show lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "InsertEnter",
    config = function()
      require("indent_blankline").setup {
      }
    end,
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require("plugins.toggleterm_conf")
    end
  }
 
  -- Auto install packages
  if packer_bootstrap then
    require('packer').sync()
  end
end)
