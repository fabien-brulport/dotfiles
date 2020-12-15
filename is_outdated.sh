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

# PyCharm
function_check_diff ~/.ideavimrc pycharm/.ideavimrc

# Alacritty
function_check_diff ~/.config/alacritty/alacritty.yml alacritty/alacritty.yml
function_check_diff ~/.config/alacritty/toggle_dark_light.py alacritty/toggle_dark_light.py 
