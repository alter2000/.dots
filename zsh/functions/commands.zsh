# Creates an archive (*.tar.gz) from given directory. {{{
function mktar() {
	tar cvzf "${1%%/}.tar.gz" "${1%%/}/"
}
# }}}
# Display neatly formatted path {{{
# https://github.com/zanshin/dotfiles/blob/master/zsh/functions.zsh
path() {
	echo $PATH | tr ":" "\n" | \
		awk "{ sub(\"/usr\", \"[;32m/usr[0;m\"); \
					 sub(\"/home\", \"[;32m/home[0;m\"); \
					 sub(\"/bin\", \"[;31m/bin[0;m\"); \
					 sub(\"/opt\", \"[;36m/opt[0;m\"); \
					 sub(\"/sbin\", \"[;35m/sbin[0;m\"); \
					 sub(\"/local\", \"[;33m/local[0;m\"); \
					 sub(\"/.rvm\", \"[;31m/.rvm[0;m\"); \
					 sub(\"/.cargo\", \"[;31m/.rvm[0;m\"); \
					 sub(\"/.perl\", \"[;31m/.rvm[0;m\"); \
					 print }"
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
# revealjs slides with pandoc {{{
gib_slides() {
	out="${1/.md/.html}"

	pandoc -w revealjs \
		--mathjax \
		--self-contained \
		-V revealjs-url=$HOME/.pandoc/reveal.js \
		-V css=main.css \
		-V controls=false \
		--slide-level=2 \
		-o $out \
		$@
	echo "$out out"
	firefox $out
	unset out
}
compdef _files gib_slides
# }}}
# connect to server and start/attach tmux {{{
sshtmux(){
    ssh "$@" -v -t 'if tmux ls | grep gtx -q ; then tmux at -t gtx ;else tmux new -s gtx ;fi'
}
# }}}
# verbose cp via rsync (local only, backups instead of overwriting) {{{
cpv() {
		rsync -pogbr -hhh --backup-dir=/tmp/rsync -e /dev/null --progress "$@"
}
compdef _files cpv
# }}}
