git clone --bare https://github.com/sheenjustin/dotfiles/ ${HOME}/.cfg
alias config='git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}'
config checkout
