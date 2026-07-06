#!/bin/bash
set -e

# --- 1. System Dependencies (Pacman handles the checks natively) ---
echo "[dotfiles] Ensuring system dependencies are installed..."
sudo pacman -S --needed --noconfirm \
    base-devel \
    tree-sitter-cli \
    ripgrep \
    fd \
    unzip \
    git \
    curl \
    python

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

    # --- 2a. Write NVM config to every installed POSIX-style shell ---
    # (fish uses fnm + a separate dev-tools function, so it's not handled here.)
    # Keyed by shell binary name so we only touch configs for shells that are
    # actually installed -- not just ones that happen to already have an rc file.
    declare -A SHELL_RC=(
        [bash]="$HOME/.bashrc"
        [zsh]="$HOME/.zshrc"
        [ksh]="$HOME/.kshrc"
    )

    NVM_BLOCK='# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'

    for shell in "${!SHELL_RC[@]}"; do
        if command -v "$shell" &> /dev/null; then
            rc="${SHELL_RC[$shell]}"

            # Create the rc file if the shell is installed but has never
            # been run/configured yet.
            if [ ! -f "$rc" ]; then
                echo "[dotfiles] $shell is installed but $rc doesn't exist yet, creating it..."
                touch "$rc"
            fi

            if ! grep -q "NVM_DIR" "$rc"; then
                echo "[dotfiles] Appending NVM config to $rc..."
                printf '\n%s\n' "$NVM_BLOCK" >> "$rc"
            else
                echo "[dotfiles] NVM config already present in $rc, skipping."
            fi
        fi
    done
fi

echo "[dotfiles] All Neovim environment prerequisites are met!"
