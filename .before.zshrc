export TERM="xterm-256color"
export LANG=en_GB.utf-8
export LC_ALL=en_GB.utf-8
export GPG_TTY=$(tty)

export STARSHIP_CONFIG=~/.dotfiles/starship.toml

eval "$(starship init zsh)"