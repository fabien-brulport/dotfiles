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

-- Window mangement with <C-z>
vim.keymap.set("n", "<C-Z>", "<Nop>")
vim.keymap.set("n", "<C-Z>", "<C-W>")

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Use ctrl+C to copy visual selection into MAC OS clipboard
vim.keymap.set("v", "<C-c>", ":w !pbcopy<CR><CR>")

-- Terminal -- 
-- Use Esc to go in normal mode in terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
