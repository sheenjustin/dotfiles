# Tutorial for using git to manage dotfiles
https://www.atlassian.com/git/tutorials/dotfiles

```
git clone --bare https://github.com/sheenjustin/dotfiles/ $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config submodule init
config submodule update
```
