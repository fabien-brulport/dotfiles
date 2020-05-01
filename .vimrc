" Better copy & paste, press F2 before paste
set pastetoggle=<F2>
set clipboard=unnamed
" Use ctrl+C to copy visual selection into macos clipboard
vmap <C-c> :w !pbcopy<CR><CR>

" Set the leader key to ,
let mapleader = ","

" Set colors suitable for dark backgroud
set background=dark

" Not compatible with vi
set nocompatible

" Prerequiste for vimwiki
filetype plugin on

" Do not create swap files
set noswapfile

"Automatically change between relative and absolute number
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" turn hybrid line numbers on
":set number relativenumber
":set nu rnu

" Smart indentation
set smartindent

" Continue the same indentation over new line
set autoindent

" Show the position of the cursor
set ruler

" Disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Automatically add closing symbol
"'inoremap ( ()<left>
"'inoremap ' ''<left>
"'inoremap " ""<left>
"'inoremap { {}<left>
"'inoremap [ []<left>

" Find files easily
set path+=**
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
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" my shortcut
set showcmd
" to delete without copying into the buffer
xnoremap <leader>p "_dP
noremap <leader>d "_d

" to replace the word, inside of parethesis etc byt the current buffer
noremap <leader>w viwp
noremap <leader>" vi"p
noremap <leader>' vi'p
noremap <leader>) vi)p
noremap <leader>} vi}p
noremap <leader>] vi]p


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/

" Fzf plugin
set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :FZF<cr>

" Setup Pathogen to manage your plugins
call pathogen#infect()

" Set the default path, and the markdown synthax for vimwiki
let g:vimwiki_list = [{'path': '~/Documents/notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Color scheme
let g:solarized_termtrans=1
syntax enable
colorscheme solarized

