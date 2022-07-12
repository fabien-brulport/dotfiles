# Configuration files



## Alacritty

### Font

Download and install `JetBrainsMono Nerd Font` (to get some nice icons) from [here](https://www.nerdfonts.com/).


## ZSH and Oh-My-Zsh

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
## Tmux


### For local machine

#### Conf
```
cp tmux.conf ~/.tmux.conf
```

#### Binaries
```
mkdir -p ~/.local/bin
cp tmux-session-menu ~/.local/bin
cp tmux-sessionizer ~/.local/bin
cp is_dark_mode.sh ~/.local/bin
```
### For remote machines

#### Conf
```
scp tmux_remote.conf <machin-ip>:~/.tmux.conf
```
## NeoVim


### Installation
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

### Install [vim-plug](https://github.com/junegunn/vim-plug)
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Configuration
```
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim
```

### Create a Python 3 venv
Create a venv with `neovim`, `black` and `flake8`.

```
cd ~/.config/nvim/
python -m venv venv
source venv/bin/activate
pip install neovim black flake8
```

## Vim

```
cp .vimrc ~/.vimrc
```

## Starship
