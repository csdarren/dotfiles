zstyle ':omz:update' mode auto # update automatically without asking

zstyle ':omz:update' frequency 14 # update frequency

ZSH_THEME="agnoster" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vi-mode
    zsh-syntax-highlighting
)

# Expose windows home directory from within WSL
export WIN_HOME="$(wslpath "$(cmd.exe /d C:\\ /c "echo %USERPROFILE%" 2>/dev/null | tr -d '\r')")"

# Ensure oh-my-zsh is loaded after plugins and theme
export ZSH="$HOME/.oh-my-zsh" # Path to your Oh My Zsh installation.
source $ZSH/oh-my-zsh.sh      # Activate oh-my-zsh
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
#
dot() {
    git -C ~/dotfiles "$@"
}

dotpull() {
    git pull
    git status
}

dotpush() {
    dot add .
    dot commit -m "Updated config"
    dot status

    read -q "REPLY?Push These Changes? (y/n) "

    if [[ "$REPLY" == "y" ]]; then
        dot push
    else
        echo "Aborted push."
    fi
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
