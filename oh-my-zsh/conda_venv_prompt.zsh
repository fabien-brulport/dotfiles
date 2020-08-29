# To put in ~/.oh-my-zsh/custom/

function virtualenv_prompt_info(){
    # The function change the prompt by adding the active python env. It handles both conda and venv environment
    # Get conda Env
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        venv="(${CONDA_DEFAULT_ENV})"
        separator=" "
    else
        # In case you don't have one activated
        venv=""
        separator=""
    fi
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${venv}${separator}(venv:"${VIRTUAL_ENV##*/}")"
    fi
    [[ -n "$venv" ]] && echo " $venv"
}

# disable the default virtualenv prompt change because it is handled by the function above
export VIRTUAL_ENV_DISABLE_PROMPT=1
# To disable the change prompt from conda, add the following line in ~/.condarc
# changeps1: False
