export TERM="xterm-256color"
export LANG=en_GB.utf-8
export LC_ALL=en_GB.utf-8
export GPG_TTY=$(tty)

export STARSHIP_CONFIG=~/.dotfiles/starship.toml

eval "$(starship init zsh)"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

# Bind up/down arrows to search history starting with current input
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward