source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias la='ls -la'
alias ll='ls -l'
alias g='git'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Environment Variables
export EDITOR=nvim  # or vim
export PAGER=less
export PATH="$HOME/.local/bin:$PATH"

# History
HISTSIZE=10000
HISTFILESIZE=20000
setopt histappend
setopt extended_history

# Autocompletion
autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ''
zstyle ':completion:*' list-dirs true
zstyle ':completion:*:*:git:*' script git

if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
