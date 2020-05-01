# ZSH and Oh-My-Zsh

1. Install Zsh and Oh-My-Zsh
2. (Optional): install conda
3. Copy the custom them `my-theme.zsh-them` in `~/.oh-my-zsh/custom/themes`. This theme needs the file `conda_venv_prompt.zsh` to be in `~/.oh-my-zsh/custom/` (to change the prompt accordingly to the conda or virtual environment). With this setting, the prompt change done by conda needs to be disable with `conda config`, then put `changeps1: False` in `~/.condarc`.
4. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) package in `~/.oh-my-zsh/custom/plugins`
5. Install [zsh-synthax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) package in `~/.oh-my-zsh/custom/plugins`. With the solarized theme, the suggestions will have the same colour as the command already written, to solve that copy `color_patch.zsh` in `~/.oh-my-zsh/custom/`.
6. In `~/.zshrc` add the following plugins
```bash
plugins=(git python zsh-autosuggestions zsh-syntax-highlighting)
```
7. Install [FZF](https://github.com/junegunn/fzf), a fuzzy finder that can be used in `zsh` and `Vim`. The installer should add this line at the end of the `~./zshrc`
```bash
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```
8. Note: this line might be necessary to make Tmux and conda coexist, add this at the end of the 'conda init' block, which is added by the conda installer in `~./zshrc`
```bash
[[ -z $TMUX ]] || conda deactivate; conda activate base
```
9. Next line is useful to avoid duplicate entries in `$PATH`, then you can add custom paths to your `$PATH$`
```bash
export -U PATH=$PATH
export PATH=<my custom path>:$PATH
```
