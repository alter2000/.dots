# fuck the law with the dick in my hand
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"
alias webget="wget -mkEpnp"
alias wq="toilet -f future \"this isn't vim, autismo\" | lolcat \
	|| echo 'kek u forgot the shitbox'; \
	sleep 616"
alias q="wq"
alias e="$EDITOR"
alias ew="zile"
alias ffs="sudo"
alias sudont="false && "
alias m,="nmtui-connect"
alias qwe="tmux attach"
alias aux="pulsemixer"
alias m="neomutt"
alias :r="cabal repl"
alias bux="nix"
alias todo="$EDITOR ~/todo"

alias browsh-docker='docker run --rm -it browsh/browsh'
alias gdb='gdb -q -w'
alias calc="autoload -Uz zcalc && zcalc"
alias yeet="find . -mindepth 0 -maxdepth 9 -type f -name '*.o' -delete"
alias stats="arbtt-stats --categorizefile=$HOME/.dots/arbtt.cfg --logfile=$XDG_DATA_HOME/arbtt/capture.log"

alias ipy="ipython3"
alias tree="tree -C"
alias wag="python ./manage.py"
# alias kid="cheat ""| less"
# alias conc="source /opt/context-minimals/setuptex && context "

# coreutils
alias ls="ls --color=auto --group-directories-first"
alias sl="ls"
alias l="ls -AlhF"
alias ll="ls -Alh"
alias la="ls -Ah"
alias cp="cp -i"
alias mv="mv -i"
alias apci="acpi"

alias './'="ranger"
# alias '..'='cd ..'
# alias '...'='cd ../..'
# alias '....'='cd ../../..'
# alias '-'='cd -'

# git
# alias gh="git hub"
# alias gb="git bb"
# alias gst="git status -sb"
# convert from alias to function :s/alias // | s/="/() { / | s/"/ }
alias gco="git checkout"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gstash="git stash"
alias gpop="git stash pop"
alias gd="git diff -w --word-diff"
alias gds="git diff -w --word-diff --staged"
alias gdiff="git difftool"
alias gp="git push"
alias gpull="git pull origin master --rebase"
alias gsu="git submodule update"
alias gts="git tag -s"
alias grb="git rebase --interactive"
alias grc="git rebase --continue"
gdv() { git diff -w "$@" | vim - }
compdef _git gdv=git-diff

alias hst="hg status"
alias ha="hg add"
alias haa="hg addremove"
alias hd="hg diff"
alias hc="hg commit"
alias hp="hg push"
alias hpull="hg pull"

alias ff='find ./ -name'
alias grep="grep --color=auto"
alias fgrep="grep --color=auto -F"
alias egrep="grep --color=auto -E"
alias dmenu="rofi -dmenu"

alias -g L="2>&1 | less"
alias -g NE="2> /dev/null"
alias -g P="2>&1| pygmentize -l pytb"
alias -g QQ="2>/dev/null"
alias -g E=" | xargs -o $EDITOR"

alias headphones="bluetoothctl power off && bluetoothctl power on && bluetoothctl connect BC:F2:92:BA:A2:E2"
