""" Statusline """ -- kanged from enanajmain/vim-status and vim-airline/vim-airline

if has('gui_running')"{{{
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
"}}}


function! StatusDefault()
	set laststatus=2
	set statusline=%#ModeMsg#\ %{mode()}\ %*
	set statusline+=%#Normal#\ \ %{status#filename()}
	" defaults with custom symbols
	set statusline+=\ %{status#readOnly('')}
	set statusline+=\ %{status#modified('')}\ 
	set statusline+=%*

	if exists('status#linter_warn()')
		set statusline+=\ \ %#warning#%{status#linter_warn()}
		set statusline+==\ %{status#linter_err()}
		set statusline+=%*
	endif

	set statusline+=%=                       " segment break
	set statusline+=%<%{status#filetype()}\  " filetype without brackets (%< to truncate)
	set statusline+=%5(\|%v%)\ \ \           " column number
	set statusline+=%#Folded#\ \ %2p%%\ \    " file percentage
endfunction

exec StatusDefault()

augroup StatuslineHighlight
	" change statusline highlights if maintaining different statuslines
	autocmd!
	autocmd WinEnter exec StatusDefault()
	autocmd WinLeave highlight! link StatusLineNC Normal
	autocmd CmdlineEnter * redrawstatus
augroup end

" highlight! Statusline ctermbg=NONE guibg=NONE
" highlight! StatuslineNC ctermbg=NONE guibg=NONE


