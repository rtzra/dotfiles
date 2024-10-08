# Siberia - clean, simple and fast theme for Oh My Zsh https://ohmyz.sh/
# https://github.com/rtzra/dotfiles
# Icons: https://www.nerdfonts.com/cheat-sheet
#
# Recommends for best experience usage:
# - Install zsh and git
# - Install Oh My Zsh
# - Copy theme to ~/.oh-my-zsh/themes
# - Edit you ~/.zshrc file:
#   - Enable theme:
#     ZSH_THEME="siberia"
#   - Enable git plugin:
#     plugins=(git)
#   - Apply changes:
#     $ source ~/.zshrc
#
# Based on original 'ys' theme

# VCS
YS_VCS_PROMPT_PREFIX1="%{$fg[blue]%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[red]%}✗"
YS_VCS_PROMPT_CLEAN="%{$fg[blue]%}] %{$fg[green]%}✓"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}[git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# SVN info
local svn_info='$(svn_prompt_info)'
ZSH_THEME_SVN_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}[svn${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_SVN_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_SVN_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_SVN_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}[hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [[ "$(hg config oh-my-zsh.hide-dirty 2>/dev/null)" != "1" ]]; then
			if [ -n "$(hg status 2>/dev/null)" ]; then
				echo -n "$YS_VCS_PROMPT_DIRTY"
			else
				echo -n "$YS_VCS_PROMPT_CLEAN"
			fi
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

# Virtualenv
local venv_info='$(virtenv_prompt)'
YS_THEME_VIRTUALENV_PROMPT_PREFIX="%{$fg[green][%}"
YS_THEME_VIRTUALENV_PROMPT_SUFFIX="] "
virtenv_prompt() {
	[[ -n "${VIRTUAL_ENV:-}" ]] || return
	echo "${YS_THEME_VIRTUALENV_PROMPT_PREFIX}${VIRTUAL_ENV:t}${YS_THEME_VIRTUALENV_PROMPT_SUFFIX}"
}

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

# Prompt format:
#
# [TIME] [VENV] PRIVILEGES USER@MACHINE in DIRECTORY [git:BRANCH] git:STATE C:LAST_EXIT_CODE
# -> COMMAND
#
# For example:
#
# [21:11:34] [3.19] user@machine in ~/.oh-my-zsh on [git:master] x C:0
# ->
# ---

PROMPT="%{$FG[247]%}[%*]%{$reset_color%} \
${venv_info}\
%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[cyan]%}%n)\
%{$reset_color%}@\
%{$fg[green]%}%m \
%{$reset_color%}in \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${hg_info}\
${git_info}\
${svn_info} \
$exit_code
%{$terminfo[bold]$fg[green]%}➜ %{$reset_color%}"
#RPROMPT='[%*]'
