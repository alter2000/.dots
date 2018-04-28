### FUNCTIONS ###

# typing ... expands to ../.., .... to ../../.., etc.
rationalize-dot() {
	if [[ $LBUFFER = *.. ]]; then
		LBUFFER+=/..
	else
		LBUFFER+=.
	fi
}

# extra prompt function for wifi strength
p9k_wifi_signal(){
	local signal=$(iwconfig wlp3s0 | grep Signal | \
								awk -F = '{print ($3)}' | awk '{print $1}')
	local colour='%F{058}'
	[[ $signal -lt 80 ]] && colour='%F{028}'
	[[ $signal -gt 70 ]] && colour='%F{208}'
	echo -n "$colour$signal%f"
}

# upload to ptpb.pw
uptpb() {
	curl -F c=@- https://ptpb.pw/ < $1
}

# get services (systemd)
rc(){
	systemctl list-unit-files --type=service |\
	sed 's/.service//g' |\
	sed '/static/d' |\
	sed '/indirect/d' |\
	sed '/systemd/d' |\
	sed '/dbus-org/d' |\
	sed '/canberra/d'|\
	sed '/wpa_supplicant/d' |\
	sed '/netctl/d' |\
	sed '/rfkill/d' |\
	sed '/krb5/d' |\
	tail -n+2 |\
	head -n -2 |\
	sed 's/\(^.*enabled.*$\)/[x] \1/' |\
	sed 's/enabled//g' |\
	sed 's/\(^.*disabled.*$\)/[ ] \1/' |\
	sed 's/disabled//g' |\
	sed 's/[ \t]*$//' |\
	while read line; do
			if [[ $line == *'[x]'* ]]; then
				printf "\033[0;32m$line\n"
			else
				printf "\033[1;30m$line\n"
			fi
	done
}
