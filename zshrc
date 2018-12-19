[[ $- != *i* ]] && return

export ZDATADIR="$HOME/.zsh"

source $ZDATADIR/plugins/zsh-history-substring-search.zsh
# source $ZDATADIR/powerlevel9k/powerlevel9k.zsh-theme
source $ZDATADIR/completions.zsh
source $ZDATADIR/vars.zsh

# Plugins
source $ZDATADIR/plugins/extract.plugin.zsh
# source $ZDATADIR/plugins/git.plugin.zsh
source $ZDATADIR/plugins/vi-mode.plugin.zsh

source $ZDATADIR/aliases.zsh
source $ZDATADIR/functions/commands.zsh
source $ZDATADIR/functions/background.zsh
source $ZDATADIR/options.zsh
source $ZDATADIR/kbd.zsh
source $ZDATADIR/prompt.zsh

zle -N rationalize-dot
bindkey . rationalize-dot
bindkey -M isearch . self-insert # history search fix
