#! /bin/bash

function_check_diff () {
    if [[ $(diff $1 $2) ]]; then
        echo Difference found in $(basename $2)
        diff $1 $2
        echo 
    fi
}

# Oh-My-Zsh
function_check_diff ~/.oh-my-zsh/custom/conda_venv_prompt.zsh oh-my-zsh/conda_venv_prompt.zsh
function_check_diff ~/.oh-my-zsh/custom/color_patch.zsh oh-my-zsh/color_patch.zsh
function_check_diff ~/.oh-my-zsh/custom/themes/my-theme.zsh-theme oh-my-zsh/my-theme.zsh-theme

# Vim
function_check_diff ~/.vimrc vim/.vimrc

# Tmux
function_check_diff ~/.tmux.conf tmux/.tmux.conf

# PyCharm
function_check_diff ~/.ideavimrc pycharm/.ideavimrc
