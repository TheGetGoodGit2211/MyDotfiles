set -l cachy_cfg /usr/share/cachyos-fish-config/cachyos-config.fish
if test -f $cachy_cfg
    source $cachy_cfg
end

if command -q cargo
    fish_add_path -U "$HOME/.cargo/bin" "$HOME/.local/bin"
end

if command -q fnm
    fnm env --use-on-cd --shell fish | source
end

if command -q zoxide
    zoxide init fish --cmd cd | source
end
