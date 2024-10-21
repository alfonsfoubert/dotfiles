# Profile file. Runs on login. Environment variables are set here.

# Adds `~/.local/bin`to $PATH
export PATH="$PATH:$HOME/.local/bin"

# Default programs:
export EDITOR="nvim"
export BROWSER="zen"
export READER="zhatura"
export FILE="lf"
export PASSWORD_STORE_DIR="$HOME/.local/share/pass"

# ~/ Clean-up:
export NOTMUCH_CONFIG="$HOME/.config/notmuch/"

# Other program settings:
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
