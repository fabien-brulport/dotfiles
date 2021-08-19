
# Installation

```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

```
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
```

# Create a Python 3

Create a venv with `neovim`, `jedi`, `black` and `flake8`.


Update to the path of the env
```
let g:python3_host_prog = "/workspace/neovimvenv/bin/python"
```
