git clone --bare https://github.com/sheenjustin/dotfiles/ $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config submodule update --init --recursive
