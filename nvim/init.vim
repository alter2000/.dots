set runtimepath^=~/.vim runtimepath+=~/.vim/after
source ~/.vim/vimrc
let &shadafile = expand("$HOME/.cache/vim/shadafile")

" lua << EOF
" local path = vim.fn.expand

" -- TODO: doesn't get picked up on time
" -- vim.o.rtp = path('~/.vim')..','..vim.o.rtp..','..path('~/.vim/after')
" vim.cmd 'source ~/.vim/vimrc'
" vim.o.shadafile = path("$HOME/.cache/vim/shadafile")

" -- require 'plugins'
" EOF
