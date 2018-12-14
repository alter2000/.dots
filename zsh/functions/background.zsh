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
# convert github.com/asdf/ghjk to git.io link {{{
git.io() {
	emulate -L zsh
	curl -i -s https://git.io -F "url=$1" | grep "Location" | cut -f 2 -d " "
}
# }}}
