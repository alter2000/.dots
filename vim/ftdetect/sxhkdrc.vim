if &compatible || v:version < 603
	finish
endif

augroup ftd
	autocmd!
	autocmd BufNewFile,BufRead sxhkdrc,*.sxhkdrc set ft=sxhkdrc
augroup end
