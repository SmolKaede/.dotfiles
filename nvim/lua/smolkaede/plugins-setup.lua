--Auto install packer if not found
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- True if packer was just installed

--Automatically reload nvim and install/update/remove plugins
--When file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  --Packer
  use("wbthomason/packer.nvim")
  --Additional LUA functions
  use("nvim-lua/plenary.nvim")
  --Rose Pine color theme
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require("rose-pine").setup()
      vim.cmd('colorscheme rose-pine')
    end
  })
  --tmux & split window nav
  use("christoomey/vim-tmux-navigator")
  --Maximize and restore current window
  use("szw/vim-maximizer")
  --Surround with character
  use("tpope/vim-surround")
  --Comment with gc
  use("numToStr/Comment.nvim")
  --File explorer
  use("nvim-tree/nvim-tree.lua")
  --Icons
  use("kyazdani42/nvim-web-devicons")
  --Statusline
  use("nvim-lualine/lualine.nvim")
  --Fuzzy Finder
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make"}) --Dependancy
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x"})
  --Auto closing
  use("windwp/nvim-autopairs")
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
  --Git signs plugins
  use("lewis6991/gitsigns.nvim")
  --nvim-treesitter
  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

    -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
