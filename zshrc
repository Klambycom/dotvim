source ~/.zsh/checks.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/change-terminal-name.zsh
#source ~/.bin/tmuxinator.zsh

# Plugin
source ~/.zsh/colored-man.zsh
source ~/.zsh/vi-mode.zsh # I think bindkey -v is set somewhere else too, need to remove that.

setopt correct

# ls colors
#export LSCOLORS="dxfxcxdxbxegedabagacad"
#ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

# History
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # No duplicated entries
setopt hist_ignore_space # Dont save if space before command
setopt append_history # Append to history, rather than replace it. All zsh sessions have the same history.

# Advandec Tab-completion (e.g. ls -<tab>)
autoload -U compinit
compinit
#zstyle ':completion:*:descriptions' format '%U%B%d%b%u' # Don't know I like this
#zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b' # Don't know I like this

# Tab completion for ../
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# Search history with ctrl+r
bindkey '^R' history-incremental-search-backward

alias server='python -m SimpleHTTPServer'

alias yolo='sudo'

# To have launchd start redis at login:
#     ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
# Then to load redis now:
#     launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
# Or, if you don't want/need launchctl, you can just run:
#     redis-server /usr/local/etc/redis.conf
alias start-redis='redis-server /usr/local/etc/redis.conf'

# reattach-to-user-namespace is needed because of macOS sierra
alias vim='reattach-to-user-namespace vim'


#Dependencies will be installed to:
#  $HOME/.m2/repository
#To play around with Clojure run `lein repl` or `lein help`.
#
#Bash completion has been installed to:
#  /usr/local/etc/bash_completion.d
#
#zsh completion has been installed to:
#  /usr/local/share/zsh/site-functions

# added by travis gem
[ -f /Users/christian/.travis/travis.sh ] && source /Users/christian/.travis/travis.sh


# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# php-version
source $(brew --prefix php-version)/php-version.sh && php-version 5
