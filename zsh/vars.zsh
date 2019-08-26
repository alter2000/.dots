# PATH:
# (N-/): do not register if the directory does not exist
#
#  N   : NULL_GLOB option (ignore path if the path does not match the glob)
#  n   : Sort the output
#  [-1]: Select the last item in the array
#  -   : follow the symbol links
#  /   : ignore files
#  t   : tail of the path
# export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

typeset -Uz path
path=(
	${HOME}/.dots/bin
	${HOME}/epitheq/bin(N-/)
	${HOME}/.cargo/bin(N-/)
	${HOME}/.local/bin
	# /root/.gem/ruby/2.6.0/bin
	${GEM_HOME}/bin(N-/)
	$path
)
[[ -d /usr/local/bin ]] && path+=("/usr/local/bin")

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
export LESS_TERMCAP_us=$'\E[03;32m'

### HISTORY + SUBSTRING SEARCH ###
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh_history
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
