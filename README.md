# Configuration files

## Prerequisites

- The directory `~/.local/bin` must exist.
- `stow` must be installed (`brew install stow`)

## Wezterm

- Download and install `JetBrainsMono Nerd Font` (to get some nice icons) from [here](https://www.nerdfonts.com/).
- Install wezterm with `brew`:
  ```shell
  brew install --cask wezterm
  ```
- Install the config with `stow`
  ```shell
  stow --verbose wezterm
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

## Tmux

### For local machine

Following command will install the conf and put some useful sh scripts in `~/.local/bin/`:
```shell
stow --verbose tmux
```

Then install the [extracto](https://github.com/laktak/extrakto) plugin:

```shell
git clone -b python-posix git@github.com:laktak/extrakto.git ~/.local/share/tmux/extrakto
```

### For remote machines

```shell
scp tmux_remote/.tmux.conf <ip>:~/.tmux.conf
```

## NeoVim


### Install language servers

- install `pyright`
  ```
  npm install -g pyright
  ```

- install `ruff`
  ```
  pipx install ruff
  ```

- install `rust-analyzer`
  ```
  curl -L https://github.com/rust-lang/rust-analyzer/releases/download/2024-12-16/rust-analyzer-x86_64-apple-darwin.gz | gunzip -c - > ~/.local/bin/rust-analyzer
  chmod +x ~/.local/bin/rust-analyzer
  ```

- install `luals`
  ```
  brew install lua-language-server
  ```

- install `yamlls`
  ```
  npm install -g yaml-language-server
  ```

- install `tsserver`
  ```
  npm install -g typescript-language-server
  ```

### Config

```shell
stow --verbose neovim
```

## Starship

```shell
stow --verbose starship
```

And add `eval "$(starship init zsh)"` at the end of the `~/.zshrc` file.

## Vim

```shell
stow --verbose vim
```
