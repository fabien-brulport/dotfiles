vim.pack.add({ { src = "https://github.com/phaazon/mind.nvim", version = "v2.2" } })
require("mind").setup { ui = { width = 40 } }
vim.keymap.set("n", "<leader>mm", "<cmd>MindOpenMain<cr>", { desc = "Open mind main project." })
