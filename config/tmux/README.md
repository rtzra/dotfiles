# Tmux config file

My own .tmux.conf config file for tmux.

## How to setup

### Install some software for your Linux distributive

Use apt/yum/dnf or another package manager in your system:

```
apt install -y tmux 
```

```
apt install -y git
```

### Clone repo

Before cloning see Requirements (tmux, awk, sed and perl)

```
cd ~/
git clone https://github.com/rtzra/dotfiles
```

### Copy config file

```
$ cd
$ cp dotfiles/config/tmux/.tmux.conf .
```

or get my:

```
wget https://raw.githubusercontent.com/rtzra/dotfiles/master/config/tmux/.tmux.conf
```

### Difference:

A lot of differences, look at .tmux.conf and comments

Command prefix keybinding: `

Index starting from 1 (0 for default)

### Add autorun for tmux

Add to your .bashrc or .zshrc:

```
# Tmux
# -----
session_name="rtzra"
# Check if a tmux session exists with a given name.
tmux has-session -t=$session_name 2> /dev/null

# Create the session if it doesn't exists.
if [[ $? -ne 0 ]]; then
  TMUX='' tmux new-session -d -s "$session_name"
fi

# Attach if outside of tmux, switch if you're in tmux.
if [[ -z "$TMUX" ]]; then
  tmux attach -t "$session_name"
else
  tmux switch-client -t "$session_name"
fi
# -----
```

### Reload settings

Reload bash configuration:

```
source ~/.bashrc
```

Reload zsh configuration:

```
source ~/.zshrc
```

Reload Tmux configuration:

```
tmux source-file ~/.tmux.conf
```
or press ` and then Ctrl+i
