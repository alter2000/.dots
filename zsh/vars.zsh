export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

typeset -U path
path+=($HOME/.local/bin $HOME/.cargo/bin)
fpath+=($ZDOTDIR/completions)

export WORDCHARS=''
export CLICOLOR=1

export LESS='--ignore-case --status-column --raw-control-chars --quiet --window=-3'
export LESSHISTFILE="$HOME/.cache/lesshst"
export PAGER='less'
export EDITOR='vim'
export VISUAL='vim'
export MAIL="$HOME/var/mail/main/INBOX"
export MAILPATH="$HOME/var/mail/main"
export ARCHFLAGS='-arch x86_64'
export MAKEFLAGS='-j3'

export XDG_DESKTOP_DIR="$HOME/misctodo"
export XDG_DOWNLOAD_DIR="$HOME/var/download"
export XDG_TEMPLATES_DIR="$HOME/static/templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/static/documents"
export XDG_MUSIC_DIR="$HOME/lfs/music"
export XDG_PICTURES_DIR="$HOME/lfs/img"
export XDG_VIDEOS_DIR="$HOME/lfs/video"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS=$HOME/.local/share/:/usr/local/share/:/usr/share/

export GIT_ASKPASS='pass Gits/github.com | head -1'
export GITHUB_USER='alter2000'
export QT_QPA_PLATFORMTHEME='qt5ct'

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
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( vi_mode status time )
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
POWERLEVEL9K_VI_INSERT_MODE_STRING="i"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="n"

### HISTORY + SUBSTRING SEARCH ###
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=black,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=black,fg=red,bold'
