return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local nvim_command = vim.api.nvim_command
    local util = require('lspconfig/util')
    local path = util.path

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap = true, silent = true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

      -- Show diagnostic when hover
      nvim_command('autocmd CursorHold <buffer> lua vim.diagnostic.open_float({focus = false})')
    end

    -- Find python venv
    local function get_python_path(workspace)
      -- Use activated virtualenv.
      if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
      end

      -- Find and use virtualenv via poetry in workspace directory.
      local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
      if match ~= '' then
        -- Get the last line returned by `poetry env info -p`, to ignore the potential warnings
        local lines = vim.split(vim.fn.system('poetry env info -p'), '\n', {plaine=true, trimempty=true})
        local venv = vim.fn.trim(lines[#lines])
        if venv ~= '' then
          return path.join(venv, 'bin', 'python')
        end
      end

      -- Fallback to system Python.
      return exepath('python3') or exepath('python') or 'python'
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local lsp_flags = {
      debounce_text_changes = 150,
    }
    require('lspconfig').pyright.setup {
      on_attach = on_attach,
      before_init = function(_, config)
        python = get_python_path(config.root_dir)
        vim.g.pythonLSPpath = python
        config.settings.python.pythonPath = python
      end,
      flags = lsp_flags,
      capabilities = capabilities,
    }
    require('lspconfig').rust_analyzer.setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    }
    require 'lspconfig'.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }
    -- do not show the diagnostic at the end of the line
    vim.diagnostic.config({
      virtual_text = false,
    })
  end
}
