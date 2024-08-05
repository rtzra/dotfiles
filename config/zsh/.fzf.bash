# Setup fzf
# ---------
if [[ ! "$PATH" == */home/fireball/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/fireball/.fzf/bin"
fi

eval "$(fzf --bash)"
