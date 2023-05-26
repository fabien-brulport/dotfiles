return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require "telescope.builtin"

    telescope.setup {
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }
    require('telescope').load_extension('fzf')

    vim.keymap.set("n", "<C-P>", builtin.git_files)
    vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ hidden = true, no_ignore = true }) end)
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
    vim.keymap.set("n", "<leader>fw", builtin.grep_string)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    vim.keymap.set("n", "<leader><leader>", builtin.buffers)
    vim.keymap.set("n", "<leader>f<esc>", builtin.resume)
    vim.keymap.set("n", "<leader>fb", builtin.git_branches)
    vim.keymap.set("n", "<leader>fs", builtin.git_status)
    vim.keymap.set("n", "<leader>fc", builtin.command_history)
    vim.keymap.set("n", "<leader>fd", builtin.git_bcommits)
    vim.keymap.set("n", "gr", builtin.lsp_references)
    vim.keymap.set("n", "gd", builtin.lsp_definitions)
  end
}
