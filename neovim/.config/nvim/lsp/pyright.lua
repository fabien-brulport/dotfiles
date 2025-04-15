local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return 'virtualenv', vim.fs.joinpath(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Use .venv if it exists.
  local match = vim.fn.glob(vim.fs.joinpath(workspace, '.venv'))
  if match ~= '' then
    return '.venv', vim.fs.joinpath(workspace, '.venv', 'bin', 'python')
  end

  -- Fallback to system Python.
  return 'system', vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  single_file_support = true,
  before_init = function(_, config)
    local name, python = get_python_path(config.root_dir)
    vim.b.pythonLSPname = name
    config.settings.python.pythonPath = python
  end,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}
