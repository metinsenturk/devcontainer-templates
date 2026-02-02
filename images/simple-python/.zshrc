# Starship prompt
eval "$(starship init zsh)"

# Word navigation with Ctrl+Arrow
bindkey '^[[1;5C' forward-word      # Ctrl+Right
bindkey '^[[1;5D' backward-word     # Ctrl+Left

# Alternative escape sequences for different terminals
bindkey '^[OC' forward-word         # Alt sequences
bindkey '^[OD' backward-word
bindkey '^[[C' forward-word
bindkey '^[[D' backward-word

# Word deletion
bindkey '^H' backward-kill-word     # Ctrl+Backspace
bindkey '^[[3;5~' kill-word         # Ctrl+Delete

# Command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
