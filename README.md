https://www.atlassian.com/git/tutorials/dotfiles

Prerequisites:

Zsh, Git, and cURL installed. User shell changed to zsh.

```sh
sudo apt install zsh git curl
chsh -s $(which zsh)
```

Install:
```sh
curl https://raw.githubusercontent.com/sheenjustin/dotfiles/master/.config/zsh/setup.zsh | zsh
```

setup.zsh:
```sh
git clone --bare https://github.com/sheenjustin/dotfiles/ ${HOME}/.cfg
alias config='git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}'
config checkout
```
