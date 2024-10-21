# Dotfiles

This is the repository with all my system and home user configuration files.

Under the hood it uses nix, nix-darwin and home-manager to handle all my configurations since I use both MacOS and Linux distributions.

## Instructions

These are the steps to run in order to configure my machine.

### Dotfiles

First you need to download all the files from this repository and unzip them in your ~/dotfiles directory.

```bash
mkdir -p ~/dotfiles && curl -L https://github.com/alfonsfoubert/dotfiles/archive/refs/heads/main.zip -o ~/dotfiles/main.zip && unzip ~/dotfiles/main.zip -d ~/dotfiles && rm ~/dotfiles/main.zip
```

### Nix

```bash
sh <(curl -L https://nixos.org/nix/install)
```

### (Mac OS) Nix-Darwin

First install the binaries

```bash
nix run nix-darwin -- switch --flake ~/.config/nix-darwin
```
Then run the installation for all the system build

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin
```

### Home Manager

Install the binaries

```bash
nix run home-manager/master -- init --switch
```

Then run the installation for all the home build

```bash
home-manager switch
```

And you're done!
