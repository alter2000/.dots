setlocal expandtab
setlocal autoindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal softtabstop=4
setlocal colorcolumn=79
" setlocal foldmethod=indent
setlocal makeprg=python\ %
noremap <F4> :w !python
nnoremap <C-b> oimport ipdb; ipdb.set_trace()<Esc>
setlocal equalprg="yapf --in-place"

let b:ale_fixers  = ['yapf', 'autopep8']
let b:ale_linters = ['flake8', 'pylint']
