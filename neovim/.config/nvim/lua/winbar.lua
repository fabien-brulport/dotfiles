M = {}

local isempty = function(s)
  return s == nil or s == ""
end

local is_current = function()
  local winid = vim.g.actual_curwin
  if isempty(winid) then
    return false
  else
    return winid == tostring(vim.api.nvim_get_current_win())
  end
end

local indicator = function()
  if is_current() then
    return '%#StatusLine#'
  else
    return '%#StatusLineNC#'
  end
end

local get_file_name = function()
  local filename, extension = vim.fn.expand("%:t"), vim.fn.expand("%:e")
  local icon, _ = require('nvim-web-devicons').get_icon_color(filename, extension)
  return string.format('%%m %s %%f', icon)
end

M.get_winbar = function()
  return table.concat {
    indicator(),
    '%=',
    get_file_name(),
  }
end

vim.o.winbar = "%{%v:lua.winbar.get_winbar()%}"

-- Add M to the global namespace _G so that it can be used in lua directly
_G.winbar = M
return M
