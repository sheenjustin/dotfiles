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

  setopt autocd extended_glob append_history extended_history nobeep autolist histignorespace autopushd correct pushdignoredups
  bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
  zstyle :compinstall filename '${HOME}/.zshrc'
  autoload -Uz compinit

  compinit
# End of lines added by compinstall

# autocomplete
  ENABLE_CORRECTION=true

# Delete Keybind
  bindkey    "^[[3~"          delete-char
  bindkey    "^[3;5~"         delete-char

# Umask fix
  umask 002

# Add custom functions
  fpath=(~/.zsh/funcs $fpath)
  fpath=(~/.zsh/plugins $fpath)

  for file in ~/.zsh/funcs/*; do
	autoload $file:t:r
  done

# add ~/bin to $path
  export PATH=$PATH':'$HOME'/bin:/opt/csw/bin:'$HOME'/.local/bin:'$HOME'/.cargo/bin'

# Add Color
  #export TERM='xterm-color'

# change locale
  export LANG="en_US.utf8"

# Prettify completion
  zstyle ':completion:*' menu select
  zstyle ':completion:*:descriptions' format '%F{green}%U%d%u%f'
  zstyle ':completion:*:warnings' format '%F{yellow}Sorry, no matches for: %d%f'

# Ease of use Alias
  alias install='sudo apt install'
  alias update='sudo apt update'
  alias upgrade='update && sudo apt upgrade'
  alias ant='/usr/local/bin/apache-ant-1.9.6/bin/ant'
  alias tail='tail -300'
  alias tailf='tail -f'
  alias ls=' ls -lh --color'
  alias ll='ls -A'
  alias lt='ll -t'
  alias lsd='ls -d */'
  alias echo='echo -e'
  alias cp='cp -pi'
  alias ...='cd ../../'
  alias ....='cd ../../../'
  alias rm='rm -i'
  alias mv='mv -i'
  alias v='vim'
  alias vi='vim'
  alias vir='vim -R'
  alias vid='vim -d'
  alias ggrep='ggrep --exclude-dir={save,checkedout,experiments,flex} --color=auto' 
  #alias grep='ggrep'
  alias gegrep='gegrep --exclude-dir={save,checkedout,experiments,flex} --color=auto'
  #alias egrep='gegrep'
  alias diff='colordiff'
  alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  alias dev='ssh sjustin@ca1danube.sba.gov'
  alias sudo='sudo '
  alias pls='sudo $(fc -ln -1)'
  alias docs='cd /opt/iplanet/servers/docs/'
  alias staging='cd /opt/san/gitdocs/staging'

  if (( $+commands[eza] )); then
    alias ls='eza -lh --icons'
	alias ll='ls -a'
  fi

  if (( $+commands[batcat] )); then
    alias cat=batcat
  fi
  
  if (( $+commands[bat] )); then
    alias cat=bat
  fi

  if (( $+commands[nvim] )); then
    alias v='nvim'
	alias vi='nvim'
	alias vim='nvim'
  fi

# Source plugins
  source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Allow the use of the z plugin to easily navigate directories
. ~/.zsh/plugins/z.sh

# NVM install
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh
