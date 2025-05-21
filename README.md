# dotfiles
Holding place for my dot files / configs. zshrc, wezterm, nvim, etc

## Wezterm terminal

### Prerequisites:
[WezTerm](https://wezterm.org/installation.html)

[JetBrainsMono-regular font](https://www.jetbrains.com/lp/mono/) Must download and install this font
extract, then: JetBrainsMono-2.304/fonts/ttf/JetBrainsMono-Regular.ttf <- Run this, should work on both windows and linux

git clone wezterm.lua into the same directory as the wezterm executable

## WSL2 if windows, skip to next # if on linux etc
### NOTE: wezterm.lua is setup to use wsl by default and will throw errors without it

[WSL](https://learn.microsoft.com/en-us/windows/wsl/install)  
CMD PROMPT: ```wsl --install```

## .zshrc shell

### Prerequisites:
[zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

```
sudo apt install zsh && \
chsh -s $(which zsh)
```

[ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/tree/master)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
```

git clone into ~/.zshrc

## Neovim IDE/Editor
### NOTE: ADD PPA REPO BEFORE installing! Otherwise you will get outdated neovim

### Prerequisites:
[neovim < v0.11](https://github.com/neovim/neovim/blob/master/INSTALL.md)

```
sudo add-apt-repository ppa:neovim-ppa/stable && \
sudo apt update && \
sudo apt upgrade && \
sudo apt install neovim
```

git clone into ~/.config/nvim

you may need to create these directories

