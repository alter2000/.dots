vim.cmd([[packadd packer.nvim]])
local p = require('packer')
local fugitiveCmds = {
  'G',
  'Git',
  'Ggrep',
  'GLgrep',
  'Gclog',
  'Gllog',
  'Gcd',
  'Glcd',
  'Gedit',
  'Gsplit',
  'Gvsplit',
  'Gtabedit',
  'Gread',
  'Gwrite',
  'Gwq',
  'Gdiffsplit',
  'GMove',
  'GRename',
  'GDelete',
  'GRemove',
  'GBrowse'
}
local tableModeCmds = {
  'TableModeToggle',
  'TableModeEnable',
  'TableModeDisable',
  'Tableize',
  'TableModeRealign',
  'TableAddFormula',
  'TableEvalFormulaLine',
  'TableSort'
}
local colorizerCmds = {
  'ColorHighlight',
  'ColorClear',
  'ColorContrast',
  'ColorSwapFgBg',
  'ColorToggle',
  'RGB2Term',
  'Term2RGB',
  'HSL2RGB'
}
return p.startup(function()
  use({
    'wbthomason/packer.nvim',
    opt = true
  })
  use({
    'neoclide/coc.nvim',
    branch = 'release'
  })
  use({
    'ludovicchabant/vim-gutentags'
  })
  use({
    'machakann/vim-sandwich'
  })
  use({
    'tpope/vim-commentary'
  })
  use({
    'mhinz/vim-startify'
  })
  use({
    'tpope/vim-fugitive',
    cmd = fugitiveCmds
  })
  use({
    'simnalamburt/vim-mundo',
    cmd = {
      'MundoToggle'
    }
  })
  use({
    'junegunn/goyo.vim',
    cmd = {
      'Goyo'
    }
  })
  use({
    'chrisbra/colorizer',
    cmd = colorizerCmds
  })
  use({
    'godlygeek/tabular',
    opt = true,
    cmd = {
      'Tabularize',
      'AddTabularPattern',
      'AddTabularPipeline'
    }
  })
  use({
    opt = true,
    'tpope/vim-projectionist'
  })
  use({
    opt = true,
    'hkupty/iron.nvim'
  })
  use({
    opt = true,
    'svermeulen/nvim-moonmaker'
  })
  use({
    opt = true,
    'dhruvasagar/vim-table-mode',
    cmd = tableModeCmds
  })
  use({
    opt = true,
    'vim-pandoc/vim-pandoc'
  })
  use({
    opt = true,
    'vim-pandoc/vim-pandoc-after'
  })
  use({
    opt = true,
    'vim-pandoc/vim-pandoc-syntax'
  })
  use({
    opt = true,
    'johngrib/vim-game-snake',
    cmd = {
      'VimGameSnake'
    }
  })
  use({
    opt = true,
    'jamessan/vim-gnupg'
  })
  use({
    opt = true,
    'nerdypepper/agila.vim'
  })
  use({
    opt = true,
    'ayu-theme/ayu-vim'
  })
  use({
    opt = true,
    'junegunn/seoul256.vim'
  })
  use({
    opt = true,
    'mkarmona/materialbox'
  })
  use({
    opt = true,
    'gruvbox-community/gruvbox'
  })
  use({
    opt = true,
    'NLKNguyen/papercolor-theme'
  })
  use('neovimhaskell/haskell-vim')
  use('mustache/vim-mustache-handlebars')
  use({
    opt = true,
    'm42e/vim-gcov-marker'
  })
  use({
    opt = true,
    'fcpg/vim-waikiki'
  })
  use({
    'LnL7/vim-nix'
  })
  use({
    'udalov/kotlin-vim'
  })
  use({
    'purescript-contrib/purescript-vim'
  })
  return use({
    'ledger/vim-ledger'
  })
end)
