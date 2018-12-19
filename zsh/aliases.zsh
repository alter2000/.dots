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
alias m,="nmtui-connect"
test "hash taskell" && alias asd="taskell ~/notes/todo.md"
test "hash ranger"  && alias './'="ranger"
test "hash neomutt" && alias m="neomutt"
test "hash wordgrinder" && test -f "$XDG_CONFIG_HOME/wordgrinder.lua" && \
	alias wordgrinder='wordgrinder --config "$XDG_CONFIG_HOME/wordgrinder.lua"'

alias ipy="ipython3"
alias tree="tree -C"
alias wag="python ./manage.py"
# alias kid="cheat ""| less"
# alias conc="source /opt/context-minimals/setuptex && context "

alias ls="ls --color=auto --group-directories-first"
alias l="ls -AlhF"
alias ll="ls -Alh"
alias la="ls -Ah"

# alias gh="git hub"
# alias gb="git bb"
alias gst="git status -sb"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit"
alias gd="git diff"
alias gp="git push"
alias gpull="git pull --rebase"

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
fi

# global aliases for reading
alias -g LL="2>&1 | less"
alias -g NE="2> /dev/null"
alias -g P="2>&1| pygmentize -l pytb"
