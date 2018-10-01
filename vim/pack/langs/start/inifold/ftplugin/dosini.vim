if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

if g:ini_fold_enabled_filetypes['dosini']
    call IniFoldActivate()
endif

call IniFoldUndo()
" start with closed or open folds?
" :%foldopen!
