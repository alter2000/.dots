### ESCAPE SEQUENCES ###

CLEAR     = "\e[0m"
BOLD      = "\e[1m"
UNDERLINE = "\e[4m"
SWAP_FGBG = "\e[7m"
CLR_SWAP  = "\e[27m"
COLOR0  = "\e[30m"
COLOR1  = "\e[31m"
COLOR2  = "\e[32m"
COLOR3  = "\e[33m"
COLOR4  = "\e[34m"
COLOR5  = "\e[35m"
COLOR6  = "\e[36m"
COLOR7  = "\e[37m"
COLOR00 = "\e[40m"
COLOR01 = "\e[41m"
COLOR02 = "\e[42m"
COLOR03 = "\e[43m"
COLOR04 = "\e[44m"
COLOR05 = "\e[45m"
COLOR06 = "\e[46m"
COLOR07 = "\e[47m"

#for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
#  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
#  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
#done

#eval RESET='$reset_color'
#export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
#export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
#export PR_BOLD_WHITE PR_BOLD_BLACK

### PROMPT ###
#WIP
