-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  inverse = true, -- invert background for search, diffs, statuslines and errors
  invert_signs = false,
  transparent_mode = true,
})
vim.opt.termguicolors = true
vim.cmd("colorscheme gruvbox")
-- To set the background transparent
-- vim.api.nvim_set_hl(0, "Normal", {guibg = NONE, ctermbg = NONE})
