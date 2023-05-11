require("toggleterm").setup{
  open_mapping = [[<C-T>]],
  direction = "float",
  insert_mappings = true,
  terminal_mappings = true,
  -- shade_terminals = false,
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
}
