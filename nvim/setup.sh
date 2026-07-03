#!/bin/bash
set -e

# --- 1. Python 3 Check ---
if ! command -v python3 &> /dev/null; then
    echo "[dotfiles] Python 3 not found. Installing via pacman..."
    sudo pacman -S --needed --noconfirm python
else
    echo "[dotfiles] Python 3 is already installed."
fi

# --- 2. Node.js / NVM Check ---
if command -v node &> /dev/null; then
    echo "[dotfiles] Node.js is already installed. Skipping NVM."
else
    echo "[dotfiles] Node.js not found. Installing NVM..."
    
    # Fetch and run the NVM installer
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash

    # Load NVM into this running session so we can use it immediately
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"

    # Install and set LTS Node as default
    nvm install --lts
    nvm use --lts
    nvm alias default 'lts/*'

    # Write NVM to .bashrc if it isn't already there
    if ! grep -q "NVM_DIR" "$HOME/.bashrc"; then
        echo "[dotfiles] Appending NVM config to ~/.bashrc..."
        cat << 'EOF' >> "$HOME/.bashrc"

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF
    fi
fi
