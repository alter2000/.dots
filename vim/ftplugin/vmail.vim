if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

setlocal nowrap
setlocal number
setlocal norelativenumber number
setlocal nospell
setlocal norelativenumber
setlocal filetype=mail.pandoc
setlocal syntax=pandoc
:ALEDisableBuffer
let b:loaded_delimitMate = 1
runtime plugin/status.vim
