command! -bar -nargs=* Ss call func#scratchEdit('split', <q-args>)
command! -bar -nargs=* Svs call func#scratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Ste call func#scratchEdit('tabe', <q-args>)

command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call func#trimSpaces()

" Usage:
" 	:Redir hi ............. show the full output of command ':hi' in a scratch window
" 	:Redir !ls -al ........ show the full output of command ':!ls -al' in a scratch window
command! -nargs=1 -complete=command Redir silent call redir#redir(<f-args>)

command! -bar          Vmake silent w | silent make | unsilent redraw! | cwindow

if executable('rg')
	command! -nargs=0 Ffiles call func#fzfFiles()
endif

command! Joana call func#Joana()
command! Dejoana call func#Dejoana()
