[[ -f $ZDOTDIR/vars.zsh ]] && source $ZDOTDIR/vars.zsh

# 🅱 tree fs
alias cp="cp --reflink"

export XDG_RUNTIME_DIR=/run/user/$(id -u)

export XDG_DESKTOP_DIR="$HOME/var/desk" \
	XDG_DOWNLOAD_DIR="$HOME/var/download" \
	XDG_TEMPLATES_DIR="$HOME/static/templates" \
	XDG_PUBLICSHARE_DIR="$HOME/var/share" \
	XDG_DOCUMENTS_DIR="$HOME/static/documents" \
	XDG_MUSIC_DIR="$HOME/lfs/music" \
	XDG_PICTURES_DIR="$HOME/lfs/img" \
	XDG_VIDEOS_DIR="$HOME/lfs/video" \
	XDG_CONFIG_HOME="$HOME/.config" \
	XDG_CACHE_HOME="$HOME/.cache" \
	XDG_DATA_HOME="$HOME/.local/share" \
	XDG_CONFIG_DIRS="$HOME/.config:$XDG_CONFIG_DIRS" \
	XDG_DATA_DIRS="$HOME/.local/share/:$XDG_DATA_DIRS"

# export GIT_ASKPASS="/bin/sh -c 'pass Gits/github.com | head -1'"
export GITHUB_USER='alter2000'
	# CHEATPATH='$HOME/static/documents/chsheets' \
	# CHEATCOLORS=true

export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle" \
	BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle" \
	BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle" \
	GEM_HOME="$XDG_DATA_HOME/gem" \
	CARGO_HOME="$XDG_DATA_HOME/cargo" \
	NVM_DIR="$XDG_DATA_HOME/nvm"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true" \
	_JAVA_AWT_WM_NONREPARENTING=1

export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export RTV_URLVIEWER=urlscan
export LEDGER_FILE="$XDG_DOCUMENTS_DIR/hledger.journal"
# export MAIL="$HOME/var/mail/main/INBOX"
export MAILPATH="$HOME/var/mail/main/INBOX"

export PAGER='less'
export EDITOR='nvim'
export MANPAGER="$EDITOR +Man!"
export VISUAL='nvim'
export BROWSER=firefox
export LESS='--ignore-case --status-column --raw-control-chars --quiet --window=-3'
export LESSHISTFILE="$HOME/.cache/lesshst"
export ARCHFLAGS='-arch x86_64'
export MAKEFLAGS='-j3'

# vim:ft=zsh
