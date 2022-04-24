# NeoVim

## Installation
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

## Install [vim-plug](https://github.com/junegunn/vim-plug)
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Configuration
```
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim
```

## Create a Python 3 venv
Create a venv with `neovim`, `black` and `flake8`.

```
cd ~/.config/nvim/
python -m venv venv
source venv/bin/activate
pip install neovim black flake8
```
