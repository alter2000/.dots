### KEYBINDS ###
autoload -U up-line-or-beginning-search && zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search && zle -N down-line-or-beginning-search
autoload -Uz edit-command-line && zle -N edit-command-line

# typeset -g -A key
# bindkey -e
echoti smkx && echoti rmkx

# key[Home]="$terminfo[khome]"
# key[End]="$terminfo[kend]"
# key[Insert]="$terminfo[kich1]"
# key[Delete]="$terminfo[kdch1]"
# key[Backspace]="$terminfo[kbs]"
# key[Up]="$terminfo[kcuu1]"
# key[Down]="$terminfo[kcud1]"
# key[Left]="$terminfo[kcub1]"
# key[Right]="$terminfo[kcuf1]"
# key[PageUp]="$terminfo[kpp]"
# key[PageDown]="$terminfo[knp]"

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}"  end-of-line
bindkey "${terminfo[kich1]}" overwrite-mode
bindkey "${terminfo[kbs]}"   backward-delete-char
bindkey "${terminfo[kdch1]}" delete-char
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
bindkey "${terminfo[kcub1]}" backward-char
bindkey "${terminfo[kcuf1]}" forward-char
bindkey "${terminfo[kpp]}"   history-incremental-search-backward
bindkey "${terminfo[knp]}"   history-incremental-search-forward

bindkey "^[[1;5D" backward-word                 # Ctrl+Left
bindkey "^[[1;5C" forward-word                  # Ctrl+Right
bindkey "^[[1;3D" backward-word                 # Alt+Left
bindkey "^[[1;3C" forward-word                  # Alt+Right
bindkey "^[[3;5~" delete-word                   # Ctrl+Del
bindkey "^[[3;3~" delete-word                   # Alt+Del
bindkey "^H"      backward-delete-word          # Ctrl+Bksp
bindkey "^[[Z"    reverse-menu-complete         # Shift+Tab backwards menu

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

bindkey -M vicmd 'u' undo
bindkey -M vicmd '^r' redo
