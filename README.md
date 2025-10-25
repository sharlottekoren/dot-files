# Dot-Files

This repository contains my personal macOS configuration and development environment. It is designed to be portable, so I can quickly set up a new Mac with all my preferred tools, shell configurations, and VS Code settings.

## 🚀 Installation

1.  Clone this repository to your local machine.
2.  Run the main setup script:
    ```./setup.sh```

The script is automated and will perform the following steps:
*   Install Homebrew if it is not already present.
*   Install Oh My Zsh if it is not already present.   
*   Back up any existing `~/.zshrc` file and create a symlink to the `.zshrc` file in this repository.
*   Set up the Python environment by installing Python 3.12.6 with `pyenv` and setting it as the global default.
*   Create a `~/go/bin` directory for Go binaries.
*   Set Zsh as the default login shell.
*   Configure Visual Studio Code by copying the `settings.json` file and installing all extensions listed in `extensions.txt`.
    
After the script finishes, restart your terminal or run `exec zsh` to apply all changes.

## 💻 What's Included?

### 🐚 Shell: Zsh & Oh My Zsh

*   **Theme:** Powerlevel10k.
    
*   **Plugins:**
    
    *   git
        
    *   zsh-autosuggestions
        
    *   zsh-syntax-highlighting
        
*   **Settings:**
    
    *   Command auto-correction (ENABLE\_CORRECTION=true).
        
    *   Hyphen insensitivity (HYPHEN\_INSENSITIVE=true).
        
*   **Locale:**
    
    *   export LANG=en\_US.UTF-8
        
    *   export LC\_ALL=en\_US.UTF-8
        

### 📦 Homebrew Packages

The Brewfile installs a wide range of tools:

*   **Core CLI Tools:**
    
    *   git
        
    *   zsh
        
    *   fzf
        
    *   gh (GitHub CLI)
        
    *   wget
        
    *   htop
        
    *   jq (JSON parser)
        
*   **Developer Tools:**
    
    *   nvm
        
    *   go
        
    *   python
        
    *   pyenv
        
    *   pyenv-virtualenv
        
    *   golangci-lint
        
    *   pre-commit
        
    *   tree
        
*   **GUI Applications:**
    
    *   iterm2 (Terminal replacement)
        
    *   rectangle (Window snapping)
        
    *   dockdoor (Dock control)
        
    *   visual-studio-code
        
    *   google-chrome
        
    *   meetingbar (Menu bar meeting viewer)
        
*   **Fonts:**
    
    *   font-jetbrains-mono
        

### 🧠 Visual Studio Code

Configuration is managed via settings.json and the extensions.txt list.

*   **Theme:** Catppuccin Mocha theme and icons.
    
*   **Font:** JetBrains Mono is set for both the editor and the integrated terminal.
    
*   **Key Settings:**
    
    *   editor.formatOnSave: true
        
    *   files.autoSave: "onFocusChange"
        
    *   editor.tabSize: 2
        
    *   telemetry.telemetryLevel: "off" (Telemetry disabled)
        
*   **Extensions:**
    
    *   **Theme:** catppuccin.catppuccin-vsc
        
    *   **Languages:** ms-python.python, ms-python.debugpy, golang.go, ms-azuretools.vscode-docker
        
    *   **Productivity:** esbenp.prettier-vscode, formulahendry.code-runner, eamodio.gitlens