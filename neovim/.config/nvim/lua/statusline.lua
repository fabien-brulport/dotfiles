local function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- LSP section, empty if no LSP attached
local get_lsp_diagnostic = function()
  local buf_clients = vim.lsp.get_clients({ bufnr = vim.fn.bufnr() })
  if next(buf_clients) == nil then
    return ''
  end
  -- List LSP attached and check if they are ready or not
  local lsp_parts = {}
  for _, client in ipairs(buf_clients) do
    local has_progress = client.progress and next(client.progress.pending) ~= nil
    if has_progress then
      table.insert(lsp_parts, string.format('%%#DiagnosticWarn#%s', client.name))
    else
      table.insert(lsp_parts, string.format('%%#diffAdded#%s', client.name))
    end
  end
  local lsp_list = table.concat(lsp_parts, ' %#Normal#| ')

  local errors = tablelength(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))
  local warnings = tablelength(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }))
  local infos = tablelength(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }))
  local hints = tablelength(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }))

  local diagnostic = string.format('%%#Normal#\\ [LSP: %s%%#Normal#]', lsp_list)
  if vim.lsp.inline_completion.is_enabled() then
    diagnostic = string.format('%s %%#diffAdded#󰏫', diagnostic)
  else
    diagnostic = string.format('%s %%#DiagnosticError#󰏯', diagnostic)
  end

  if errors ~= 0
  then
    diagnostic = string.format('%s %%#DiagnosticError#:%s', diagnostic, errors)
  end

  if warnings ~= 0
  then
    diagnostic = string.format('%s %%#DiagnosticWarn#:%s', diagnostic, warnings)
  end

  if infos ~= 0
  then
    diagnostic = string.format('%s %%#DiagnosticInfo#:%s', diagnostic, infos)
  end

  if hints ~= 0
  then
    diagnostic = string.format('%s %%#DiagnosticHint#:%s', diagnostic, hints)
  end
  return string.format('%s %%#Normal#', diagnostic)
end

local get_git_status = function()
  local signs = vim.b.gitsigns_status_dict
  if signs == nil then
    return ''
  end

  local status = '%#Normal#\\'
  if signs.added ~= 0
  then
    status = string.format('%s %%#diffAdded#+%s', status, signs.added)
  end
  if signs.changed ~= 0
  then
    status = string.format('%s %%#diffChanged#~%s', status, signs.changed)
  end
  if signs.removed ~= 0
  then
    status = string.format('%s %%#diffRemoved#-%s', status, signs.removed)
  end
  return string.format('%s %%#Identifier# %s %%#Normal#', status, signs.head)
end

function status_line()
  return table.concat {
    get_lsp_diagnostic(),
    get_git_status(),
  }
end

vim.o.statusline = "%!luaeval('status_line()')"
