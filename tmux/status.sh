#!/usr/bin/env zsh
# from dylanaraps/bin + me

bat() {
    # Read battery status from file.
    cur="$(< /sys/class/power_supply/BAT0/capacity)"
    sta="$(< /sys/class/power_supply/BAT0/status)"

    case "$cur" in
        [0-9])  bat_icon="\\uf244" ;;
        [1-3]?) bat_icon="\\uf243" ;;
        [4-5]?) bat_icon="\\uf242" ;;
        [6-7]?) bat_icon="\\uf241" ;;
        *)      bat_icon="\\uf240" ;;
    esac

    [[ "$sta" == Charging ]] && \
        bat_icon+="  \\uf0e7"

    bat="${cur}% $bat_icon"
}

wif() {
  wif=`iwgetid --raw`
  sig=$( cat /proc/net/wireless | tail -1 | cut -d' ' -f7 | sed 's/\.//' )
  [[ $sig -eq 'level' ]] && wif='' && sig='no wife kek'
}

# $1 is from tmux supplying column width.
if (( ${1} > 130 )); then
	bat
	wif
	printf "%b\\n" "$wif [$sig]   $bat  "
fi
