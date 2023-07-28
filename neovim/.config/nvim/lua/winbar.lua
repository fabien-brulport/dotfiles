local get_file_name = function()
  local filename, extension = vim.fn.expand("%:t"), vim.fn.expand("%:e")
  local icon, _ = require('nvim-web-devicons').get_icon_color(filename, extension)
  return string.format('%%m %s %%f', icon)
end

function win_bar()
  return table.concat {
    '%#Underlined#',
    '%=',
    get_file_name(),
  }
end

vim.o.winbar = "%!luaeval('win_bar()')"
