#! /bin/bash

function_check_diff () {
    if [[ $(diff $1 $2) ]]; then
        echo Difference found in $(basename $2)
        diff $1 $2
        echo 
    fi
}

# Vim
function_check_diff ~/.vimrc vim/.vimrc

# Tmux
function_check_diff ~/.tmux.conf tmux/.tmux.conf

# Alacritty
function_check_diff ~/.config/alacritty/alacritty.yml alacritty/alacritty.yml

# Starship
function_check_diff ~/.config/starship.toml starship/starship.toml

# Neovim
function_check_diff ~/.config/nvim/init.vim neovim/init.vim
