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
