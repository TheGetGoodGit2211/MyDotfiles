# Dotfiles
These are my personal dotfiles, made public for all to see and, let's be honest here, take the mick out of. Below are sections on each section of my dotfiles. I'll update these sections as I go along.

## Fish
Ok, so this is my shell config. This will also include any OS-specific stuff that's needed like in this case of CachyOS. This config basically just does some basic stuff, inst alling cargo if it isn't installed yet and after that installing UV. Prolly need to add a secondary install mathod for if Cargo can't install for whatever reason but this works for now.

## Kitty
Literally all I'm doing right now is getting the colorscheme tight. 'Nuff said.

## Neovim
Ok, now this one is a **doozy**. Yeah, this isn't one to take lightly. It's simple for now though. Here's the prerequisites that aren't already handled by the fish config.
- tree-sitter-cli - You really only need this for specifically treesitter so it can compile all the grammars. Just install this through cargo (which is already installed by the fish config), or use your preferred method. I don't know man, free will and stuff.
