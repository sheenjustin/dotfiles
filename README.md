https://www.atlassian.com/git/tutorials/dotfiles

Prerequisites:

Git and zsh installed. User shell changed to zsh.

```
sudo apt install git zsh
chsh -s /usr/bin/zsh
```

Install:
```
wget https://raw.githubusercontent.com/sheenjustin/dotfiles/master/setup.zsh

zsh ./setup.zsh
```

setup.sh:
```
git clone --bare https://github.com/sheenjustin/dotfiles/ $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config submodule init
config submodule update
```
