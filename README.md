# 🧩 Dot-Files

This is my personal macOS development environment setup.

This repo automates setting up your terminal, shell, languages, and VS Code environment in one go.

## 🚀 Features

* **Zsh + Powerlevel10k** — beautiful, fast, and functional shell prompt.
* **Oh My Zsh plugins** — `git`, `zsh-autosuggestions`, and `zsh-syntax-highlighting`.
* **VS Code setup** — automatically installs extensions and applies a custom theme/config.
* **Language support** — Python (via `pyenv`) and Go, with ready-made shortcuts and aliases.
* **Homebrew automation** — installs all dependencies from the Brewfile.

## 🧰 What’s Included
| **File**                                             | **Description**                                                              |
| -------------------------------------------------- | ------------------------------------------------------------------------ |
| [`setup.sh`](./setup.sh)                           | Main setup script to install everything automatically.                   |
| [`Brewfile`](./Brewfile)                           | Homebrew bundle list for macOS apps and CLI tools.                       |
| [`.zshrc`](./.zshrc)                               | Customized Zsh configuration (Powerlevel10k, aliases, language setup).   |
| [`vscode/settings.json`](./vscode/settings.json)   | Preconfigured VS Code settings (Catppuccin theme, JetBrains Mono, etc.). |
| [`vscode/extensions.txt`](./vscode/extensions.txt) | List of VS Code extensions to be auto-installed.                         |

## 🪄 Installation

1. Clone the repository
```bash
git clone https://github.com/<your-username>/Dot-Files.git ~/Dot-Files
cd ~/Dot-Files
```

2. Run the setup script
```bash
chmod +x setup.sh
./setup.sh
```

This will:
* Install Homebrew (if missing)
* Install all packages from the `Brewfile`
* Install Oh My Zsh and Powerlevel10k
* Set up the `.zshrc`
* Configure Python (via `pyenv`) and Go
* Set up VS Code settings and extensions

## ⚙️ Zsh Features

* **Theme**: Powerlevel10k
* **Plugins**: `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`
* Aliases:
    ```bash
    cls          → clear
    ll           → ls -lh
    la           → ls -lha
    zshconfig    → code ~/.zshrc
    reloadzsh    → source ~/.zshrc
    venv         → create and activate Python venv
    pipup        → upgrade pip, setuptools, wheel
    gorun        → go run .
    gobuild      → go build
    gotest       → go test ./...
    ```

## 🧠 VS Code Configuration

### Theme & Appearance

* **Colour theme**: Catppuccin Mocha
* **Font**: JetBrains Mono
* **Auto-save on focus change**

### Extensions

* Python & Go language support
* Prettier, Code Runner, and GitLens for productivity (See ./vscode/extensions.txt for the full list.)

## 🧩 Customization

* Modify .zshrc and run reloadzsh to apply changes.
* To reconfigure Powerlevel10k:
```bash
p10k configure
```
* To add apps, edit the `Brewfile` and rerun:
```bash
brew bundle --file=~/Dot-Files/Brewfile
```

## 🧩 Example Startup Message

When you launch a new terminal session:
```css
Welcome, <your-username>! ☀️ Ready to build something awesome.
```