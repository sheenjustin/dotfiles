# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/sheen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Add to paths
  export PATH=$PATH':'$HOME'/bin/'
  fpath=( "$HOME/.zsh/funcs" $fpath )

# spaceship-prompt
  autoload -Uz promptinit;promptinit

# Add Color
  export TERM='xterm-color'

# Custom Prompt
#  newline=$'\n'
#  datetime=$'%@'
#  currentdir=$'%F{yellow}%~%f'
#  nameathost=$'%F{magenta}%n%f@%F{cyan}%m%f'
#  histnum=$'%F{green}%!%f'

 # export PROMPT="${newline}${datetime} ${currentdir} ${newline}${nameathost} ${histnum} > "

# Prettify completion
  zstyle ':completion:*' menu select
  zstyle ':completion:*:descriptions' format '%F{green}%U%d%u%f'
  zstyle ':completion:*:warnings' format '%F{yellow}Sorry, no matches for: %d%f'

# Aliases
  alias install='sudo apt install'
  alias update='sudo apt update'
  alias upgrade='update && sudo apt upgrade'
  alias vi='vim'
  alias ls='ls -lh --color=yes'
  alias ll='ls -A'
  alias cp='cp -p'
  alias mv='mv -p'
  alias ...='cd ../../'
  alias ....='cd ../../../'
  alias echo='echo -e'

# Plugins
  source /home/sheen/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  
# Git stuff
  alias config='git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}'

  prompt spaceship
