command! -bar -nargs=* Ss call func#ScratchEdit('split', <q-args>)
command! -bar -nargs=* Svs call func#ScratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Ste call func#ScratchEdit('tabe', <q-args>)

" command -bar -nargs=0 -range=% func#TrimSpaces <line1>,<line2>call TrimSpaces()
