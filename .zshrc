# ---------------------------------
# ⚡ Powerlevel10k Instant Prompt
# ---------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------
# 🌟 Personal Zsh Configuration
# -----------------------------

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load plugins after oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k theme directly from Homebrew
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# Load Powerlevel10k configuration if present
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -----------------------------
# 🧠 Quality-of-Life Settings
# -----------------------------

ENABLE_CORRECTION="true"
HYPHEN_INSENSITIVE="true"
CASE_SENSITIVE="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="false"
# Additional optional OMZ behaviors can be uncommented as needed:
# DISABLE_AUTO_TITLE="true"
# DISABLE_MAGIC_FUNCTIONS="true"

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# -----------------------------
# 🐍 Python Configuration
# -----------------------------
if command -v pyenv &>/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if command -v pyenv-virtualenv-init &>/dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# -----------------------------
# 🐹 Go Configuration
# -----------------------------
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
# ✨ Notes
# -----------------------------
# Run `p10k configure` to customize Powerlevel10k.
# Keep this file synced via GitHub dotfiles repo.

# -----------------------------
# ☕️ Startup Message
# -----------------------------
echo "Welcome, $(whoami)! ☀️ Ready to build something awesome."


# Homebrew (macOS + Linux)
if [[ -x /opt/homebrew/bin/brew ]]; then
  # macOS (Apple Silicon)
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  # macOS (Intel)
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  # Linuxbrew (Linux / WSL)
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
