[[ $- != *i* ]] && return

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/powerlevel9k/powerlevel9k.zsh-theme
source ~/.zsh/completions/completions.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/vars.zsh

### SETOPTS ###
# remove beep
unsetopt beep
# allow extended globbing
setopt extendedglob
# if not a command, move to typed directory
setopt auto_cd
# allow multiple sessions to append to same file
setopt append_history
# more details on command execution
setopt extended_history
# drop oldest entries first
setopt hist_expire_dups_first
# ignore duplicate entries when appending
setopt hist_ignore_dups
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
setopt prompt_subst



### KEYBINDS ###
autoload -U up-line-or-beginning-search && zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search && zle -N down-line-or-beginning-search

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]] && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]] && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]] && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]] && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]] && bindkey  "${key[Up]}"       up-line-or-beginning-search
[[ -n "${key[Down]}"     ]] && bindkey  "${key[Down]}"     down-line-or-beginning-search
[[ -n "${key[Left]}"     ]] && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]] && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]] && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]] && bindkey  "${key[PageDown]}" end-of-buffer-or-history

bindkey "^[[1;5D" backward-word                 # Ctrl+Left
bindkey "^[[1;5C" forward-word                  # Ctrl+Right
bindkey "^[[1;3D" backward-word                 # Alt+Left
bindkey "^[[1;3C" forward-word                  # Alt+Right
bindkey "^[[3;5~" delete-word                   # Ctrl+Del
bindkey "^[[3;3~" delete-word                   # Alt+Del
bindkey "^H"      backward-delete-word          # Ctrl+Bksp
bindkey "^[[Z"    reverse-menu-complete         # Shift+Tab backwards menu

zle -N rationalize-dot
bindkey . rationalize-dot
bindkey -M isearch . self-insert # history search fix


### EYECANDY ###
# might prep homemade prompt to learn some shell, but powerlevel9k is _soo_ good
#autoload -U colors && colors
#autoload -U promptinit && promptinit
(cat ~/.cache/wal/sequences)
