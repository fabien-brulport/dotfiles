return {
  'akinsho/toggleterm.nvim',
  opts = {
    open_mapping = [[<C-T>]],
    direction = "float",
    highlights = {
      -- highlights which map to a highlight group name and a table of it's values
      -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
      Normal = {
        link = 'WinBar'
      },
      NormalFloat = {
        link = 'WinBar'
      },
    },
  },
  keys = {
    { "<C-T>", "<cmd>ToggleTerm<cr>", desc = "Open a floating terminal" },
    { "<leader>r", "<cmd>w<cr><cmd>2TermExec cmd='rustc % -o /tmp/rust-toggleterm.out && /tmp/rust-toggleterm.out' direction=vertical size=100<cr>", desc = "Save current Rust buffer, compile it and run the bin." },
  },
}
