return {
  'nvim-lua/plenary.nvim',
  'tpope/vim-surround',
  'tpope/vim-repeat',
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
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        background = {
          light = "latte",
          dark = "frappe",
        },
      })
      vim.cmd.colorscheme "catppuccin"
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
  'SmiteshP/nvim-navic',
  'towolf/vim-helm',
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory with Oil" },
    }
  },
}
