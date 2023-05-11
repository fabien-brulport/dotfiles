require'mind'.setup({
  ui = {
    width = 40,
  },
  -- TODO: this does not work
  keybindings = {
    n = {
      {
        key = '<leader>mm',
        cmd = 'MindOpenMain',
      },
      {
        key = '<leader>mp',
        cmd = 'MindOpenSmartProject',
      },
    },
  },
})

-- Mapping for mind
vim.keymap.set("n", "<leader>mm", ":MindOpenMain<CR>")
vim.keymap.set("n", "<leader>mp", ":MindOpenProject<CR>")
