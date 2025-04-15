-- Disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- Normal --
--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Always center the search result
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set(
  'c', '<CR>',
  function() return vim.fn.getcmdtype() == '/' and '<CR>zz' or '<CR>' end,
  { expr = true }
)

-- Use leader key + esc to clear the highlight
vim.keymap.set("n", "<leader><esc>", ":noh<return><esc>")

-- Reload init.lua
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")

-- Edit init.lua
vim.keymap.set("n", "<leader>ev", ":edit $MYVIMRC<CR>")

-- Mapping for quickfix list
vim.keymap.set("n", "<leader>cn", ":cnext<CR>")
vim.keymap.set("n", "<leader>cp", ":cprevious<CR>")
vim.keymap.set("n", "<leader>cc", ":cclose<CR>")

-- Window mangement
vim.keymap.set("n", "<C-H>", "<C-W>h")
vim.keymap.set("n", "<C-J>", "<C-W>j")
vim.keymap.set("n", "<C-K>", "<C-W>k")
vim.keymap.set("n", "<C-L>", "<C-W>l")

-- Formatting
vim.keymap.set("n", "<leader>b", vim.lsp.buf.format)

-- Diagnostic
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dp', function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.jump({ count = 1, float = true }) end)
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist)
vim.diagnostic.config({
  virtual_text = { current_line = true },
  -- Note: the 2 following lines are not working
  float = false,
  jump = { float = false },
})

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Use ctrl+C to copy visual selection into MAC OS clipboard
vim.keymap.set("v", "<C-c>", ":w !pbcopy<CR><CR>")

-- Terminal --
-- Use Esc to go in normal mode in terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
