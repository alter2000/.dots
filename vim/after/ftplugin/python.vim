" if exists('b:did_ftplugin')
"     finish
" endif
" let b:did_ftplugin = 1

setlocal expandtab
setlocal autoindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal softtabstop=4
setlocal colorcolumn=80
setlocal makeprg=python\ %
setlocal foldmethod=indent
setlocal equalprg="yapf --in-place"

nnoremap <silent><buffer> <F4>  :w !python<CR>
nnoremap <silent><buffer> <C-b> oimport ipdb; ipdb.set_trace()<Esc>

let g:jedi#popup_on_dot = 1
let b:ale_fixers  = ['yapf', 'autopep8']
let b:ale_linters = ['flake8', 'pylint']
