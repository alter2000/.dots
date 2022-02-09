vim.cmd [[packadd packer.nvim]]
p = require 'packer'

fugitiveCmds = { 'G', 'Git', 'Ggrep', 'GLgrep', 'Gclog', 'Gllog', 'Gcd', 'Glcd', 'Gedit', 'Gsplit', 'Gvsplit', 'Gtabedit'
  'Gread', 'Gwrite', 'Gwq', 'Gdiffsplit', 'GMove', 'GRename', 'GDelete', 'GRemove', 'GBrowse'
  }

tableModeCmds = { 'TableModeToggle', 'TableModeEnable', 'TableModeDisable', 'Tableize', 'TableModeRealign'
  'TableAddFormula', 'TableEvalFormulaLine', 'TableSort' }

colorizerCmds = { 'ColorHighlight', 'ColorClear', 'ColorContrast', 'ColorSwapFgBg'
  'ColorToggle', 'RGB2Term', 'Term2RGB', 'HSL2RGB' }

p.startup ->
  use { 'wbthomason/packer.nvim', opt: true }

-- everywhere {{{
  use { 'neoclide/coc.nvim', branch: 'release' }
  use { 'ludovicchabant/vim-gutentags' }
  use { 'machakann/vim-sandwich' }
  use { 'tpope/vim-commentary' }

  use { 'mhinz/vim-startify' }
  use { 'tpope/vim-fugitive', cmd: fugitiveCmds }
  use { 'simnalamburt/vim-mundo' , cmd: {'MundoToggle'} }
  use { 'junegunn/goyo.vim', cmd: {'Goyo'} }
-- }}}

  use { 'chrisbra/colorizer', cmd: colorizerCmds }
  use { 'godlygeek/tabular', opt: true, cmd: {
        'Tabularize'
        'AddTabularPattern'
        'AddTabularPipeline'
       }}

--- toggled by ftplugin {{{
  use { opt: true, 'tpope/vim-projectionist'}
  use { opt: true, 'hkupty/iron.nvim' }
  -- use { opt: true, 'urbainvaes/vim-ripple'}

  use { opt: true, 'svermeulen/nvim-moonmaker' }

  use { opt: true, 'dhruvasagar/vim-table-mode', cmd: tableModeCmds }
  use { opt: true, 'vim-pandoc/vim-pandoc'}
  use { opt: true, 'vim-pandoc/vim-pandoc-after'}
  use { opt: true, 'vim-pandoc/vim-pandoc-syntax'}

  use { opt: true, 'johngrib/vim-game-snake', cmd: {'VimGameSnake'}}
  use { opt: true, 'jamessan/vim-gnupg' }
-- }}}

-- colorschemes {{{
  use { opt: true, 'nerdypepper/agila.vim'}
  use { opt: true, 'ayu-theme/ayu-vim'}
  use { opt: true, 'junegunn/seoul256.vim'}
  use { opt: true, 'mkarmona/materialbox'}
  use { opt: true, 'gruvbox-community/gruvbox'}
  use { opt: true, 'NLKNguyen/papercolor-theme'}
-- }}}

  --- TODO: where?
  use 'neovimhaskell/haskell-vim'
  use 'mustache/vim-mustache-handlebars'

-- ftplugins only {{{
  use { opt: true, 'm42e/vim-gcov-marker' } --, ft: {'c', 'cpp'}
  use { opt: true, 'fcpg/vim-waikiki' } --, ft: {'markdown'}
  use { 'LnL7/vim-nix' } --, ft: {'nix'}
  use { 'udalov/kotlin-vim' }
  use { 'purescript-contrib/purescript-vim' }

  use { opt: true, 'ledger/vim-ledger' } --, ft: {'hledger' }
-- }}}
