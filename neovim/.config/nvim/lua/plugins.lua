local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Packer handles itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'christoomey/vim-sort-motion'
  use 'christoomey/vim-system-copy'
  -- Plug 'inkarkat/vim-ReplaceWithRegister'
  -- Markdown preview: install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'f-person/auto-dark-mode.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'vimpostor/vim-tpipeline'
  use 'akinsho/toggleterm.nvim'
  use {
    'phaazon/mind.nvim',
    branch='v2.2',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use 'stevearc/dressing.nvim'
  use 'MunifTanjim/nui.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
