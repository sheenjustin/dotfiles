https://www.atlassian.com/git/tutorials/dotfiles

Prerequisites:

Git and zsh installed. User shell changed to zsh.

```
sudo apt install git zsh
chsh -s $(which zsh)
```

Install:
```
curl https://raw.githubusercontent.com/sheenjustin/dotfiles/master/.config/zsh/setup.zsh | zsh
```

setup.zsh:
```
git clone --bare https://github.com/sheenjustin/dotfiles/ $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config submodule update --init --recursive
```
