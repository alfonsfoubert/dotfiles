# Bash configuration for bash environments
export TERM=screen-256color
export COLORTERM=truecolor

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# History configuration
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTFILE=~/.bash_history
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s cmdhist

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Aliases
alias ..='cd ..'
alias eza='eza --icons auto --git'
alias la='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias ls=eza
alias lt='eza --tree'
alias top=btop
alias vim='nvim'
alias vi='nvim'

# Shell integrations
eval "$(fzf --bash)"
eval "$(zoxide init --cmd z bash)"

# Prompt setup (oh-my-posh)
if command -v oh-my-posh >/dev/null 2>&1; then
  eval "$(oh-my-posh init bash --config $HOME/.config/ohmyposh/zen.toml)"
fi

# Enable vi mode for bash
set -o vi

# Case-insensitive completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
