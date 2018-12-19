if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

iabbrev <// </<C-X><C-O>
packadd matchit
let g:xml_syntax_folding=1
setlocal foldmethod=syntax
:%foldopen!
