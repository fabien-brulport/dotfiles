return {
  'tpope/vim-fugitive',
  lazy=false,
  keys = {
    { "<leader>gg", "<cmd>vertical Git<cr>", desc = "Show git status" },
    { "<leader>gl", "<cmd>vertical Gclog<cr>", desc = "Show git log for the current file" },
    { "<leader>gd", "<cmd>Gvdiff<cr>", desc = "Show vertical git diff" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Commit" },
  },
}
