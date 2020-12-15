" Better copy & paste, press F2 before paste
set pastetoggle=<F2>

" Use ctrl+C to copy visual selection into MAC OS clipboard
vmap <C-c> :w !pbcopy<CR><CR>

" Set the leader key to ,
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


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/

" Fzf plugin
set rtp+=/usr/local/opt/fzf
nnoremap <C-P> :GFiles<CR>
nnoremap <leader><C-P> :Files<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <leader>e :Buffers<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--layout reverse"

" Fugitive keymaps (as in oh-my-zsh)
nnoremap <leader>gst :Gstatus<CR>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Setup Pathogen to manage your plugins
call pathogen#infect()
Helptags

" Set the default path, and the markdown synthax for vimwiki
let g:vimwiki_list = [{'path': '~/Documents/notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" TODO finish this
" hi link VimwikiHeader2 pandocBlockQuoteLeader1
" hi link VimwikiHeader3 pandocBlockQuoteLeader3
" hi link VimwikiLink helpHyperTextJump

" Color scheme
syntax enable
let g:solarized_termtrans=1
colorscheme solarized
" highlight Comment cterm=italic gui=italic

let $BAT_THEME="Solarized (light)"
" Set the background accordingly to the current mac os mode (dark or light)
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
  set background=dark
else
  set background=light
endif
" Aslo, use <F5> to toggle between the light and dark background mode
