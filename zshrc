[[ $- != *i* ]] && return

export ZDATADIR="$HOME/.zsh"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDATADIR/zsh-history-substring-search.zsh
source $ZDATADIR/powerlevel9k/powerlevel9k.zsh-theme
source $ZDATADIR/completions.zsh
source $ZDATADIR/vars.zsh

# Plugins
source $ZDATADIR/plugins/extract.plugin.zsh
source $ZDATADIR/plugins/git.plugin.zsh
# source $ZDATADIR/plugins/vi-mode.plugin.zsh

source $ZDATADIR/aliases.zsh
source $ZDATADIR/functions.zsh
source $ZDATADIR/options.zsh
source $ZDATADIR/kbd.zsh

zle -N rationalize-dot
bindkey . rationalize-dot
bindkey -M isearch . self-insert # history search fix

### EYECANDY ###
# might prep homemade prompt to learn some shell, but powerlevel9k is _soo_ good
# anyway, this may be a different file
#autoload -U colors && colors
#autoload -U promptinit && promptinit
# (cat ~/.cache/wal/sequences)
