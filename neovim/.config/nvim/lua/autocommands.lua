-- Re-open file at the last position
vim.api.nvim_exec([[autocmd! BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]], false)
