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
" list commit files {{{
function func#ListCommitFiles(...)
    let a:filepath = get(a:, 1, '')
    let l:file_list = systemlist("cd " . expand("%:p:h") . "; git show --pretty='' --name-only " . a:filepath)
    let l:git_root = system("cd " . expand("%:p:h") . "; printf \"%s\" $(git rev-parse --show-toplevel)")
    return map(l:file_list, '{"filename": "' . l:git_root . '/".v:val, "lnum": 1}')
endfunction
" }}}
" " toggle explore netrw {{{
" function! func#toggleExplore()
" 	if &ft ==# "netrw"
" 		Rexplore
" 	else
" 		Explore
" 	endif
" endfunction
" " }}}
" redirect output to file {{{
function! redir#redir(cmd)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
	else
		redir => output
		execute a:cmd
		redir END
	endif
	vnew
	let w:scratch = 1
	setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
	call setline(1, split(output, "\n"))
endfunction
" }}}
