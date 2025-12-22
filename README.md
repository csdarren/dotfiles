# dotfiles

Holding place for my dot files / configs. zshrc, wezterm, nvim, etc

# [WezTerm](https://wezterm.org/installation.html)

Download and run installer for wezterm.

Move .wezterm.lua into the users home directory (windows)

IMPORTANT: Make sure there is no wezterm.lua in the installation directory
(usually C:\Program Files\WezTerm)

NOTE: This config is setup to run WSL by default

### [JetBrainsMono-regular font](https://www.jetbrains.com/lp/mono/)

extract, and run: JetBrainsMono-2.304/fonts/ttf/JetBrainsMono-Regular.ttf (Should work on linux & windows)
NOTE: this font is required for proper icons in neovim

# [WSL (WINDOWS ONLY)](https://learn.microsoft.com/en-us/windows/wsl/install)  

```
wsl --install
```

# [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

Install:

```
sudo apt install zsh && \
chsh -s $(which zsh)
```

### [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/tree/master)

NOTE: Required for zsh plugins like syntax highlighting and autocomplete

Install:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
```

### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

NOTE: I dont think this is necessary anymore

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

# [neovim < v0.11](https://github.com/neovim/neovim/blob/master/INSTALL.md)

NOTE: In order for sudo nvim to use your setup,
you must place nvim folder in root,
see Multi-user / New device setup section below

Install:

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
sudo chmod u+x nvim-linux-x86_64.appimage
sudo mv ./nvim-linux-x86_64.appimage /usr/bin/nvim
sudo apt install python3.12-venv
sudo apt install npm
sudo apt install unzip
```

# Additional tools per-maybe

### [uv package manager for python](https://docs.astral.sh/uv/getting-started/installation/)

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

# Multi-user / New device setup

Run from dotfiles directory:

```
sudo cp ./.zshrc /etc/skel/.zshrc
sudo mkdir -p /etc/skel/.config && sudo cp -r ./nvim /etc/skel/.config
sudo mkdir -p /root/.config && sudo cp -r ./nvim /root/.config
```

# Single user setup

NOTE: This sets up just the current user

Run from dotfiles directory:

```
cp ./.zshrc ~/
mkdir ~/.config
cp -r ./nvim ~/.config
```
