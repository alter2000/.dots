# fuck the law with the dick in my hand
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"
alias webget="wget -mpP"
alias wq="toilet -f future \"this isn't vim, autismo\" | lolcat \
	|| echo 'kek u forgot the shitbox'; \
	echo 'now shit shtill roight here and rot in hell'; \
	sleep 616"
alias q="wq"
alias e="$EDITOR"
alias ew="zile"
alias ffs="sudo"
alias sudont=""
alias m,="nmtui-connect"
alias asd="taskell ~/notes/todo.md"
alias './'="ranger"
alias m="neomutt"
alias wordgrinder='wordgrinder --config "$XDG_CONFIG_HOME/wordgrinder.lua"'

alias ipy="ipython3"
alias tree="tree -C"
alias wag="python ./manage.py"
# alias kid="cheat ""| less"
# alias conc="source /opt/context-minimals/setuptex && context "

# coreutils
alias ls="ls --color=auto --group-directories-first"
alias l="ls -AlhF"
alias ll="ls -Alh"
alias la="ls -Ah"
alias cp="cp -i"
alias mv="mv -i"
alias apci="acpi"

# git
# alias gh="git hub"
# alias gb="git bb"
# convert from alias to function :s/alias // | s/="/() { / | s/"/ }
alias gst="git status -sb"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gd="git diff"
alias gp="git push"
alias gpull="git pull --rebase"
alias gsu="git submodule update"
alias gts="git tag -s"
alias grb="git rebase --interactive"
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

if command -v yay >/dev/null; then
	alias suffer="yay -Syu"
	alias plague="yay -Pw"
	alias pain="yay -S"
	alias painl="yay -U"
	alias paind="yay -S --asdeps"
	alias pare="yay -R"
	alias parm="yay -Rsn"
	alias parmorphans="sudo pacman -Rns $(pacman -Qtdq | tr '\n' ' ')"
	alias parmnew="sudo find / -name '*.pacnew' 2>/dev/null"
elif command -v apt >/dev/null; then
	alias suffer="sudo apt update && sudo apt upgrade"
	alias pain="sudo apt install"
	alias painl="sudo apt upgrade"
	alias pare="sudo apt remove"
	alias parm="sudo apt purge"
elif command -v dnf >/dev/null; then
	alias suffer="sudo dnf upgrade"
	alias pain="sudo dnf install"
	alias parm="sudo dnf remove"
fi

# global aliases for reading
alias -g LL="2>&1 | less"
alias -g NE="2> /dev/null"
alias -g P="2>&1| pygmentize -l pytb"
alias -g QQ="2>/dev/null"
