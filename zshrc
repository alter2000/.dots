[[ $- != *i* ]] && return

export ZDATADIR="$HOME/.zsh"

source $ZDATADIR/plugins/zsh-history-substring-search.zsh
# source $ZDATADIR/powerlevel9k/powerlevel9k.zsh-theme
source $ZDATADIR/completions.zsh
source $ZDATADIR/vars.zsh

# Plugins
source $ZDATADIR/plugins/extract.plugin.zsh
# source $ZDATADIR/plugins/git.plugin.zsh
# source $ZDATADIR/plugins/vi-mode.plugin.zsh

source $ZDATADIR/aliases.zsh
source $ZDATADIR/functions.zsh
source $ZDATADIR/options.zsh
source $ZDATADIR/kbd.zsh
source $ZDATADIR/prompt.zsh

zle -N rationalize-dot
bindkey . rationalize-dot
bindkey -M isearch . self-insert # history search fix

PATH="/home/alter2000/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/alter2000/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/alter2000/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/alter2000/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/alter2000/perl5"; export PERL_MM_OPT;
