# Starship prompt
eval "$(starship init zsh)"

# Completion
autoload -Uz compinit && compinit -C

# Word navigation with Ctrl+Arrow
bindkey '^[[1;5C' forward-word      # Ctrl+Right
bindkey '^[[1;5D' backward-word     # Ctrl+Left

# Alternative escape sequences for different terminals
bindkey '^[OC' forward-word         # Alt sequences
bindkey '^[OD' backward-word

# Word deletion
bindkey '^H' backward-kill-word     # Ctrl+Backspace
bindkey '^[[3;5~' kill-word         # Ctrl+Delete

# History search (type prefix, then Up/Down to filter)
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search   # Up
bindkey '^[[B' down-line-or-beginning-search # Down

# Command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
