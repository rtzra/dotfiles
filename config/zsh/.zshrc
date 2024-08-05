# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="ys"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="dd-mm-yyyy"
HISTSIZE=10000000
SAVEHIST=10000000
HISTORY_IGNORE="(ls|cd|pwd|exit)*"
setopt EXTENDED_HISTORY      # History file format ':start:elapsed;command'
setopt INC_APPEND_HISTORY    # Write history immediately, do not wait close shell
setopt SHARE_HISTORY         # Share history for all sessions
setopt HIST_IGNORE_DUPS      # Ignore duplicated messages
setopt HIST_IGNORE_ALL_DUPS  # Ignore all duplicates
setopt HIST_IGNORE_SPACE     # Не делать записи о командах, начинающихся с пробела.
setopt HIST_SAVE_NO_DUPS     # Do not write duplicate to file
setopt HIST_VERIFY           # Перед выполнением команд показывать записи о них из истории команд.
setopt APPEND_HISTORY        # Append history
setopt HIST_NO_STORE         # Не хранить записи о командах history.
setopt HIST_REDUCE_BLANKS    # Reeduce blanks (spaces)

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(fzf-tab zsh-autosuggestions fast-syntax-highlighting git ansible colorize colored-man-pages encode64 tmux sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'
export VISUAL='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# set PATH environment
#export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# For full username length in 'w' command
export PROCPS_USERLEN=20

# Proxy settings
#export {http_proxy,https_proxy,ftp_proxy,all_proxy,HTTP_PROXY,HTTPS_PROXY,FTP_PROXY,ALL_PROXY}="http://127.0.0.1:3128/"
#export {no_proxy,NO_PROXY}="localhost,127.0.0.1,::1,.local.mydomain.ru"

# Terminal color palette
export TERM=xterm-256color
COLORTERM=truecolor

# Tmux
# -----
session_name="fireball"
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

# fzf plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Vault settings
#export VAULT_ADDR="https://vault.mydomain.ru:8200"
#export VAULT_CACERT=/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem

# Aliases section
# git
alias gp="git pull"
alias gf="git fetch"
alias gs="git status"
alias gadd="git add ."
alias gd="git diff"
alias gbr="git branch -r"
alias gbd="git branch --delete $1"
alias gsm="git switch master"
alias glf="git log -p -- $1"
alias gch="git checkout $1"
# grep
alias grep='grep --color'
# Exa - replacing for ls
alias ll='eza --icons --group-directories-first -l'
# Font test
alias testfont='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699 \u2687"'
# bat - replacing for cat
alias cat="batcat"
#export BAT_THEME="default"
#source ~/.zfunc/bat.zsh

# Brew package manager
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
