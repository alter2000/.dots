[[ -f $ZDOTDIR/vars.zsh ]] && source $ZDOTDIR/vars.zsh

# 🅱 tree fs
alias cp="cp --reflink"

export XDG_DESKTOP_DIR="$HOME/misctodo"
export XDG_DOWNLOAD_DIR="$HOME/var/download"
export XDG_TEMPLATES_DIR="$HOME/static/templates"
export XDG_PUBLICSHARE_DIR="$HOME/var/share"
export XDG_DOCUMENTS_DIR="$HOME/static/documents"
export XDG_MUSIC_DIR="$HOME/lfs/music"
export XDG_PICTURES_DIR="$HOME/lfs/img"
export XDG_VIDEOS_DIR="$HOME/lfs/video"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS=$HOME/.local/share/:/usr/local/share/:/usr/share/

# export GIT_ASKPASS="/bin/sh -c 'pass Gits/github.com | head -1'"
export GITHUB_USER='alter2000'
export CHEATPATH='$HOME/static/documents/chsheets'
export CHEATCOLORS=true

export QT_QPA_PLATFORMTHEME='qt5ct'
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export GEM_HOME="$XDG_DATA_HOME/gem"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export RTV_URLVIEWER=urlscan

export PAGER='less'
export EDITOR='vim'
export VISUAL='vim'
# export MAIL="$HOME/var/mail/main/INBOX"
export MAILPATH="$HOME/var/mail/main/INBOX"
export BROWSER=firefox
export LESS='--ignore-case --status-column --raw-control-chars --quiet --window=-3'
export LESSHISTFILE="$HOME/.cache/lesshst"
export ARCHFLAGS='-arch x86_64'
export MAKEFLAGS='-j3'

systemctl --user import-environment PATH

if ! pgrep gpg-agent 1>/dev/null; then
	eval `gpg-agent`
	echo 'hai -- dis gpg'
fi

# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
# 	exec startx
# fi


# vim:ft=zsh
