source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/powerlevel9k/powerlevel9k.zsh-theme
source ~/.zsh/vars.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/completions/completions.zsh

### ALIASES ###
alias mu="TERM=xterm-truecolor micro"
# fuck the law with the dick in my hand
alias ytmp3="youtube-dl --extract-audio --audio-format mp3 "

alias ls="ls --color=auto --group-directories-first"
alias l="ls -AlhF"
alias ll="ls -lA"
alias la="ls -Ah"

alias gst="git status"
alias gaa="git add -A"
alias gc="git commit "
alias gp="git push"
alias gh="git hub "
alias gb="git bb "

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias less="less -R"
alias mutt="neomutt"

alias suffer="pacaur -Syu"
alias pain="pacaur -S"
alias painl="pacaur -U"
alias paind="pacaur -S --asdeps"
alias pare="pacaur -R"
alias parm="pacaur -Rsn"
alias parmorphans="sudo pacman -Rns $(pacman -Qtdq)"

eval $(thefuck --alias)


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
autoload -U up-line-or-beginning-search; zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search; zle -N down-line-or-beginning-search
bindkey -e
bindkey "^[[H"  beginning-of-line               # Home
bindkey "^[[F"  end-of-line                     # End
bindkey "^[[2~" overwrite-mode                  # Insert
bindkey "^[[3~" delete-char                     # Delete
bindkey "^[[D"  backward-char                   # Left
bindkey "^[[C"  forward-char                    # Right
bindkey "^[[A"  up-line-or-beginning-search     # Up
bindkey "^[[B"  down-line-or-beginning-search   # Down
bindkey "^[[5~" history-search-backward         # PageUp
bindkey "^[[6~" history-search-forward          # PageDown
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
# might prep homemade prompt to learn some shell, but powerline is _soo_ good
#autoload -U colors && colors
#autoload -U promptinit && promptinit
(wal -r &)

### HISTORY ###
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
