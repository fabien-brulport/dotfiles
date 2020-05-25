# To put in ~/.oh-my-zsh/custom/themes

# Change the symbol if user is root
local user_symbol="➤"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = " #"
fi

# Define the symbols used when calling git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✓%{$reset_color%}"

# Do not show the dirty sign if there are only untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Symbols for number of commits ahead and behind
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{%F{3}%} "  # in orange
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="↗%{$reset_color%}"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{$fg_bold[red]%} "
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{%F{3}%} "  # in orange
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="↘%{$reset_color%}"

# Use variables to define the arrow at the beginning of the prompt
ARROW_UPPER_LINE="%{$fg[blue]%}╭─%{$reset_color%}"
ARROW_BOTTOM_LINE="%{$fg[blue]%}╰─${user_symbol}%{$reset_color%}"

# Variable to define how the path is print
MY_ZSH_PATH="%{$fg[blue]%}%~%{$reset_color%}"
if [[ -z "$SSH_CLIENT" ]]; then
    PROMPT_HOST=""
else
    PROMPT_HOST="%{%F{3}%}%n%{$reset_color%}@%{%F{3}%}%m%{$reset_color%} "
fi

# Finally, build the prompt
PROMPT='$ARROW_UPPER_LINE$(virtualenv_prompt_info)$PROMPT_HOST$MY_ZSH_PATH$(git_prompt_info)$(git_commits_ahead)$(git_commits_behind)
$ARROW_BOTTOM_LINE '
