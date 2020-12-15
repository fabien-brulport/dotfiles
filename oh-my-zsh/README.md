# ZSH and Oh-My-Zsh

1. Install Zsh and Oh-My-Zsh
2. (Optional): install conda
3. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) package in `~/.oh-my-zsh/custom/plugins`
4. Install [zsh-synthax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) package in `~/.oh-my-zsh/custom/plugins`. With the solarized theme, the suggestions will have the same colour as the command already written, to solve that, add `export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=012'` in `~/.zshrc`, before the line `source $ZSH/oh-my-zsh.sh`.
5. In `~/.zshrc` add the following plugins (zsh-syntax-highlighting needs to be the last one):
```bash
plugins=(git python zsh-autosuggestions zsh-syntax-highlighting)
```
6. Install [FZF](https://github.com/junegunn/fzf), a fuzzy finder that can be used in `zsh` and `Vim`. The installer should add this line at the end of the `~./zshrc`
```bash
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```
7. Note: this line might be necessary to make Tmux and conda coexist, add this at the end of the 'conda init' block, which is added by the conda installer in `~./zshrc` (NOTE: seems to be solved now):
```bash
[[ -z $TMUX ]] || conda deactivate; conda activate base
```
8. Next line is useful to avoid duplicate entries in `$PATH`, then you can add custom paths to your `$PATH$`
```bash
export -U PATH=$PATH
export PATH=<my custom path>:$PATH
```
9. To use ctrl+ P/N to navigate in history, add in `~./zshrc`:
```bash
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
```
