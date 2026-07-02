function update-dev-tools -d "Updates user-space development utilities"
    if command -q rustup
        rustup update
    else
        echo "[dotfiles] rustup has been updated"
    end

    if command -q fnm
        cargo install fnm
        fnm install --lts
    else
        echo "[dotfiles] fnm has been updated"
    end

    if command -q uv
        cargo install uv
    else
        echo "[dotfiles] uv has been updated"
    end

    if command -q zoxide
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    else
        echo "[dotfiles] zoxide has been updated"
    end

    echo ""
end
