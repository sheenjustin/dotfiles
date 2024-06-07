source ${HOME}/.zshenv				# Make sure env file is sourced
source "${ZDOTDIR}/.zsh_aliases"	# Set aliases

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################################################################
# Variables to export

HISTFILE=${ZDOTDIR}/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase

LANG="en_US.utf8"	# change locale
LESSHISTFILE="${HOME}/.config/less/history"
ENABLE_CORRECTION=true # autocomplete
umask 002												# Umask fix
eval $(dircolors -b ${XDG_CONFIG_HOME}/.dircolors)		# Set LS_COLORS

###############################################################################
# Options

setopt autocd extended_glob nobeep autolist
setopt autopushd correct pushdignoredups complete_in_word
setopt append_history extended_history sharehistory
setopt hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
bindkey -v

zstyle :compinstall filename '${ZDOTDIR}/.zshrc'

###############################################################################
# Delete Keybind

bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

###############################################################################
# Prettify completion using fzf-tab

zstyle ':completion:*:git-checkout:*' sort false		# disable sort when completing `git checkout`
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[ %d ]'		# set descriptions format to enable group support
zstyle ':completion:*:*:*:*:corrections' format '[ ! %d (errors: %e) ! ]'
zstyle ':completion:*:messages' format '[ %d ]'
zstyle ':completion:*:warnings' format '[ ! no matches found ]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}	# set list-colors to enable filename colorizing
zstyle ':completion:*' menu no							# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath' # preview directory's content with eza when completing cd
zstyle ':fzf-tab:*' switch-group '<' '>'				# switch group using `<` and `>`
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup			# Use popup when in tmux

###############################################################################
#Install plugin managers and fzf

if [[ ! -d "${ZDOTDIR}/.antidote" ]]; then # Antidote: ZSH Plugin Manager
	git clone -q --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
fi
source "${ZDOTDIR}/.antidote/antidote.zsh"
antidote load

if [[ ! -f ${HOME}/.vim/autoload/plug.vim ]]; then # Plug: vim and neovim plugin manager
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs -s https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	\vim -es -u ~/.vim/vimrc -i NONE -c "PlugInstall" -c "qa"
	nvim -es -u ~/.vim/vimrc -i NONE -c "PlugInstall" -c "qa"
fi

if [[ ! -d "${XDG_CONFIG_HOME}/fzf" ]]; then # Download and install fzf if not installed
	git clone -q --depth 1 https://github.com/junegunn/fzf.git "${XDG_CONFIG_HOME}/fzf"
	sh -c "ZDOTDIR=${ZDOTDIR} ${XDG_CONFIG_HOME}/fzf/install --key-bindings --completion --update-rc --no-bash --no-fish --xdg" &>/dev/null
fi
source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

if (( ! $+commands[zoxide] )); then # Install zoxide
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi
eval "$(zoxide init --cmd j zsh & )" &>/dev/null

###############################################################################

if [ -z "$SSH_AUTH_SOCK" ]; then # Make sure ssh agent is running
	eval "$(ssh-agent -s)" &>/dev/null
fi

fast-theme XDG:overlay &>/dev/null # Add overlay to default fast syntax-highlighting theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh &>/dev/null

if (( $+commands[tmux] )); then # Start tmux if installed
	tmux attach
fi

