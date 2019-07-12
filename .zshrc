# Lines configured by zsh-newuser-install
  HISTFILE=~/.zsh/.histfile
  HISTSIZE=1000
  SAVEHIST=1000

  setopt autocd extended_glob append_history extended_history nobeep autolist histignorespace autopushd
  bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
  zstyle :compinstall filename '${HOME}/.zshrc'
  autoload -Uz compinit

  compinit
# End of lines added by compinstall

# autocomplete
ENABLE_CORRECTION="true"

# Delete Keybind
  bindkey    "^[[3~"          delete-char
  bindkey    "^[3;5~"         delete-char

# Umask fix
  umask 002

# Add custom functions
  fpath=(~/.zsh/funcs $fpath)

  for file in ~/.zsh/funcs/*; do
	autoload $file:t:r
  done

# add ~/bin to $path
  export PATH=$PATH':'$HOME'/bin:/opt/csw/bin'

# Add Color
  export TERM='xterm-color'

# change locale
  export LANG="en_US.utf8"

# Custom Prompt
#  newline=$'\n'
#  datetime=$'%@'
#  currentdir=$'%F{yellow}%~%f'
#  nameathost=$'%F{magenta}%n%f@%F{cyan}%m%f'
#  histnum=$'%F{green}%!%f'

#  export PROMPT="${newline}${datetime} ${currentdir} ${newline}${nameathost} ${histnum} > "

# Prettify completion
  zstyle ':completion:*' menu select
  zstyle ':completion:*:descriptions' format '%F{green}%U%d%u%f'
  zstyle ':completion:*:warnings' format '%F{yellow}Sorry, no matches for: %d%f'

# Ease of use Alias
  alias install='sudo apt install'
  alias update='sudo apt update'
  alias upgrade='update && apt upgrade'
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
  alias vir='vim -R'
  alias vid='vim -d'
  alias ggrep='ggrep --exclude-dir={save,checkedout,experiments,flex} --color=auto' 
  #alias grep='ggrep'
  alias gegrep='gegrep --exclude-dir={save,checkedout,experiments,flex} --color=auto'
  #alias egrep='gegrep'
  alias diff='colordiff'
  alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Source plugins
  source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

 # Spaceship Prompt
   autoload -Uz promptinit; promptinit
   prompt spaceship
