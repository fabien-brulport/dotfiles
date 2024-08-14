return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    -- Find python venv
    local function get_python_path_from_poetry(workspace)
      local util = require('lspconfig/util')
      local path = util.path
      local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
      if match == '' then
        return nil
      end
      -- Get the last line returned by `poetry env info -p`, to ignore the potential warnings
      local lines = vim.split(vim.fn.system(string.format('cd %s && poetry env info -p && cd -', workspace)), '\n',
        { plaine = true, trimempty = true })
      if not next(lines) then
        return nil
      end
      local venv = vim.fn.trim(lines[#lines])
      if venv ~= '' then
        return path.join(venv, 'bin', 'python')
      end
    end

    local function get_python_path(workspace)
      local util = require('lspconfig/util')
      local path = util.path
      -- Use activated virtualenv.
      if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
      end

      -- Find and use virtualenv via poetry in workspace directory.
      local python_path = get_python_path_from_poetry(workspace)
      if python_path ~= nil then
        return python_path
      end

      -- Fallback to system Python.
      return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
    end

    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup {
      before_init = function(_, config)
        local python = get_python_path(config.root_dir)
        vim.b.pythonLSPpath = python
        config.settings.python.pythonPath = python
      end,
      on_attach = function(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
      end,
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
          },
        },
      },
    }
    lspconfig.ruff.setup {
      on_attach = function(client, bufnr)
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
      end
    }
    lspconfig.yamlls.setup {}
    lspconfig.tsserver.setup {}
    lspconfig.r_language_server.setup{}

    lspconfig.rust_analyzer.setup {
      on_attach = function(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
        -- Activate inlay hints
        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
      end,
    }
    lspconfig.lua_ls.setup {
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
      }
    }

    -- Create a command to select a Python env base on the lock file
    local select_env = function(opts)
      local poetry_locks = vim.fn.globpath('.', '**/poetry.lock', 0, 1)
      local finders = require "telescope.finders"
      local conf = require("telescope.config").values
      local actions = require "telescope.actions"
      local action_state = require "telescope.actions.state"

      opts = opts or {}
      local pickers = require "telescope.pickers"
      pickers.new(opts, {
        prompt_title = "Poetry environments",
        finder = finders.new_table {
          results = poetry_locks
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            local directory = vim.fn.fnamemodify(selection[1], ":p:h")
            local python_path = get_python_path_from_poetry(directory)
            vim.cmd({ cmd = 'PyrightSetPythonPath', args = { python_path } })
            vim.g.pythonLSPpath = python_path
          end)
          return true
        end,
      }):find()
    end
    vim.api.nvim_create_user_command('SelectPoetryEnv', select_env, {})

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>dd', vim.diagnostic.open_float)
    vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>dq', vim.diagnostic.setqflist)
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'none',
        source = 'if_many',
        header = '',
        prefix = '',
      },
    })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end,
    })
  end
}
