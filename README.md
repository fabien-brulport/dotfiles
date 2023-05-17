# Configuration files

## Prerequisites

- The directory `~/.local/bin` must exist.
- `stow` must be installed (`brew install stow`)

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

## ZSH

1. Install Zsh
1. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) package with `brew install zsh-autosuggestions`.
1. Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) package with `brew install zsh-syntax-highlighting`.
1. Add autocompletion capabilities in `~/.zshrc`:
  ```shell
  autoload -Uz compinit
  # Update compinit cache once a day, to speed up startup time
  # From https://collectednotes.com/gillchristian/debugging-zsh-init-times
  if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
    compinit
  else
    compinit -C
  fi
  ```

1. In `~/.zshrc` source the 2 previous plugins:
  ```shell
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
1. To use ctrl+ P/N to navigate in history, add in `~/.zshrc`:
  ```shell
  autoload -U up-line-or-beginning-search
  autoload -U down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "^P" history-beginning-search-backward
  bindkey "^N" history-beginning-search-forward
  ```
1. Add the aliases with `stow zsh` and in `~/.zshrc`:
  ```shell
  # functions from oh-my-zsh
  function __git_prompt_git() {
    GIT_OPTIONAL_LOCKS=0 command git "$@"
  }
  function git_current_branch() {
    local ref
    ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
    local ret=$?
    if [[ $ret != 0 ]]; then
      [[ $ret == 128 ]] && return  # no git repo.
      ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
    fi
    echo ${ref#refs/heads/}
  }

  # Load aliases
  source ~/.zsh_aliases
  ```

## Pyenv

Install `pyenv` with `brew install pyenv`, and add this line in the `~/.zshrc`:
```shell
eval "$(pyenv init - zsh)"
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

## Starship

Just for the instant prompt feature !

```shell
stow --verbose starship
```

And add `eval "$(starship init zsh)"` at the end of the `~/.zshrc` file.

## Vim

```shell
stow --verbose vim
```
