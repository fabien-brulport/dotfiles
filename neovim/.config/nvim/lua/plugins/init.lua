return {
  'neovim/nvim-lspconfig',
  -- Completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',

  'nvim-lua/plenary.nvim',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-commentary',
  -- Markdown preview: install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  {
    'f-person/auto-dark-mode.nvim',
    config = function()
      require("auto-dark-mode").setup { update_interval = 1000 }
      require("auto-dark-mode").init()
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      require("gruvbox").setup {
        inverse = true, -- invert background for search, diffs, statuslines and errors
        invert_signs = false,
        transparent_mode = true,
      }
      vim.opt.termguicolors = true
      vim.cmd("colorscheme gruvbox")
    end
  },
  {
    'kyazdani42/nvim-web-devicons',
    opts = { default = true },
  },
  'vimpostor/vim-tpipeline',
  'akinsho/toggleterm.nvim',
  'stevearc/dressing.nvim',
  'MunifTanjim/nui.nvim',
}
