" Needed for nvim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = "/Users/fbrulport/miniconda3/envs/neovim/bin/python"
let g:black_virtualenv = "/Users/fbrulport/miniconda3/envs/neovim"

" Better copy & paste, press F2 before paste
set pastetoggle=<F2>

" Use ctrl+C to copy visual selection into MAC OS clipboard
vmap <C-c> :w !pbcopy<CR><CR>

" Window management with control Z
map <C-Z> <Nop>
nnoremap <C-Z> <C-W>

" Set the leader key to space
let mapleader = " "

" Show the command in the last line of the screen
" set showcmd

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
set number
"Automatically change between relative and absolute number
" :set number relativenumber
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END

" turn hybrid line numbers on
":set number relativenumber
":set nu rnu

" Smart indentation (with comments # etc)
set smartindent

" Continue the same indentation over new line
set autoindent

" Show the position of the cursor
set ruler

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Automatically add closing symbol
"'inoremap ( ()<left>
"'inoremap ' ''<left>
"'inoremap " ""<left>
"'inoremap { {}<left>
"'inoremap [ []<left>

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

" easier moving of code blocks (do not escape visual mode)
vnoremap < <gv
vnoremap > >gv

" my shortcut
" to delete without copying into the register 0
xnoremap <leader>p "_dP
noremap <leader>d "_d

" to replace the word, inside of parethesis etc by the current register 0
noremap <leader>w viwp
noremap <leader>" vi"p
noremap <leader>' vi'p
noremap <leader>) vi)p
noremap <leader>} vi}p
noremap <leader>] vi]p

" to replace the word, inside of parethesis etc by the current register 0, and do
" not copy the new word in the register 0
noremap <leader><leader>w viw"_dP
noremap <leader><leader>" vi""_dP
noremap <leader><leader>' vi'"_dP
noremap <leader><leader>) vi)"_dP
noremap <leader><leader>} vi}"_dP
noremap <leader><leader>] vi]"_dP


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/

" Code to automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'psf/black', { 'branch': 'stable' }
call plug#end()

" Fzf plugin
if has("mac")
  set rtp+=/usr/local/opt/fzf
else
  set rtp+=~/.fzf
endif
nnoremap <C-P> :GFiles<CR>
nnoremap <leader><C-P> :Files<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <leader>e :Buffers<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--layout reverse"

" Jedi plugin
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview

" Black
autocmd BufWritePre *.py execute ':Black'

" Git Gutter
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
set updatetime=250

" Fugitive keymaps (as in oh-my-zsh)
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gcmsg :Git commit -m
nnoremap <leader>gc :Git commit<CR>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
" nnoremap gdh :diffget //2<CR>
" nnoremap gdl :diffget //3<CR>

" Set the default path, and the markdown synthax for vimwiki
" let g:vimwiki_list = [{'path': '~/Documents/notes',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]

" Neomake (linter)
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
    \ 'exe': '/Users/fbrulport/miniconda3/envs/neovim/bin/flake8',
    \ 'args': ['--format=default', '--extend-ignore=E501, E203, W503', '--per-file-ignores=__init__.py:F401'],
    \ 'errorformat':
    \ '%A%f:%l:%c: %t%n %m,' .
    \ '%A%f:%l: %t%n %m,' .
    \ '%-G%.%#',
    \ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess'),
    \ 'short_name': 'fl8',
    \ 'output_stream': 'stdout',
    \ 'filter_output': function('neomake#makers#ft#python#FilterPythonWarnings'),
    \ }
call neomake#configure#automake('nrwi', 500)
" For both neomake and vim-gutter: place the signs into the columns numbers
set signcolumn=number

" TODO finish this
" hi link VimwikiHeader2 pandocBlockQuoteLeader1
" hi link VimwikiHeader3 pandocBlockQuoteLeader3
" hi link VimwikiLink helpHyperTextJump

" Color scheme
syntax enable
let g:solarized_termtrans=1
colorscheme solarized

let $BAT_THEME="Solarized (light)"
" Set the background accordingly to the current mac os mode (dark or light)
set background=light
if has("mac")
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark
  else
    set background=light
  endif
endif
" Aslo, use <F5> to toggle between the light and dark background mode
"call togglebg#map("<leader>t")
