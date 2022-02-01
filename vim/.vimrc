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
