# Tmux config file

My own .tmux.conf.local config file for tmux.

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
git clone https://github.com/gpakosz/.tmux
```

### Copy config file

```
$ cd
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
```
You may copy default config:

```
$ cp .tmux/.tmux.conf.local .
```

or get my:

```
wget https://raw.githubusercontent.com/rtzra/public/tmux/master/.tmux.conf.local
```

Difference:

```
set-option -g prefix `
bind-key a send-prefix
set -g base-index 1
set-option -g base-index 1
setw -g pane-base-index 1
```

Command prefix keybinding: `

`a` for pressing `

Index starting from 1 (0 for default)

### Add autorun for tmux

Add to your .bashrc or .zshrc:

```
# Tmux as default
if [ ! "$TMUX" ]; then
 tmux attach
fi

if [ "$TMUX" ]; then
# export TERM=screen
 export TERM=xterm
fi
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
