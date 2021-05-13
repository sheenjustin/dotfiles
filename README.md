https://www.atlassian.com/git/tutorials/dotfiles

```
sudo apt install git
sudo apt install zsh
chsh -s /usr/bin/zsh

wget https://raw.githubusercontent.com/sheenjustin/dotfiles/master/setup.sh

zsh ./setup.sh
```

```
git clone --bare https://github.com/sheenjustin/dotfiles/ $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config submodule init
config submodule update
```
