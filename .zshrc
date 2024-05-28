# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase

setopt autocd extended_glob nobeep autolist
setopt autopushd correct pushdignoredups complete_in_word
setopt append_history extended_history sharehistory
setopt hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '${HOME}/.zshrc'

# Native ZSH Autojump implementation
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':chpwd:*' recent-dirs-file "${HOME}/.zsh/.chpwd-recent-dirs"
zstyle ':completion:*' recent-dirs-insert always
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' cache-path "~/.cache/.zcompcache" 
autoload -Uz compinit

compinit -C -d "${HOME}/.zsh/.zcompdump"
# End of lines added by compinstall
export LESSHISTFILE="${HOME}/.config/less/history"
# autocomplete
ENABLE_CORRECTION=true

# Delete Keybind
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# Add custom functions
fpath=(~/.zsh/funcs $fpath)
fpath=(~/.zsh/plugins $fpath)

for file in ~/.zsh/funcs/*; do
	autoload $file:t:r
done


# Umask fix
umask 002

# add to $PATH
export PATH=$PATH':'$HOME'/.local/bin:'$HOME'/.cargo/bin'

# change locale
export LANG="en_US.utf8"

export TERM="screen-256color"

# Prettify completion
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{green}%U%d%u%f'
zstyle ':completion:*:warnings' format '%F{yellow}Sorry, no matches for: %d%f'

# Ease of use aliases
alias tail='tail -300'
alias tailf='tail -f'

alias ls=' ls -lh --color'
alias ll='ls -A'
alias lt='ll -t'
alias lsd='ls -d */'

alias echo='echo -e'

alias ...='cd ../../'
alias ....='cd ../../../'

alias cp='cp -pi'
alias rm='rm -i'
alias mv='mv -i'

alias v='vim'
alias vi='vim'
alias vir='vim -R'
alias vid='vim -d'
alias visudo='sudo -e'

alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias sudo='sudo '
alias pls='sudo $(fc -ln -1)'

alias ghe='GH_HOST=ca1gilah.sba.gov gh'

# Customizations for if different commands are installed
if (( $+commands[eza] )); then
	alias ls='eza -lh --icons'
	alias ll='ls -a'
	alias tree='eza --tree'
fi

if (( $+commands[batcat] )); then
	alias cat=batcat
fi

if (( $+commands[bat] )); then
	alias cat=bat
fi

if (( $+commands[vim] )); then
	export EDITOR=$(which vim)
fi

if (( $+commands[nvim] )); then
	alias v='nvim'
	alias vi='nvim'
	alias vim='nvim'
	export EDITOR=$(which nvim)
	export SUDO_EDITOR=$(which nvim)
fi

if (( $+commands[apt] )); then
	alias install='sudo apt install'
	alias update='sudo apt update'
	alias upgrade='update && sudo apt upgrade'
fi

if (( $+commands[dnf] )); then
	alias install='sudo dnf install'
	alias update='sudo dnf upgrade'
	alias upgrade='sudo dnf upgrade'
fi

# Source fzf if installed
if (( $+commands[fzf] )); then
	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
	alias f='fzf'
fi

# Source plugins
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
if (( $+commands[zoxide] )); then
	eval "$(zoxide init --cmd j zsh)"
else
	alias j=cdr # fallback to native zsh autojump
fi

# Make sure ssh agent is running
if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)" &>/dev/null
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
