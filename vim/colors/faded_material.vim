" vim color file
" Maintainer:  Doug Whiteley <dougwhiteley@gmail.com>


hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "faded_material"
set background=dark

hi Normal         cterm=none    gui=none   guifg=#dddddd   guibg=#222222
hi LineNr         cterm=none    gui=none   guifg=#333f44   guibg=#222222
hi Todo           cterm=bold    gui=bold   guifg=#f44336   guibg=#222222
hi SignColumn     cterm=none    gui=none                   guibg=#222222
hi clear CursorLine
hi CursorLineNR   cterm=bold    gui=bold   guifg=#1de9b6
hi MatchParen     cterm=underline gui=underline guifg=#ffffff guibg=#292929
hi Statement      cterm=none    gui=none   guifg=#cccccc
hi TabLineSel     cterm=bold    gui=bold
hi String         cterm=none    gui=none   guifg=#2c9bf0
hi Comment        cterm=italic  gui=italic guifg=#585858
hi Function       cterm=none    gui=none   guifg=#c3e88d
hi Conditional    cterm=none    gui=none   guifg=#1de9b6
hi Directory      cterm=none    gui=none   guifg=#aaaaaa
hi clear Search
hi Search         cterm=underline  gui=underline  guifg=#c3e88d
hi IncSearch      cterm=underline  gui=underline  guifg=#ffcb6b
hi MoreMsg        cterm=bold    gui=bold    guifg=#4e9a06
hi ModeMsg        cterm=bold    gui=bold
hi WarningMsg     cterm=none    gui=none    guifg=#f44336
hi Constant       cterm=none    gui=none    guifg=#a9a9a9
hi Special        cterm=none    gui=none    guifg=#c792ea
hi PreProc        cterm=none    gui=none    guifg=#ffcb6b
hi Error          cterm=bold    gui=bold    guifg=#f44336   guibg=#222222
hi SpecialString  cterm=none    gui=none    guifg=#0b9baf
hi Repeat         cterm=none    gui=none    guifg=#ebcb8b
hi Type           cterm=none    gui=none    guifg=#808080
hi Defined        cterm=bold    gui=bold    guifg=#af8f00
hi StatusLine     cterm=bold    gui=bold    guifg=#eeeeee   guibg=#2d2d2d
hi StatusLineNC   cterm=none    gui=none    guifg=#2d2d2d   guibg=#2d2d2d
hi StatusWarning  cterm=bold    gui=bold    guifg=#ffffff   guibg=#812020
hi VertSplit      cterm=none    gui=none    guifg=#222222   guibg=#222222
hi DiffAdded      cterm=bold    gui=bold    guifg=#00af00
hi DiffRemoved    cterm=bold    gui=bold    guifg=#d70000
hi NonText        cterm=none    gui=none    guifg=#444444
hi SpellBad       cterm=underline  gui=underline  guifg=#f44336
hi SpellCap       cterm=underline  gui=underline  guifg=#cc7700
hi WildMenu       cterm=bold    gui=bold    guifg=#ffcb6b   guibg=#292929

hi! link Conceal            Special
hi! link Identifier         Constant
hi! link Question           MoreMsg
hi! link TabLine            Normal
hi! link TabLineFill        Normal
hi! link Title              PreProc
hi! link Include            Type
hi link Character           String
hi link Number              Constant
hi link Boolean             Constant
hi link Float               Number
hi link Label               Statement
hi link Operator            Statement
hi link Keyword             Statement
hi link Exception           Statement
hi link Macro               Type
hi link PreCondit           PreProc
hi link Structure           Type
hi link Typedef             Type
hi link Tag                 Special
hi link SpecialChar         Special
hi link Delimiter           Special
hi link SpecialComment      Special
hi link Debug               Special
hi link VimNotFunc          Conditional
hi link StorageClass        Title
hi! link Folded             LineNr
hi! link Pmenu              LineNr

" Python
hi link PythonDecoratorName PreProc
hi link PythonStrFormat     String
hi link PythonException     Conditional
hi link PythonEscape        SpecialString
hi link PythonAsync         Identifier

" Haskell
hi link ConId               Identifier
