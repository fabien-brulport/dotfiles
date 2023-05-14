return {
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
  {
    'vimpostor/vim-tpipeline',
    init = function()
      vim.g.tpipeline_autoembed = 0
      vim.g.tpipeline_preservebg = 1
    end
  },
  'akinsho/toggleterm.nvim',
  'stevearc/dressing.nvim',
  'MunifTanjim/nui.nvim',
}
