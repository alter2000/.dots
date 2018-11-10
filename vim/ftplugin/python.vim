setlocal expandtab
setlocal autoindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal softtabstop=4
setlocal colorcolumn=79
setlocal makeprg=python\ %
" setlocal foldmethod=indent
setlocal equalprg="yapf --in-place"

noremap <F4> :w !python<CR>
nnoremap <C-b> oimport ipdb; ipdb.set_trace()<Esc>

let b:ale_fixers  = ['yapf', 'autopep8']
let b:ale_linters = ['flake8', 'pylint']
