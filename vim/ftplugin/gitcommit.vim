" if exists('b:did_ftplugin')
"     finish
" endif
" let b:did_ftplugin = 1

setlocal spell
setlocal textwidth=72
setlocal colorcolumn=73
match ErrorMsg /\%1l.\%>51v/
