vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>gg", "<cmd>vertical Git<cr>", { desc = "Show git status" })
vim.keymap.set("n", "<leader>gl", "<cmd>vertical Gclog<cr>", { desc = "Show git log for the current file" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiff<cr>", { desc = "Show vertical git diff" })
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Commit" })
