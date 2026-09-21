require "autocommands"
require "keymaps"
require "options"
require "variables"

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'markdown-preview' and (kind == 'install' or kind == 'update') then
      vim.fn["mkdp#util#install"]()
    end
  end
})
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/tpope/vim-surround',
  'https://github.com/tpope/vim-repeat',
  'https://github.com/f-person/auto-dark-mode.nvim',
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/vimpostor/vim-tpipeline',
  'https://github.com/stevearc/dressing.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/stevearc/quicker.nvim',
  'https://github.com/esmuellert/codediff.nvim',
  'https://github.com/iamcco/markdown-preview.nvim',
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

require "statusline"
require "winbar"
vim.lsp.enable({
  -- lua
  "lua_ls",
  -- python
  "ty",
  "ruff",
  -- rust
  "rust_analyzer",
  -- yaml
  "yamlls",
})
