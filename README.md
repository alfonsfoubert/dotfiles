# Devcontainer Dotfiles

A comprehensive dotfiles configuration designed for development containers, featuring Neovim, tmux, bash/zsh compatibility, and Nix package management.

## Features

- **Neovim**: Modern Vim configuration with LazyVim plugin manager
- **Tmux**: Terminal multiplexer with vim-style navigation and catppuccin theme
- **Shell Configuration**: Both bash and zsh profiles with modern CLI tools
- **Nix Package Management**: Declarative package management for consistent environments
- **Git Configuration**: Pre-configured Git settings with SSH URL rewriting

## Quick Start

1. Clone this repository:
```bash
git clone <repository-url> ~/.dotfiles
cd ~/.dotfiles
```

2. Run the installation script:
```bash
./install.sh
```

3. Install Nix packages:
```bash
nix-env -iA nixpkgs.myPackages
```

## What's Included

### Core Tools (via Nix)
- **neovim** - Modern text editor
- **tmux** - Terminal multiplexer
- **go** - Go programming language
- **fd** - Fast file finder
- **ripgrep** - Fast text search
- **fzf** - Fuzzy finder
- **lazygit** - Git TUI
- **eza** - Modern ls replacement
- **btop** - Resource monitor
- **zoxide** - Smart cd command
- **oh-my-posh** - Shell prompt

### Configuration Files

#### Neovim (`nvim/`)
- **init.lua**: Main configuration entry point
- **lazy.lua**: LazyVim plugin manager setup
- **plugins/**: Custom plugin configurations
- **stylua.toml**: Lua formatter configuration

#### Shell Configuration
- **.bash_profile**: Bash login shell configuration
- **.bashrc**: Bash interactive shell configuration  
- **.zprofile**: Zsh login shell configuration

#### Terminal & Git
- **.tmux**: Tmux configuration with vim bindings
- **.vimrc**: Fallback Vim configuration
- **.gitconfig**: Git user settings and URL rewrites

## Key Features

### Neovim Setup
- LazyVim distribution for modern Neovim experience
- Automatic plugin management with lazy.nvim
- Tokyo Night color scheme
- Performance optimizations

### Tmux Configuration
- **Prefix**: `Ctrl-Space` (instead of Ctrl-b)
- **Vim-style navigation**: `h/j/k/l` for pane selection
- **Mouse support** enabled
- **Catppuccin mocha theme**
- **Plugin manager**: TPM with sensible defaults

### Shell Enhancements
- **History**: Enhanced with 5000 entries and deduplication
- **Aliases**: Modern replacements (eza for ls, btop for top)
- **Vi mode**: Enabled for command line editing
- **Smart completion**: Case-insensitive with bash-completion
- **Integrations**: fzf, zoxide, and oh-my-posh

### Development Environment
- **Go**: Configured with proper GOROOT and GOPATH
- **Editor**: Neovim set as default editor
- **Path**: Enhanced with local bins and Go tools

## Installation Details

The `install.sh` script:
1. Creates `~/.config` directory structure
2. Symlinks configuration files to appropriate locations
3. Sets up Nix package configuration
4. Installs the custom package bundle

### Manual Installation

If you prefer manual setup:

```bash
# Create config directories
mkdir -p ~/.config/nixpkgs

# Symlink configurations
ln -sf "$PWD/nvim" ~/.config/nvim
ln -sf "$PWD/.bash_profile" ~/.config/.bash_profile
ln -sf "$PWD/.bashrc" ~/.config/.bashrc
ln -sf "$PWD/.tmux" ~/.config/.tmux
ln -sf "$PWD/config.nix" ~/.config/nixpkgs/config.nix
```

## Customization

### Adding New Packages
Edit `config.nix` and add packages to the `paths` array, then reinstall:
```bash
nix-env -iA nixpkgs.myPackages
```

### Neovim Plugins
Add new plugins in `nvim/lua/plugins/` directory following LazyVim conventions.

### Shell Aliases
Modify `.bashrc` or `.zprofile` to add custom aliases and functions.

## Compatibility

- **Containers**: Designed for development containers and devcontainers
- **OS**: Works on Linux and macOS
- **Shells**: Compatible with both bash and zsh
- **Nix**: Requires Nix package manager

## Dependencies

- **Nix package manager** - For declarative package management
- **Git** - For version control and URL rewrites
- **Bash/Zsh** - Shell environments

## License

This dotfiles configuration is provided as-is for personal and educational use.