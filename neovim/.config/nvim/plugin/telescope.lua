vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    end
  end
})
vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

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
