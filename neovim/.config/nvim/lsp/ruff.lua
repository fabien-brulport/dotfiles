return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'ruff.toml',
    '.ruff.toml',
    '.git',
  },
  single_file_support = true,
  -- on_attach = function(client, bufnr)
  --   -- Disable hover in favor of Pyright
  --   client.server_capabilities.hoverProvider = false
  -- end
  settings = {},
}
