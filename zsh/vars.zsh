# export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

typeset -Uz path
path=($HOME/.dots/bin $HOME/epitheq/bin $HOME/.cargo/bin $HOME/.local/bin $path)
path+=(/root/.gem/ruby/2.6.0/bin)
path+=($HOME/.gem/ruby/2.6.0/bin)

typeset -Uz fpath
fpath+=($ZDATADIR/functions)

export WORDCHARS=''
export CLICOLOR=1

# export GDK_SCALE=2
# export GDK_DPI_SCALE=1.2

# colored-man-pages from gh/imkira
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
# export LESS_TERMCAP_us=$'\E[04;38;5;146m'

### HISTORY + SUBSTRING SEARCH ###
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh_history
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
