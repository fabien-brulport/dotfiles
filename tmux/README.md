# Tmux

## For local machine

### Conf
```
cp tmux.conf ~/.tmux.conf
```

### Binaries
```
mkdir -p ~/.local/bin
cp tmux-session-menu ~/.local/bin
cp tmux-sessionizer ~/.local/bin
cp is_dark_mode.sh ~/.local/bin
```
## For remote machines

### Conf
```
scp tmux_remote.conf <machin-ip>:~/.tmux.conf
```
