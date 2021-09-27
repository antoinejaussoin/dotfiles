POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=$P9_FOREGROUND
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=$P9_FOREGROUND
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND=$P9_FOREGROUND
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND=$P9_FOREGROUND
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND=$P9_FOREGROUND
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=$P9_BACKGROUND
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=$P9_BACKGROUND
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND=$P9_BACKGROUND
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND=$P9_BACKGROUND
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND=$P9_BACKGROUND

alias ll="ls -lah"
alias df='df -x"squashfs"'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gs="git status"
alias gsu="git stash save --include-untracked"
alias gfom="git fetch origin master:master"
alias gfod="git fetch origin develop:develop"
alias gclean="git branch | grep -v \"*\|master\|develop\|release\" | xargs git branch -D"
alias glocal="git branch | grep -v \"*\|master\|develop\|release\""
alias gcheck="git log --branches --not --remotes"
alias grtm="git rebase --onto master"
alias grtd="git rebase --onto develop"
alias gfp="git push -f"
alias rename_scan="find . -exec rename -n 's/(\d\d\d\d)_(\d\d)_(\d\d)_\d\d_\d\d_\d\d(.*)?/\$1-\$2-\$3\?\$4/g' {} +"
alias rename_scan_go="find . -exec rename 's/(\d\d\d\d)_(\d\d)_(\d\d)_\d\d_\d\d_\d\d(.*)?/\$1-\$2-\$3\?\$4/g' {} +"
alias mkc="microk8s.kubectl"
alias refzsh="source ~/.zshrc"

# Bazel autocompletion
fpath[1,0]=~/.zsh/completion/
mkdir -p ~/.zsh/cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
#compinit

# find . -exec rename -n 's/(\d\d\d\d-\d\d-\d\d)\*(.*)/$1?$2/g' {} +

dstop() {
  docker rm $(docker stop $(docker ps -a -q --filter ancestor="$1" --format="{{.ID}}"))
}

# if command -v keychain; then
#   eval `keychain --eval --agents ssh id_rsa`
# fi

# Mac only
wayvevpn() {
  sudo mv /etc/ppp/options.backup /etc/ppp/options
  networksetup -connectpppoeservice "Wayve VPN"
}

# Mac only
frvpn() {
  sudo mv /etc/ppp/options /etc/ppp/options.backup
  networksetup -connectpppoeservice "VPN (FR)"
}


# NVM
if test -f ~/.zsh-nvm/zsh-nvm.plugin.zsh; then
  export NVM_LAZY_LOAD=true
  source ~/.zsh-nvm/zsh-nvm.plugin.zsh
fi

# Disk Backup
disk_backup_mac() {
  rsync -aEv --delete ~/Downloads /Volumes/Backup
  rsync -aEv --delete ~/Data /Volumes/Backup
  rsync -aEv --delete ~/dev /Volumes/Backup
  rsync -aEv --delete ~/Pictures /Volumes/Backup
  rsync -aEv --delete ~/Music /Volumes/Backup
  rsync -aEv --delete ~/Movies /Volumes/Backup
}

# Asynchronously fetches new version of the dotfiles
(cd ~/.dotfiles && nohup git pull > /dev/null 2>&1 &)
