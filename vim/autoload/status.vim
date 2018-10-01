function! status#filename() abort"{{{
	let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[NEMO]'
	return l:filename
endfunction
"}}}
function! status#filetype() abort"{{{
	return &filetype
endfunction
"}}}
function! status#modified(arg) abort"{{{
	if &modified
		return a:arg
	else
		return ''
	endif
endfunction
"}}}
function! status#readOnly(arg) abort"{{{
	if (&readonly || !&modifiable)
		return ' '.a:arg.' '
	else
		return ''
	endif
endfunction
"}}}
function! status#whitespace()"{{{
	let @/='\v(\s+$)|( +\ze\t)'
	let l:oldhlsearch=&hlsearch
	if !a:0
		let &hlsearch=!&hlsearch
	else
		let &hlsearch=a:1
	end
	return l:oldhlsearch
endfunction
"}}}
function! status#linter_warn() abort"{{{
	if exists('g:loaded_ale')
		let s:counts = ale#statusline#Count(bufnr(''))
		let s:all_errors = s:counts.error + s:counts.style_error
		let s:all_non_errors = s:counts.total - s:all_errors
		return s:counts.total == 0 ? '' : printf('%dW', s:all_non_errors)
	else
		return ''
	endif
endfunction
	"}}}
	function! status#linter_err() abort"{{{
	if exists('g:loaded_ale')
		return s:counts.total == 0 ? '' : printf('%dE', s:all_errors)
	else
		return ''
	endfunction"}}}
