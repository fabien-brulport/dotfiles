local function tablelength(T)
   local count = 0
   for _ in pairs(T) do count = count + 1 end
   return count
end

local get_lsp_diagnostic = function(self)

  errors = tablelength(vim.diagnostic.get(0, {severity = vim.diagnostic.severity.ERROR}))
  warnings = tablelength(vim.diagnostic.get(0, {severity = vim.diagnostic.severity.WARN}))
  infos = tablelength(vim.diagnostic.get(0, {severity = vim.diagnostic.severity.INFO}))
  hints = tablelength(vim.diagnostic.get(0, {severity = vim.diagnostic.severity.HINT}))
  if errors == 0 and warnings == 0 and infos == 0 and hints == 0
  then
  return ''
  end

  local diagnostic = '%#Normal#\\ '
  if errors ~= 0
  then
  diagnostic = diagnostic .. '%#DiagnosticError#' .. string.format(':%s ', errors)
  end

  if warnings ~= 0
  then
  diagnostic = diagnostic .. '%#DiagnosticWarn#' .. string.format(':%s ', warnings)
  end

  if infos ~= 0
  then
  diagnostic = diagnostic .. '%#DiagnosticInfo#' .. string.format(':%s ', infos)
  end

  if hints ~= 0
  then
  diagnostic = diagnostic .. '%#DiagnosticHint#' .. string.format(':%s ', hints)
  end
  return diagnostic
end
local get_git_status = function()
  -- use fallback because it doesn't set this variable on the initial `BufEnter`
  local signs = vim.b.gitsigns_status_dict or {head = '', added = 0, changed = 0, removed = 0}
  local is_head_empty = signs.head ~= ''
  if signs.head == ''
  then
  return ''
  end

  local status = '%#Identifier#\\ '
  if signs.added ~= 0
  then
  status = status .. '%#diffAdded#' .. string.format('+%s ', signs.added)
  end
  if signs.changed ~= 0
  then
  status = status .. '%#diffChanged#' .. string.format('~%s ', signs.changed)
  end
  if signs.removed ~= 0
  then
  status = status .. '%#diffRemoved#' .. string.format('-%s ', signs.removed)
  end
  status = status .. '%#Identifier# ' .. signs.head

  return status
end

function status_line()
    return table.concat {
        '%#Normal#',
        get_lsp_diagnostic(),
        get_git_status(),
    }
end

vim.o.statusline = "%!luaeval('status_line()')"
