local o = vim.opt

o.spell = true
o.showcmd = true                                    -- Show the command in the last line of the screen
o.backspace = { 'indent', 'eol', 'start' }          -- Normal behavior for backspace
o.swapfile = false                                  -- Do not create swap files
o.hlsearch = true                                   -- highlight the result
o.showtabline = 0                                   -- Never show the tabline
o.number = true                                     -- Show line number
o.relativenumber = true                             -- Turn on hybrid line numbers
o.smartindent = true                                -- Smart indentation (with comments # etc)
o.autoindent = true                                 -- Continue the same indentation over new line
o.wildmenu = true                                   -- Use Tab to show the possible matches in the command line (and switches between the matches)
o.tabstop = 4                                       -- Make tabs equals to 4 columns
o.softtabstop = 4                                   -- Make tabs equals to 4 columns
o.shiftwidth = 4                                    -- Make a indentation equals to 4 columns
o.shiftround = true                                 -- Indentation to the closest tab
o.expandtab = true                                  -- Convert tab to spaces
o.updatetime = 250                                  -- Faster completion
o.signcolumn = "yes"                                -- Always keep a signcolumn even if there is nothing to show
o.statuscolumn = '%s%=%{v:relnum?v:relnum:v:lnum} ' -- Custom statuscolumn
o.completeopt = { 'menu', 'menuone', 'noselect' }   -- Pop up a menu in the command line
o.laststatus = 0                                    -- Statusline in tmux
o.mouse = ""

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    o.tabstop = 2
    o.softtabstop = 2
    o.shiftwidth = 2
  end
})
