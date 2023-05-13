return {
  'phaazon/mind.nvim',
  branch='v2.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    ui = {
      width = 40,
    },
  },
  keys = {
    { "<leader>mm", "<cmd>MindOpenMain<cr>", desc = "Open mind main project." },
    { "<leader>mp", "<cmd>MindOpenSmartProject<cr>", desc = "Open mind current project." },
  },
  lazy = true,
}
