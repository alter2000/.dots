" if exists('b:did_ftplugin')
"     finish
" endif
" let b:did_ftplugin = 1

setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
let c_space_errors = 1
setlocal colorcolumn=80
setlocal keywordprg=man
setlocal path+=./include,./lib/my,,
setlocal foldmethod=syntax
