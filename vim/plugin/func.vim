" scratchpad
function! ScratchEdit(cmd, options)
	exe a:cmd tempname()
	setl buftype=nofile bufhidden=wipe nobuflisted
	if !empty(a:options) | exe 'setl' a:options | endif
endfunction

command! -bar -nargs=* Sedit call ScratchEdit('edit', <q-args>)
command! -bar -nargs=* Ssplit call ScratchEdit('split', <q-args>)
command! -bar -nargs=* Svsplit call ScratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Stabedit call ScratchEdit('tabe', <q-args>)

" (un)wrap
function! ToggleWrap()
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

""" Statusline """ TODO -- kanged from enanajmain/vim-status

" function! status#readOnly(arg) abort
" 	if (&readonly || !&modifiable)
" 		return '  '.a:arg
" 	else
" 		return ''
" 	endif
" endfunction

" function! status#modified(arg) abort
" 	if &modified
" 		return a:arg
" 	else
" 		return ''
" 	endif
" endfunction

" function! status#gitInfo(arg) abort
" 	let git = gitbranch#name()
" 	if git != ''
" 		return '  '. a:arg.' '.gitbranch#name()
" 	else
" 		return ''
" 	endif
" endfunction

" function! status#filename() abort
" 	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
" 	return filename
" endfunction

" function! status#filetype() abort
" 	return &filetype
" endfunction

" function! status#gitbranch(arg)
" 	return ' '.a:arg.' '.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" " by https://github.com/adscriven
" fun! status#age(t) abort
" 	let u = localtime() - a:t
" 	let v = u
" 	" Approx. after weeks, but good enough for me.
" 	let divisors = [60.0, 60.0, 24.0, 7.0, 4.345238, 12, 1]
" 	let precisions = [0, 0, 0, 1, 1, 1, 1, 1]
" 	" secs, mins, hours, days, weeks, months, years
" 	" s appears twice to make zero seconds work
" 	let unit = 'ssmhdwMy'
" 	let n = 0
" 	while u >= 1 && n < len(divisors)
" 		let v = u
" 		let u = u/divisors[n]
" 		let n += 1
" 	endwhile
" 	return printf('%.*f%s', precisions[n], v, unit[n])
" endfun

" " Cache the result of getftime() at pertinent points in time for performance
" augroup vimrc_ftime
" au!
" au bufread,bufwritepost * let b:ftime = getftime(expand('%:p'))
" augroup end

" " Requires Age(t) and provided by https://github.com/adscriven
" fun! status#fage() abort
" 	return exists('b:ftime') ? status#age(b:ftime) : ''
" endfun
