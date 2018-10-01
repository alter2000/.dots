### FUNCTIONS ###

# Creates an archive (*.tar.gz) from given directory. {{{
function mktar() {
	tar cvzf "${1%%/}.tar.gz" "${1%%/}/"
}
# }}}
# typing ... expands to ../.., .... to ../../.., etc. {{{
rationalize-dot() {
	if [[ $LBUFFER = *.. ]]; then
		LBUFFER+=/..
	else
		LBUFFER+=.
	fi
}
# }}}
# # extra prompt function for wifi strength{{{
# p9k_wifi_signal(){
# 	local signal=$( cat /proc/net/wireless | tail -1 | cut -d' ' -f7 | sed 's/\.//' )
# 	local colour='%F{058}'
# 	[[ $signal = 'level' ]] && signal=''
# 	[[ $signal -lt 80 ]] && colour='%F{028}'
# 	[[ $signal -gt 70 ]] && colour='%F{208}'
# 	echo -n "$colour$signal%f"
# }
# # }}}
# Display neatly formatted path {{{
# https://github.com/zanshin/dotfiles/blob/master/zsh/functions.zsh
path() {
	echo $PATH | tr ":" "\n" | \
		awk "{ sub(\"/usr\", \"$fg_no_bold[green]/usr$reset_color\"); \
					 sub(\"/bin\", \"$fg_no_bold[blue]/bin$reset_color\"); \
					 sub(\"/opt\", \"$fg_no_bold[cyan]/opt$reset_color\"); \
					 sub(\"/sbin\", \"$fg_no_bold[magenta]/sbin$reset_color\"); \
					 sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
					 sub(\"/.rvm\", \"$fg_no_bold[red]/.rvm$reset_color\"); \
					 print }"
}
# }}}
# convert github.com/asdf/ghjk to git.io link {{{
git.io() {
	emulate -L zsh
	curl -i -s https://git.io -F "url=$1" | grep "Location" | cut -f 2 -d " "
}
# }}}
# <Esc><Esc> prepends sudo or sudoedit {{{
sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	if [[ $BUFFER == sudo\ * ]]; then
		LBUFFER="${LBUFFER#sudo }"
	elif [[ $BUFFER == $EDITOR\ * ]]; then
		LBUFFER="${LBUFFER#$EDITOR }"
		LBUFFER="sudoedit $LBUFFER"
	elif [[ $BUFFER == sudoedit\ * ]]; then
		LBUFFER="${LBUFFER#sudoedit }"
		LBUFFER="$EDITOR $LBUFFER"
	else
		LBUFFER="sudo $LBUFFER"
	fi
}
zle -N sudo-command-line && bindkey "\e\e" sudo-command-line
# }}}
# verbose cp via rsync (local only, backups instead of overwriting) {{{
cpv() {
		rsync -pogbr -hhh --backup-dir=/tmp/rsync -e /dev/null --progress "$@"
}
compdef _files cpv
# }}}
