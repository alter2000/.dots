""" Statusline """ TODO -- kanged from enanajmain/vim-status and vim-airline/vim-airline

function! status#readOnly(arg) abort
	if (&readonly || !&modifiable)
		return '  '.a:arg
	else
		return ''
	endif
endfunction

function! status#shorten(text, winwidth, minwidth, ...)
" from vim-airline/vim-airline
	if winwidth(0) < a:winwidth && len(split(a:text, '\zs')) > a:minwidth
		if get(a:000, 0, 0)
			" shorten from tail
			return '…'.matchstr(a:text, '.\{'.a:minwidth.'}$')
		else
			" shorten from beginning of string
			return matchstr(a:text, '^.\{'.a:minwidth.'}').'…'
		endif
	else
		return a:text
	endif
endfunction

function! status#modified(arg) abort
	if &modified
		return a:arg
	else
		return ''
	endif
endfunction

function! status#filename() abort
	let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[NEMO]'
	return l:filename
endfunction

function! status#filetype() abort
	return &filetype
endfunction

function! status#whitespace()
  let @/='\v(\s+$)|( +\ze\t)'
  let l:oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return l:oldhlsearch
endfunction

if has('gui_running')
	function! GuiTabLabel()
		let l:label = ''
		let l:bufnrlist = tabpagebuflist(v:lnum)
		" Add '+' if one of the buffers in the tab page is modified
		for l:bufnr in l:bufnrlist
			if getbufvar(l:bufnr, '&modified')
				let l:label = '+'
				break
			endif
		endfor
		" Append the tab number
		let l:label .= v:lnum.': '
		" Append the buffer name
		let l:name = bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1])
		if l:name ==? ''
			" give a name to no-name documents
			if &buftype==?'quickfix'
				let l:name = '[QFList]'
			else
				let l:name = '[NEMO]'
			endif
		else
			" get only the file name
			let l:name = fnamemodify(l:name,':t')
		endif
		let l:label .= l:name
		" Append the number of windows in the tab page
		let l:wincount = tabpagewinnr(v:lnum, '$')
		return l:label . '  [' . l:wincount . ']'
	endfunction
	set guitablabel=%{GuiTabLabel()}
endif

function! status#linter_warn() abort
	let s:counts = ale#statusline#Count(bufnr(''))
	let s:all_errors = s:counts.error + s:counts.style_error
	let s:all_non_errors = s:counts.total - s:all_errors
	return s:counts.total == 0 ? 'OK' : printf('%dW', s:all_non_errors)
endfunction

function! status#linter_err() abort
	return s:counts.total == 0 ? 'OK' : printf('%dE', s:all_errors)
endfunction


set laststatus=2
set statusline=\ \ %{status#filename()}   " filename without brackets
set statusline+=%{status#readOnly('')}   " [RO] without RO
" set statusline+=%{status#gitbranch('')}  "
set statusline+=\ %{status#modified('')}
set statusline+=%#warning#
set statusline+=\ \ %{status#linter_warn()}
set statusline+=\ %#error#%{status#linter_err()}
set statusline+=%*
set statusline+=%=                        " segment break
set statusline+=%<%{status#filetype()}\     " filetype without brackets
set statusline+=%5(\|%v%)                 " column number
set statusline+=%5p%%\ \                  " file percentage
" set statusline+=%#error#
" set statusline+=%{status#whitespace()}
" set statusline+=%{status#tabwarning()}
" set statusline+=%*
