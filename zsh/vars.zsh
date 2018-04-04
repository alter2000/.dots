export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

typeset -U path
path+=($HOME/.local/bin $HOME/.cargo/bin)

export ZDOTDIR="~/.zsh"
export ZDATADIR="~/.zsh"
export WORDCHARS=''
export CLICOLOR=1

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='vim'
export VISUAL='vim'
export ARCHFLAGS='-arch x86_64'
export MAKEFLAGS='-j3'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS=$HOME/.local/share/:/usr/local/share/:/usr/share/

export GIT_ASKPASS='pass Gits/github.com | head -1'
export GITHUB_USER='alter2000'
export QT_QPA_PLATFORMTHEME=qt5ct
export VMAIL_HTML_PART_READER='elinks -dump'

export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export GEM_HOME="$HOME/.gem"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export ATOM_HOME="$XDG_DATA_HOME/atom"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export NVM_DIR="$XDG_DATA_HOME"/nvm
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat

export TERMINAL=termite
export BROWSER=firefox

# colored-man-pages from gh/imkira
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;33;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

### POWERLEVEL9K ###
DEFAULT_USER="alter2000"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( background_jobs dir vcs custom_wifi_signal )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( status battery time )
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=30
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_STATUS_HIDE_SIGNAME=true
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="p9k_wifi_signal"

### HISTORY ###
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

