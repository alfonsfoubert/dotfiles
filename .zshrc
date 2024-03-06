# History Management
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY


# Starship is a minimalistic themed prompt
eval "$(starship init zsh)"

# Zoxide is a smarter cd command
eval "$(zoxide init --cmd cd zsh)"

# Exa is a better ls command
alias ls="exa" 
alias ll="exa -lh"
alias tree="exa --tree"

# Bat is a better cat command
# alias cat="bat"

# Fzf is a better find command
alias ff="fzf"

# Btop is a better top command
alias top="btop"

# Muscle memory aliases for Neovim
alias vi="nvim"
alias vim="nvim"

# Neovim config
vv() {
    # Assumes all configs exist in directories named ~/.config/nvim-*
    local config=$(fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)

  # If I exit fzf without selecting a config, don't open Neovim
  [[ -z $config ]] && echo "No config selected" && return

  # Open Neovim with the selected config
  NVIM_APPNAME=$(basename $config) nvim
}

# Go path
export PATH=~/go/bin:$PATH

# Taskwarrior aliases
alias project='basename "$(pwd)"'

