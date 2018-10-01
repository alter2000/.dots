" scratchpad {{{
function! func#scratchEdit(cmd, options)
	exe a:cmd tempname()
	setl buftype=nofile bufhidden=wipe nobuflisted
	if !empty(a:options) | exe 'setl' a:options | endif
endfunction
" }}}
" (un)wrap {{{
function! func#toggleWrap()
	if &wrap
		echo "Wrap OFF"
		setlocal nowrap
		" set virtualedit=all
		silent! nunmap <buffer> <Up>
		silent! nunmap <buffer> <Down>
		silent! nunmap <buffer> <Home>
		silent! nunmap <buffer> <End>
		silent! iunmap <buffer> <Up>
		silent! iunmap <buffer> <Down>
		silent! iunmap <buffer> <Home>
		silent! iunmap <buffer> <End>
	else
		echo "Wrap ON"
		setlocal wrap linebreak nolist
		" set virtualedit=
		setlocal display+=lastline
		noremap  <buffer> <silent> <Up>   gk
		noremap  <buffer> <silent> <Down> gj
		noremap  <buffer> <silent> <Home> g<Home>
		noremap  <buffer> <silent> <End>  g<End>
		inoremap <buffer> <silent> <Up>   <C-o>gk
		inoremap <buffer> <silent> <Down> <C-o>gj
		inoremap <buffer> <silent> <Home> <C-o>g<Home>
		inoremap <buffer> <silent> <End>  <C-o>g<End>
	endif
endfunction
" }}}
" " trim whitespace {{{
" function func#trimSpaces() range
"   let oldhlsearch=ShowSpaces(1)
"   execute a:firstline.",".a:lastline."substitute ///gec"
"   let &hlsearch=oldhlsearch
" endfunction
" " }}}
" " toggle explore netrw {{{
" function! func#toggleExplore()
" 	if &ft ==# "netrw"
" 		Rexplore
" 	else
" 		Explore
" 	endif
" endfunction
" " }}}
