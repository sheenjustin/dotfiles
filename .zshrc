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
  fpath=(~/.zsh/plugins $fpath)

  for file in ~/.zsh/funcs/*; do
	autoload $file:t:r
  done

# add ~/bin to $path
  export PATH=$PATH':'$HOME'/bin:/opt/csw/bin'

# Add Color
  export TERM='xterm-color'

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
  alias vir='vim -R'
  alias vid='vim -d'
  alias ggrep='ggrep --exclude-dir={save,checkedout,experiments,flex} --color=auto' 
  #alias grep='ggrep'
  alias gegrep='gegrep --exclude-dir={save,checkedout,experiments,flex} --color=auto'
  #alias egrep='gegrep'
  alias diff='colordiff'
  alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  alias dev='ssh sjustin@ca1danube.sba.gov'

# Source plugins
  source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

 # Spaceship Prompt

  SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    host          # Hostname section
    dir           # Current directory section
    git           # Git section (git_branch + git_status)
    hg            # Mercurial section (hg_branch  + hg_status)
    package       # Package version
    node          # Node.js section
    ruby          # Ruby section
    elixir        # Elixir section
    xcode         # Xcode section
    swift         # Swift section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    haskell       # Haskell Stack section
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    dotnet        # .NET section
    ember         # Ember.js section
    kubecontext   # Kubectl context section
    terraform     # Terraform workspace section
    exec_time     # Execution time
    line_sep      # Line break
    time          # Time stamps section
    battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
  )
  export SPACESHIP_CHAR_SYMBOL='❯'
  export SPACESHIP_CHAR_SYMBOL_ROOT='#'
  export SPACESHIP_CHAR_SUFFIX=' '

  export SPACESHIP_USER_COLOR='magenta'
  export SPACESHIP_USER_PREFIX='as '
  export SPACESHIP_USER_SUFFIX=''

  export SPACESHIP_HOST_PREFIX='@'
  export SPACESHIP_HOST_COLOR_SSH='cyan'

  export SPACESHIP_DIR_COLOR='yellow'
  export SPACESHIP_DIR_PREFIX=''

  export SPACESHIP_TIME_SHOW=true
  export SPACESHIP_TIME_COLOR='white'
  export SPACESHIP_TIME_PREFIX=''
  export SPACESHIP_TIME_FORMAT='%D{%I:%M %p} %F{blue}%!%f'

  autoload -Uz promptinit; promptinit
  prompt spaceship
