vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/tpope/vim-surround',
  'https://github.com/tpope/vim-repeat',
  'https://github.com/f-person/auto-dark-mode.nvim',
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  'https://github.com/vim-tree/nvim-web-devicons',
  'https://github.com/impostor/vim-tpipeline',
  'https://github.com/tevearc/dressing.nvim',
  'https://github.com/unifTanjim/nui.nvim',
  'stevearc/oil.nvim',
  'stevearc/quicker.nvim',
})
-- Auto dark mode setup
require("auto-dark-mode").setup { update_interval = 1000 }
require("auto-dark-mode").init()
-- Catppuccin setup
require("catppuccin").setup({
  background = {
    light = "latte",
    dark = "frappe",
  },
  transparent_background = true,
})
vim.cmd.colorscheme "catppuccin"
-- Nvim web devicons setup
require('nvim-web-devicons').setup { default = true }
-- Tpipeline setup
vim.g.tpipeline_autoembed = 0
vim.g.tpipeline_preservebg = 1
-- Oil setup
require("oil").setup { skip_confirm_for_simple_edits = true }
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory with Oil" })
-- Quicker setup
vim.keymap.set("n", "<leader>q", function()
  require("quicker").toggle()
end, {
  desc = "Toggle quickfix",
})
require("quicker").setup({
  keys = {
    {
      ">",
      function()
        require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
      end,
      desc = "Expand quickfix context",
    },
    {
      "<",
      function()
        require("quicker").collapse()
      end,
      desc = "Collapse quickfix context",
    },
  },
})

-- return {
-- Markdown preview: install without yarn or npm
-- {
--   "iamcco/markdown-preview.nvim",
--   build = function() vim.fn["mkdp#util#install"]() end,
-- },
-- {
--   "iamcco/markdown-preview.nvim",
--   build = "cd app && npm install",
--   init = function() vim.g.mkdp_filetypes = { "markdown" } end,
--   ft = { "markdown" },
-- },
-- {
--   'MeanderingProgrammer/render-markdown.nvim',
--   opts = {},
--   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
-- },
-- }
