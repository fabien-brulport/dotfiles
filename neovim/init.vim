" Needed for nvim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_env = "/Users/fbrulport/.config/nvim/venv"
let g:python3_host_prog = "/Users/fbrulport/.config/nvim/venv/bin/python"
let g:black_virtualenv = "/Users/fbrulport/.config/nvim/venv"

lua << EOF
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'neovim/nvim-lspconfig'
  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'christoomey/vim-sort-motion'
  use 'christoomey/vim-system-copy'
  -- Plug 'inkarkat/vim-ReplaceWithRegister'
  -- Markdown preview: install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'yamatsum/nvim-cursorline'
  use 'preservim/vimux'
  use 'vim-test/vim-test'
  use 'f-person/auto-dark-mode.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- if packer_bootstrap then
  --   require('packer').sync()
  -- end
end)
EOF

" Use Esc to go in normal mode in terminal
:tnoremap <Esc> <C-\><C-n>

" Use ctrl+C to copy visual selection into MAC OS clipboard
vmap <C-c> :w !pbcopy<CR><CR>

" Window management with control Z
map <C-Z> <Nop>
nnoremap <C-Z> <C-W>

" Set the leader key to space
let mapleader = " "

" Show the command in the last line of the screen
set showcmd

" Normal behavior for backspace
set backspace=indent,eol,start

" Not compatible with vi
set nocompatible

" Prerequiste for vimwiki
filetype plugin on

" Do not create swap files
set noswapfile

" Return to last edit position when opening files
autocmd BufReadPost * silent! normal! g`"zv

" highlight the result
:set hlsearch
" use leader key + esc to clear the highlight
nnoremap <leader><esc> :noh<return><esc>

" Never show the tabline
:set showtabline=0

" Show line number
:set number
"Automatically change between relative and absolute number
" :set number relativenumber
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

" turn hybrid line numbers on (current line shows absolute line number)
:set number relativenumber
:set nu rnu

" Smart indentation (with comments # etc)
set smartindent

" Continue the same indentation over new line
set autoindent

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Use Tab to show the possible matches in the command line (and switches
" between the matches)
set wildmenu

" Tab management---------- 
" Make tabs equals to 4 columns
set tabstop=4
set softtabstop=4
" Make a indentation equals to 4 columns
set shiftwidth=4
" Indentation to the closest tab
set shiftround
" Convert tab to spaces
set expandtab

set updatetime=250

" For linter and vim-gutter: place the signs into the columns numbers
set signcolumn=number

" easier moving of code blocks (do not escape visual mode)
vnoremap < <gv
vnoremap > >gv

" reload init.vim
nnoremap <leader>sv :source $MYVIMRC<CR>

" edit init.vim
nnoremap <leader>ev :edit $MYVIMRC<CR>

" Mapping for quickfix list
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>
nnoremap <leader>cc :cclose<CR>

set completeopt=menu,menuone,noselect
" LUA config
lua << EOF
-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    ['<C-y>'] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp", max_item_count = 5 },
    { name = "path"},
    { name = "buffer", max_item_count = 5 },
  })
})

-- LSP config
local nvim_lsp = require('lspconfig')
local configs = require('lspconfig/configs')
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
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

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
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pyright.setup{
    on_attach = on_attach,
    before_init = function(_, config)
      config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
    flags = {
      debounce_text_changes = 150,
    },
   capabilities = capabilities,
}

-- do not show the diagnostic at the end of the line
vim.diagnostic.config({
  virtual_text = false,
})

-- Telescope plugin
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')

-- Treesitter
require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

-- Auto Dark Mode
local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
	end,
})
auto_dark_mode.init()

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.black,
  },
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require('gitsigns').setup{
  signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
}

EOF

" Telescope key bindings
nnoremap <C-P> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=true, no_ignore=true})<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader><leader> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>f<esc> <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').command_history()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').git_bcommits()<cr>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap gd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>

" Gitsigns
nnoremap <leader>hs :Gitsigns stage_hunk<CR>
vnoremap <leader>hs :Gitsigns stage_hunk<CR>
nnoremap <leader>hr :Gitsigns reset_hunk<CR>
vnoremap <leader>hr :Gitsigns reset_hunk<CR>
nnoremap <leader>hS <cmd>Gitsigns stage_buffer<CR>
nnoremap <leader>hu <cmd>Gitsigns undo_stage_hunk<CR>
nnoremap <leader>hR <cmd>Gitsigns reset_buffer<CR>
nnoremap <leader>hh <cmd>Gitsigns preview_hunk<CR>
nnoremap <leader>hn <cmd>Gitsigns next_hunk<CR>
nnoremap <leader>hp <cmd>Gitsigns prev_hunk<CR>

" Formatting with null-ls
nnoremap <leader>b <cmd>lua vim.lsp.buf.formatting()<cr>

" Fugitive keymaps
nnoremap <leader>gg :vertical Git<CR>
nnoremap <leader>gc :vertical Gclog<CR>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>

" Vimux
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
let g:VimuxRunnerType = "window"

" Vim-test
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
let test#python#runner = 'pytest'
let test#strategy = "vimux"

" Color scheme
syntax enable
" " For Solarized
" let g:solarized_termtrans=1
" colorscheme solarized
" " For Gruvbox
set termguicolors
colorscheme gruvbox
