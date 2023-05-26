return {
  'tpope/vim-fugitive',
  keys = {
    { "<leader>gg", "<cmd>vertical Git<cr>", desc = "Show git status" },
    { "<leader>gl", "<cmd>vertical Gclog<cr>", desc = "Show git log for the current file" },
    { "<leader>gd", "<cmd>Gvdiff<cr>", desc = "Show vertical git diff" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Commit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Push" },
  },
}
