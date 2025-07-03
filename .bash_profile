# Bash profile equivalent to zprofile

# Default programs
export EDITOR="nvim"

# Program Settings
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# Source bashrc if it exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

