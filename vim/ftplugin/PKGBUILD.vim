if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal makeprg=sh\ \"makepkg\ -sf\ &&\ makepkg\ --printsrcinfo\ >\ .SRCINFO\"
