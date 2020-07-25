### SETOPTS ###
# remove beep
unsetopt beep
# allow extended globbing
# setopt extendedglob
# use comments in interactive shells
setopt interactive_comments
# if not a command, move to typed directory
setopt auto_cd
# tab completing directory appends a slash
setopt autoparamslash
# add to stack whenever cd'ing
setopt autopushd
setopt pushd_ignore_dups
# allow multiple sessions to append to same file and read from it
setopt append_history
setopt share_history
# more details on command execution
setopt extended_history
# drop oldest entries first
setopt hist_expire_dups_first
# ignore duplicate entries when appending
setopt hist_ignore_all_dups
# ignore duplicate entries when searching
#setopt hist_find_no_dups
setopt hist_reduce_blanks
# tab menu
unsetopt menu_complete
setopt auto_menu
# move cursor to end of completed phrase after completion
setopt always_to_end
setopt complete_in_word
# enable parameter/arithmetic expansion and command substitution in prompt
#setopt prompt_subst
# multiple redirections
setopt multios
# expand if found =cmd -> /path/to/cmd
setopt equals
# watch for tmux
# [ -n "$TMUX" ] && setopt ignoreeof
# allow ctrl-s and ctrl-q bindings to be used
stty -ixon
