command! -bar -nargs=* Ss call func#scratchEdit('split', <q-args>)
command! -bar -nargs=* Svs call func#scratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Ste call func#scratchEdit('tabe', <q-args>)

function! Joana()
	unmap <Up>
	unmap <Down>
	unmap <Left>
	unmap <Right>
endfunction
command! Joana call Joana()

function! Dejoana()
	nnoremap <Up>    :resize +3<CR>
	nnoremap <Down>  :resize -3<CR>
	nnoremap <Left>  :vertical resize -3<CR>
	nnoremap <Right> :vertical resize +3<CR>
endfunction
command! Dejoana call Dejoana()

" command -bar -nargs=0 -range=% func#TrimSpaces <line1>,<line2>call TrimSpaces()
