local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return 'virtualenv', vim.fs.joinpath(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Use .venv if it exists and if we are in a workspace
  if workspace ~= nil then
    local match = vim.fn.glob(vim.fs.joinpath(workspace, '.venv'))
    if match ~= '' then
      return '.venv', vim.fs.joinpath(workspace, '.venv', 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return 'system', vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

return {
  cmd = { 'basedpyright-langserver', '--stdio' },
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
    -- Choose the correct env
    -- Note: basedpyright does approximately the same thing by default
    local name, python = get_python_path(config.root_dir)
    config.settings.python.pythonPath = python
    vim.b.pythonLSPname = name
  end,
  on_attach = function(client, _)
    -- Save the env name in a buffer variable to be able to show it in the statusline
    local name, _ = get_python_path(client.config.root_dir)
    vim.b.pythonLSPname = name
  end,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    -- Initialize an empty array to be able to run before_init
    python = {},
    basedpyright = {
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
