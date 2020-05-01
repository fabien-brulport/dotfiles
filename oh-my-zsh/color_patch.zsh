# To put in ~/.oh-my-zsh/custom/

# This is needed with solarized themes:
# Set the foreground higtlighting accordingly to the current mac os mode (dark or light)
# Note: need to source ~/.zshrc to change to colour on the open terminals
if [ $(defaults read -g AppleInterfaceStyle) = 'Dark' ]
then
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=000'
else
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=007'
fi
