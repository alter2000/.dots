### FUNCTIONS ###

# typing ... expands to ../.., .... to ../../.., etc.
rationalize-dot() {
	if [[ $LBUFFER = *.. ]]; then
		LBUFFER+=/..
	else
		LBUFFER+=.
	fi
}

# find files not tracked by pacman
function pacdisowned() {
	emulate -L zsh

	tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
	db=$tmp/db
	fs=$tmp/fs

	mkdir "$tmp"
	trap  'rm -rf "$tmp"' EXIT
	pacman -Qlq | sort -u > "$db"

	find /bin /etc /lib /sbin /usr ! -name lost+found \
		\( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

	comm -23 "$fs" "$db"
}

# download torrent from magnet link
function mgn2torrent() {
	[[ "$1" =~ xt=urn:btih:([^\&/]+) ]] || return 1
	hashh=${match[1]}
	if [[ "$1" =~ dn=([^\&/]+) ]];then
		filename=${match[1]}
	else
		filename=$hashh
	fi

	echo "d10:magnet-uri${#1}:${1}e" > "$filename.torrent"
}

p9k_wifi_signal(){
	local signal=$(iwconfig wlp3s0 | grep Signal | \
								awk -F = '{print ($3)}' | awk '{print $1}')
	local colour='%F{058}'
	[[ $signal -lt 80 ]] && colour='%F{028}'
	[[ $signal -gt 70 ]] && colour='%F{208}'
	echo -n "$colour$signal%f"
}

path() {
	echo $PATH | tr ":" "\n" | \
		awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
					sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
					sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
					sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
					sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
		print }"
}

