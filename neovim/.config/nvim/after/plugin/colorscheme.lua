vim.opt.termguicolors = true
vim.cmd("colorscheme gruvbox")
-- To set the background transparent
vim.api.nvim_set_hl(0, "Normal", {guibg = NONE, ctermbg = NONE})
