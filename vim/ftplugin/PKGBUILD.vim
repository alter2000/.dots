setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
let &makeprg = 'sh -c "makepkg -s && makepkg --printsrcinfo > .SRCINFO"'
