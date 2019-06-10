autoload -Uz compinit; compinit
# autoload -U ~/.zsh/completions/*(:t)

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1

zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 0
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' substitute 1
zstyle ':completion:*:*:(vim|e):*' file-patterns '^*.(aux|log|pdf|o|*gc*):source-files' '*:all-files'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh
zstyle ':completion:*' use-compctl true

# zstyle ':completion:*' verbose true
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
# zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*:manuals.(^1*)' insert-sections true

zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)git'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#git'
zstyle ':completion:*:cd:*' ignore-parents parent pwd

compdef mosh=ssh
