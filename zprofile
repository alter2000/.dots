typeset -U path
path=($HOME/.local/bin $HOME/.cargo/bin $path[@])
export fpath=(/home/alter2000/.zsh/completions/ $fpath)

export ZDOTDIR="$HOME/.zsh"
export ZDATADIR="$HOME/.zsh"
export WORDCHARS=''
export CLICOLOR=1
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='vim'
export VISUAL='vim'
export ARCHFLAGS='-arch x86_64'
export MAKEFLAGS='-j3'
export GEM_HOME=$HOME/.gem

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS=$HOME/.local/share/:/usr/local/share/:/usr/share/

export GITHUB_USER='alter2000'
export QT_QPA_PLATFORMTHEME=qt5ct
export VMAIL_HTML_PART_READER='elinks -dump'

export ATOM_HOME="$XDG_DATA_HOME/atom"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle 
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export NVM_DIR="$XDG_DATA_HOME"/nvm
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat

[[ -f ~/.zsh/.zshrc ]] && source ~/.zsh/.zshrc
