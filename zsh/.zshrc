# keep PATH entries unique across nested shells / re-sourcing
typeset -U path PATH

# OMP
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
fi

export EDITOR=nvim

# PATH
path=("$HOME/.local/bin" $path "$HOME/path")
[[ -d $HOME/go/bin ]] && path+=("$HOME/go/bin")

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# history setup (atuin is primary; keep plain zsh history from being truncated)
SAVEHIST=50000
HISTSIZE=50000
setopt HIST_IGNORE_SPACE      # Dont record an entry starting with a space.

# completion using arrow keys (based on history)
# bindkey '^[[A' history-search-backward
# bindkey '^[[B' history-search-forward

# eza
alias ls="eza --icons=auto"

# git
alias gs='git status'
alias ga='git add'
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
alias gf='git fetch'
alias re='git rebase'
alias lr='git l -30'
alias cdr='cd $(git rev-parse --show-toplevel)' # cd to git Root
alias hs='git rev-parse --short HEAD'
alias hm='git log --format=%B -n 1 HEAD'

export GIT_EXECUTABLE=git

alias c='clear'
alias sz='source ~/.zshrc'

# Added by LM Studio CLI (lms)
path+=("$HOME/.lmstudio/bin")
# End of LM Studio CLI section

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
autoload -Uz compinit && compinit

# must come after all widgets are defined
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide must be initialized last
eval "$(zoxide init zsh)"
alias cd="z"
