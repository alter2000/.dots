[[ $- != *i* ]] && return

export ZDOTDIR="$HOME/.zsh"
export ZDATADIR="~/.zsh"

source $ZDOTDIR/vars.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/zsh-history-substring-search.zsh
source $ZDOTDIR/powerlevel9k/powerlevel9k.zsh-theme
source $ZDOTDIR/completions.zsh

# Plugins
source $ZDOTDIR/plugins/extract.plugin.zsh
source $ZDOTDIR/plugins/git.plugin.zsh
# source $ZDOTDIR/plugins/vi-mode.plugin.zsh

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/options.zsh
source $ZDOTDIR/kbd.zsh

zle -N rationalize-dot
bindkey . rationalize-dot
bindkey -M isearch . self-insert # history search fix

### EYECANDY ###
# might prep homemade prompt to learn some shell, but powerlevel9k is _soo_ good
# anyway, this may be a different file
#autoload -U colors && colors
#autoload -U promptinit && promptinit
# (cat ~/.cache/wal/sequences)
