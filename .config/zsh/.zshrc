# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=${ZDOTDIR}/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase

setopt autocd extended_glob nobeep autolist
setopt autopushd correct pushdignoredups complete_in_word
setopt append_history extended_history sharehistory
setopt hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '${ZDOTDIR}/.zshrc'

# Native ZSH Autojump implementation
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':chpwd:*' recent-dirs-file "${ZDOTDIR}/.chpwd-recent-dirs"
zstyle ':completion:*' recent-dirs-insert always
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' cache-path "~/.cache/.zcompcache" 
autoload -Uz compinit

compinit -C -d "${ZDOTDIR}/.zcompdump"
# End of lines added by compinstall
export LESSHISTFILE="${HOME}/.config/less/history"
# autocomplete
ENABLE_CORRECTION=true

# Delete Keybind
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# Umask fix
umask 002

# change locale
export LANG="en_US.utf8"

# Prettify completion
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{green}%U%d%u%f'
zstyle ':completion:*:warnings' format '%F{yellow}Sorry, no matches for: %d%f'

source "${ZDOTDIR}/.zsh_aliases"

# Make sure ssh agent is running
if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)" &>/dev/null
fi

if [[ ! -d "${ZDOTDIR}/.antidote" ]]; then
	git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
fi

if [[ ! -d "${XDG_CONFIG_HOME}/tmux/plugins/tpm" ]]; then
	mkdir -p "${XDG_CONFIG_HOME}/tmux/plugins/tpm"
	git clone https://github.com/tmux-plugins/tpm ${XDG_CONFIG_HOME}/tmux/plugins/tpm
fi

if [[ ! -f ${HOME}/.vim/autoload/plug.vim ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	\vim -es -u ~/.vim/vimrc -i NONE -c "PlugInstall" -c "qa"
	nvim -es -u ~/.vim/vimrc -i NONE -c "PlugInstall" -c "qa"
fi

# Download and install fzf if not installed
if [[ ! -d "${XDG_CONFIG_HOME}/fzf" ]]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git "${XDG_CONFIG_HOME}/fzf"
	sh -c "ZDOTDIR=${ZDOTDIR} ${XDG_CONFIG_HOME}/fzf/install --key-bindings --completion --update-rc --no-bash --no-fish --xdg"
else
	# Source fzf if installed
	[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
fi

source "${ZDOTDIR}/.antidote/antidote.zsh"
antidote load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh &>/dev/null

