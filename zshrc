[[ $- != *i* ]] && return

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/powerlevel9k/powerlevel9k.zsh-theme
source ~/.zsh/completions/completions.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/vars.zsh
source ~/.zsh/options.zsh
source ~/.zsh/kbd.zsh

systemctl --user import-environment PATH

zle -N rationalize-dot
bindkey . rationalize-dot
bindkey -M isearch . self-insert # history search fix

### EYECANDY ###
# might prep homemade prompt to learn some shell, but powerlevel9k is _soo_ good
# anyway, this may be a different file
#autoload -U colors && colors
#autoload -U promptinit && promptinit
(cat ~/.cache/wal/sequences)
