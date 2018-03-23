### KEYBINDS ###
autoload -U up-line-or-beginning-search && zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search && zle -N down-line-or-beginning-search

typeset -g -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Delete]="$terminfo[kdch1]"
key[Backspace]="$terminfo[kbs]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-history
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-history
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char
[[ -n "$key[PageUp]"    ]] && bindkey -- "$key[PageUp]"    beginning-of-buffer-or-history
[[ -n "$key[PageDown]"  ]] && bindkey -- "$key[PageDown]"  end-of-buffer-or-history

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
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
