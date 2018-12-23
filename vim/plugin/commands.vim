command! -bar -nargs=* Ss call func#scratchEdit('split', <q-args>)
command! -bar -nargs=* Svs call func#scratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Ste call func#scratchEdit('tabe', <q-args>)

command -nargs=? -bar Gshow call setqflist(func#ListCommitFiles("<args>")) | copen | resize 12 | cc 1
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call func#trimSpaces()
" Usage:
" 	:Redir hi ............. show the full output of command ':hi' in a scratch window
" 	:Redir !ls -al ........ show the full output of command ':!ls -al' in a scratch window
command! -nargs=1 -complete=command Redir silent call redir#redir(<f-args>)

command! -bar          Vmake silent w | silent make | unsilent redraw! | cwindow


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
