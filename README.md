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


## Single user commands:

# Run from inside dotfiles direcrory:
```
cp ./.zshrc ~/
mkdir ~/.config
cp -r ./nvim ~/.config
```

```
[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

I dont think this is necessary anymore
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Suggested changes to new linux machine:

# Run from dotfiles directory:
```
sudo cp ./.zshrc /etc/skel/.zshrc
sudo mkdir /etc/skel/.config
sudo cp ./nvim /etc/skel/.config
```

## Neovim IDE/Editor

### Prerequisites:
[neovim < v0.11](https://github.com/neovim/neovim/blob/master/INSTALL.md)

Using appimage, curl URL may change, but should pull latest.
nvim file is moved to /usr/bin/nvim so its automatically available everywhere
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
sudo chmod u+x nvim-linux-x86_64.appimage
sudo mv ./nvim-linux-x86_64.appimage /usr/bin/nvim
```

git clone into ~/.config/nvim

you may need to create these directories

In order for neovim tools to install, you need the following packages (ubuntu)
(tools such as ruff, pyright etc)
```
sudo apt install python3.12-venv
sudo apt install npm
sudo apt install unzip
```

### Additional Requirements per-maybe:
uv package manager

```
curl -LsSf https://astral.sh/uv/install.sh | sh
OR
wget -qO- https://astral.sh/uv/install.sh | sh
```

OR CHECK DOCS:
[uv install docs](https://docs.astral.sh/uv/getting-started/installation/)
