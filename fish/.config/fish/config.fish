# source /usr/share/cachyos-fish-config/cachyos-config.fish

set -l cachy_cfg /usr/share/cachyos-fish-config/cachyos-config.fish
if test -f $cachy_cfg
    source $cachy_cfg
end

if not command -q cargo
    echo "[dotfiles] cargo not found, bootstrapping rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
end

if not command -q uv
    echo "[dotfiles] uv not found, installing via cargo..."
    cargo install uv
end

fish_add_path -U "$HOME/.cargo/bin" "$HOME/.local/bin"

set -l base_venv "$HOME/.venv/base"
if not test -d $base_venv
    echo "[dotfiles] base venv missing, creating with uv..."
    uv venv $base_venv
end

if test -f "$base_venv/bin/activate.fish"
    source "$base_venv/bin/activate.fish"
else
    echo "[dotfiles] Warning: base venv activation script missing"
end
