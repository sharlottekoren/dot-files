# -----------------------------
# 🌟 Personal Zsh Configuration
# -----------------------------

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration (Powerlevel10k)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins — efficient but fast
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k configuration if present
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -----------------------------
# 🧠 Quality-of-Life Settings
# -----------------------------Æ

ENABLE_CORRECTION="true"
HYPHEN_INSENSITIVE="true"

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# -----------------------------
# 🐍 Python Configuration
# -----------------------------

# Use pyenv for managing Python versions
if command -v pyenv &>/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Optional: automatically activate virtualenvs
if command -v pyenv-virtualenv-init &>/dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# -----------------------------
# 🐹 Go Configuration
# -----------------------------

# Set up Go paths
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"

# -----------------------------
# 🪄 Aliases
# -----------------------------

alias cls="clear"
alias ll="ls -lh"
alias la="ls -lha"
alias zshconfig="code ~/.zshrc"
alias reloadzsh="source ~/.zshrc"

# Python shortcuts
alias venv="python3 -m venv venv && source venv/bin/activate"
alias pipup="pip install --upgrade pip setuptools wheel"

# Go shortcuts
alias gorun="go run ."
alias gobuild="go build"
alias gotest="go test ./..."

# -----------------------------
# 🧰 Optional Paths
# -----------------------------
# export EDITOR="code"

# -----------------------------
# ✨ Notes
# -----------------------------
# Run `p10k configure` to customize Powerlevel10k.
# MeetingBar can be launched from Raycast or macOS Login Items.
# Keep this file synced via GitHub dotfiles repo.
