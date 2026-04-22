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

TODO:
1. Generate SSH Keys
2. Install Neovim
3. Install Rust
4. Add Modern Unix tools: https://github.com/ibraheemdev/modern-unix
5. Set up Firefox Tree Style Tabs: https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules#full-auto-showhide-theme

OPTIONAL:
1. Install Firefox-Nightly
2. Install AppManager https://github.com/kem-a/AppManager
3. Install Steam
