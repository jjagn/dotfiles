# OMP
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export PATH=$PATH:$HOME/go/bin
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=50000
HISTSIZE=50000
setopt INC_APPEND_HISTORY     # Immediately append to history file.
setopt EXTENDED_HISTORY       # Record timestamp in history.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Dont write duplicate entries in the history file.
setopt SHARE_HISTORY          # Share history between all sessions.
unsetopt HIST_VERIFY          # Execute commands using history (e.g.: using !$) immediately

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# eza
alias ls="eza --icons=always"

#zoxide
eval "$(zoxide init zsh)"
alias cd="z"

export PATH=$PATH:/Users/jacksoncrawford/path

# git
alias gs='git status'
alias ga= 'git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git checkout main'
alias gd='git diff'
alias gdc='git diff --cached'
# [c]heck [o]ut
alias co='git checkout'
alias gbs='git switch'
alias gbc='git switch -c'
alias gbl='git branch --all'
alias gl='git log --oneline --graph --decorate --parents'
# [f]uzzy check[o]ut
fo() {
  git branch --no-color --sort=-committerdate --format='%(refname:short)' | fzf --header 'git checkout' | xargs git checkout
}
alias up='git push'
alias upf='git push --force'
alias pu='git pull'
alias pur='git pull --rebase'
alias fe='git fetch'
alias re='git rebase'
alias lr='git l -30'
alias cdr='cd $(git rev-parse --show-toplevel)' # cd to git Root
alias hs='git rev-parse --short HEAD'
alias hm='git log --format=%B -n 1 HEAD'

export QT_ROOT_DIR=/Users/jacksoncrawford/repos/Qt6.8.0/6.8.0/macos
export OPENSSL_ROOT_DIR=~/OpenSSL
export GIT_EXECUTABLE=git
export OPENSSL_ROOT_DIR_MACOS=~/Qt/Tools/openSsl/mac
export WC_VERSION_LABEL=Kowhai 

alias wcgadgettool='/Users/jacksoncrawford/repos/wc/build_make/tools/wcgadgettool.app/Contents/MacOS/wcgadgettool'

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
