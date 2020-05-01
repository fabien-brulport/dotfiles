# To put in ~/.oh-my-zsh/custom/themes

# Change the symbol if user is root
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi

# Define the symbols used when calling git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red] ✗$reset_color"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green] ✓$reset_color"

# Do not show the dirty sign if there are only untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Defing the symbols used when calling git_prompt_status
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[red]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%} ✭"

# Symbols for number of commits ahead and behind
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=" %B"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="↗%b"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX=" %B"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="↘%b"

PROMPT='╭─%B$(virtualenv_prompt_info)%b%(!.%{$fg[red]%}.%{$fg[green]%})%~$reset_color$(git_prompt_info)$(git_prompt_status)$reset_color$(git_commits_ahead)$(git_commits_behind)
╰─ %B${user_symbol}%b '
