vim.keymap.set("n", "<leader>gg", "<cmd>vertical Git<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>vertical Gclog<cr>")
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiff<cr>")
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>")
vim.keymap.set("n", "<leader>gp", function() require("toggleterm").exec("git push", 1, 12) end)
