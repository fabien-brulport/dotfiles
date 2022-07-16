# Configuration files


The directory `~/.local/bin` must exist.

## Alacritty

- Download and install `JetBrainsMono Nerd Font` (to get some nice icons) from [here](https://www.nerdfonts.com/).
- Create a config directory for Alacritty (if not `stow` will create a simlink for the directory, but then Alacritty has trouble
  to detect changes).
  ```shell
  mkdir ~/.config/alacritty
  ````
- Install the config with `stow`
  ```shell
  stow --verbose alacritty
  ```

## ZSH and Oh-My-Zsh

1. Install Zsh and Oh-My-Zsh
1. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) package in `~/.oh-my-zsh/custom/plugins`
1. Install [zsh-synthax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) package in `~/.oh-my-zsh/custom/plugins`.
1. In `~/.zshrc` add the following plugins (zsh-syntax-highlighting needs to be the last one):
  ```shell
  plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
  ```
1. Install [FZF](https://github.com/junegunn/fzf), a fuzzy finder that can be used in `zsh` and `Vim`. The installer should add this line at the end of the `~./zshrc`
  ```shell
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  ```
1. Next line is useful to avoid duplicate entries in `$PATH`, then you can add custom paths to your `$PATH$`
  ```shell
  export -U PATH=$PATH
  export PATH=<my custom path>:$PATH
  ```
1. To use ctrl+ P/N to navigate in history, add in `~./zshrc`:
  ```shell
  autoload -U up-line-or-beginning-search
  autoload -U down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "^P" history-beginning-search-backward
  bindkey "^N" history-beginning-search-forward
  ```
## Tmux

### For local machine

Following command will install the conf and put some useful sh scripts in `~/.local/bin/`:
```shell
stow --verbose tmux
```

### For remote machines

```shell
scp tmux_remote/.tmux.conf <ip>:~/.tmux.conf
```

## NeoVim


### Create a Python 3 venv
Create a venv with `neovim`, `black` and `flake8`.

```
mkdir -p ~/.local/share/virtualenvs
cd ~/.local/share/virtualenvs
python -m venv neovimvenv
source neovimvenv/bin/activate
pip install neovim black flake8
```

### Config

```shell
stow --verbose neovim
```

## Vim

```shell
stow --verbose vim
```

## Powerlevel10k

Just for the instant prompt feature !

```shell
stow --verbose powerlevel10k
```
