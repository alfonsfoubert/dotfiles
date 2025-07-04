#!/bin/bash

set -euo pipefail

export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CONFIG_HOME"/nixpkgs

ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/ohmyposh" "$XDG_CONFIG_HOME"/ohmyposh

ln -sf "$PWD/.bash_profile" "$HOME"/.bash_profile
ln -sf "$PWD/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/.tmux.conf" "$HOME"/.tmux.conf

ln -sf "$PWD/config.nix" "$XDG_CONFIG_HOME"/nixpkgs/config.nix

if command -v nix-env >/dev/null 2>&1; then
  nix-env -iA nixpkgs.myPackages || true
else
  echo "info: nix not available yet; skipping personal package install"
fi

if command -v direnv >/dev/null 2>&1; then
  direnv allow
fi
