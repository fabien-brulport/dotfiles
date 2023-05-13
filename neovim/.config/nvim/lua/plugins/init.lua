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
  'nvim-telescope/telescope.nvim',
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-textobjects',
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
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
  'f-person/auto-dark-mode.nvim',
  'ellisonleao/gruvbox.nvim',
  'kyazdani42/nvim-web-devicons',
  'vimpostor/vim-tpipeline',
  'akinsho/toggleterm.nvim',
  'stevearc/dressing.nvim',
  'MunifTanjim/nui.nvim',
}
