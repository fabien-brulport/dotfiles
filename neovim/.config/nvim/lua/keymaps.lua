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
vim.keymap.set({ "n", "t" }, "<C-H>", "<C-W>h")
vim.keymap.set({ "n", "t" }, "<C-J>", "<C-W>j")
vim.keymap.set({ "n", "t" }, "<C-K>", "<C-W>k")
vim.keymap.set({ "n", "t" }, "<C-L>", "<C-W>l")

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

-- Git push in a new buffer and window, close on success
vim.keymap.set("n", "<leader>gp", function()
  -- Create a new buffer and window
  local term_buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_open_win(term_buf, false, { split = "below", height = 15, width = vim.o.columns })
  vim.api.nvim_buf_set_lines(term_buf, -1, -1, false, {"Running git push..."})
  vim.fn.jobstart("git push", {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data, _)
      if data then
        vim.api.nvim_buf_set_lines(term_buf, -1, -1, false, data)
      end
    end,
    on_stderr = function(_, data, _)
      if data then
        vim.api.nvim_buf_set_lines(term_buf, -1, -1, false, data)
      end
    end,
    on_exit = function(_, exit_code, _)
      if exit_code == 0 then
        -- Wait for 500ms and close the terminal buffer if git push succeeded
        vim.defer_fn(function()
          if vim.api.nvim_buf_is_valid(term_buf) then
            vim.api.nvim_buf_delete(term_buf, { force = true })
          end
        end, 500)
      end
    end,
  })
end, { desc = "Run git push in a background job an show the result in a new buffer, close on success" })
