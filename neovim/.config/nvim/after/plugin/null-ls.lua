require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.black,
  },
})

vim.keymap.set("n", "<leader>b", vim.lsp.buf.formatting)
