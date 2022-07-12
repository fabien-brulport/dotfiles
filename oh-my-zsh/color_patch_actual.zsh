autoload -U add-zsh-hook

# To put in ~/.oh-my-zsh/custom/

# This is needed with solarized themes:
# Set the foreground higtlighting accordingly to the current mac os mode (dark or light)
function update_autosuggest_color(){
    if [ "$(defaults read -g AppleInterfaceStyle 2> /dev/null)" = 'Dark' ]
    then
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=000'
    else
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=007'
    fi
}

# Adding the function in the precmd hook so that it is executed before each prompt
#add-zsh-hook precmd update_autosuggest_color
