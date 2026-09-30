#!/bin/bash
set -e

echo "🍏 Starting macOS setup..."

# -----------------------------
# 1️⃣ Install Homebrew
# -----------------------------
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed."
fi

# Ensure Homebrew is in PATH for this script
eval "$(/opt/homebrew/bin/brew shellenv)"

# -----------------------------
# 2️⃣ Brewfile Installation
# -----------------------------
echo "📦 Installing packages from Brewfile..."
brew bundle --file="$(dirname "$0")/Brewfile"

# Ensure Homebrew is in PATH for this script
eval "$(/opt/homebrew/bin/brew shellenv)"

# -----------------------------
# 3️⃣ Zsh & Oh My Zsh
# -----------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "💻 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ Oh My Zsh already installed."
fi

# -----------------------------
# 4️⃣ Symlink Zsh Config
# -----------------------------
if [ -f "$HOME/.zshrc" ]; then
  echo "🧹 Backing up existing .zshrc..."
  mv ~/.zshrc ~/.zshrc.backup.$(date +%s)
fi

ln -sf "$(dirname "$0")/.zshrc" ~/.zshrc
echo "🔗 Linked .zshrc from dotfiles."

# -----------------------------
# 5️⃣ Language Environment Setup
# -----------------------------

echo "🐍 Setting up Python..."
if command -v pyenv &>/dev/null; then
  pyenv install -s 3.12.6
  pyenv global 3.12.6
fi

echo "🐹 Setting up Go workspace..."
mkdir -p "$HOME/go/bin"

# -----------------------------
# 💻 Set up Zsh as default shell
# -----------------------------
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "🐚 Setting Zsh as default shell..."
  chsh -s /bin/zsh
fi

# -----------------------------
# 🧠 VS Code Setup
# -----------------------------
echo "🧠 Setting up Visual Studio Code preferences..."
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE_USER_DIR"
cp "$(dirname "$0")/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"

if command -v code &>/dev/null; then
  echo "📦 Installing VS Code extensions..."
  cat "$(dirname "$0")/vscode/extensions.txt" | grep -v '^#' | xargs -L 1 code --install-extension
else
  echo "⚠️ VS Code CLI not found — open VS Code once, then run 'code --install-extension' manually."
fi

# -----------------------------
# 6️⃣ Powerlevel10k Setup
# -----------------------------
echo "🎨 Setting up Powerlevel10k..."

# Get Homebrew prefix (handles both Apple Silicon and Intel Macs)
HOMEBREW_PREFIX=$(brew --prefix)

# Link Powerlevel10k into Oh My Zsh custom themes
mkdir -p "$HOME/.oh-my-zsh/custom/themes"
ln -sf "$HOMEBREW_PREFIX/opt/powerlevel10k" "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
echo "✅ Powerlevel10k linked to Oh My Zsh."

echo "🗓️ Setting up MeetingBar (menu bar meeting viewer)..."
if command -v meetingbar &>/dev/null; then
  echo "✅ MeetingBar installed — you can enable it in System Settings → Login Items."
else
  echo "⚠️ MeetingBar not found; try running 'brew install meetingbar' manually."
fi

echo ""
echo "✨ All done!"
echo "🔄 Restart your terminal or run 'exec zsh' to apply changes."
echo ""
echo "📝 Next steps:"
echo "  1. Run: exec zsh"
echo "  2. Run: p10k configure"
echo "     (Follow the wizard to customize your prompt colors and style)"
