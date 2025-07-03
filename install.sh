#!/bin/bash
export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"

ln -sf "$PWD/ohmyposh" "$XDG_CONFIG_HOME"
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim

ln -sf "$PWD/.bash_profile" "$HOME"/.bash_profile
ln -sf "$PWD/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/.tmux.conf" "$HOME"/.tmux.conf

nix-env -iA nixpkgs.myPackages -f config.nix
