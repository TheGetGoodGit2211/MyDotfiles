function update-dev-tools -d "Updates user-space development utilities"
    if command -q rustup
        rustup update
        echo "[dotfiles] rustup has been updated"
    else
        echo "[dotfiles] rustup not found, skipping"
    end

    if command -q fnm
        cargo install fnm
        fnm install --lts
        echo "[dotfiles] fnm has been updated"
    else
        echo "[dotfiles] fnm not found, skipping"
    end

    if command -q uv
        cargo install uv
        echo "[dotfiles] uv has been updated"
    else
        echo "[dotfiles] uv not found, skipping"
    end

    if command -q zoxide
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
        echo "[dotfiles] zoxide has been updated"
    else
        echo "[dotfiles] zoxide not found, skipping"
    end

    echo "[dotfiles] tools updated where possible"
end
