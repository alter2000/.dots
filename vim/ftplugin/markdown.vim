if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

setlocal nospell
setlocal spelllang=en,fr
setlocal textwidth=79
setlocal wrap
:Goyo
