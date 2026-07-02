function install-dev-tools -d "Installs useful development utilities"
    echo "[dotfiles] sudo permission is required to install packages. Please provide your user password."
    if not sudo -v
        echo "[dotfiles] user failed to authenticate, exiting..."
        return 1
    end

    read -P "[dotfiles] run this script interactively?" interactive_choice

    set -l PAC_FLAG
    set -l RUSTUP_FLAG

    if string match -qr '^[Yy]' $interactive_choice
        echo "[dotfiles] running script interactively..."
    else
        echo "[dotfiles] running script non-interactively..."
        set PAC_FLAG --noconfirm
        set RUSTUP_FLAG -y
    end

    if not command -q git
        echo "[dotfiles] git not found, bootstrapping git..."
        sudo pacman -S git $PAC_FLAG
    end

    if not command -q cargo
        echo "[dotfiles] cargo not found, bootstrapping rustup..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- $RUSTUP_FLAG
        fish_add_path -U "$HOME/.cargo/bin" "$HOME/.local/bin"
    end

    if not command -q paru
        sudo pacman -S --needed base-devel $PAC_FLAG
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si $PAC_FLAG
        cd ..
        rm -r paru/
    end

    if not command -q nvim
        echo "[dotfiles] neovim not found, bootstrapping neovim..."
        paru -S neovim-nightly-bin $PAC_FLAG
    end

    if not command -q fnm
        echo "[dotfiles] fnm not found, bootstrapping fnm"
        cargo install fnm
        fnm i --lts
        fnm default lts-latest
        fnm env --use-on-cd --shell fish | source
    end

    if not command -q uv
        echo "[dotfiles] uv not found, installing via cargo..."
        cargo install uv
    end

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

    if not command -q zoxide
        echo "[dotfiles] zoxide not found, bootstrapping zoxide..."
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
        zoxide init fish --cmd cd | source
    end
end
