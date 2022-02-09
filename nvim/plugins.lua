vim.cmd [[packadd packer.nvim]]
local p = require('packer')

local fugitiveCmds =
  { 'G', 'Git', 'Ggrep', 'GLgrep', 'Gclog', 'Gllog', 'Gcd', 'Glcd', 'Gedit', 'Gsplit', 'Gvsplit', 'Gtabedit'
  , 'Gread', 'Gwrite', 'Gwq', 'Gdiffsplit', 'GMove', 'GRename', 'GDelete', 'GRemove', 'GBrowse'
  }

local tableModeCmds =
  { 'TableModeToggle', 'TableModeEnable', 'TableModeDisable', 'Tableize', 'TableModeRealign'
  , 'TableAddFormula', 'TableEvalFormulaLine', 'TableSort' }

local colorizerCmds =
  { 'ColorHighlight', 'ColorClear', 'ColorContrast', 'ColorSwapFgBg'
  , 'ColorToggle', 'RGB2Term', 'Term2RGB', 'HSL2RGB' }

return p.startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use {'svermeulen/nvim-moonmaker'}

-- everywhere {{{
  use {'neoclide/coc.nvim', branch='release'}
  use 'ludovicchabant/vim-gutentags'
  use 'machakann/vim-sandwich'
  use 'tpope/vim-commentary'

  use 'mhinz/vim-startify'
  use 'jamessan/vim-gnupg'
  use {'tpope/vim-fugitive', cmd = fugitiveCmds}
  use {'simnalamburt/vim-mundo', cmd = {'MundoToggle'}}
  use {'junegunn/goyo.vim', cmd = {'Goyo'}}
-- }}}

  use {'chrisbra/colorizer', cmd = colorizerCmds }
  use {'godlygeek/tabular', opt = true, cmd =
        { 'Tabularize'
        , 'AddTabularPattern'
        , 'AddTabularPipeline'
      }}

--- toggled by ftplugin {{{
  use {opt = true, 'tpope/vim-projectionist'}
  use {opt = true, 'urbainvaes/vim-ripple'}

  use {opt = true, 'dhruvasagar/vim-table-mode', cmd = tableModeCmds }
  use {opt = true, 'vim-pandoc/vim-pandoc'}
  use {opt = true, 'vim-pandoc/vim-pandoc-after'}
  use {opt = true, 'vim-pandoc/vim-pandoc-syntax'}

  use {opt = true, 'johngrib/vim-game-snake', cmd = {'VimGameSnake'}}
-- }}}

-- colorschemes {{{
  use { opt = true, 'nerdypepper/agila.vim'}
  use { opt = true, 'ayu-theme/ayu-vim'}
  use { opt = true, 'junegunn/seoul256.vim'}
  use { opt = true, 'mkarmona/materialbox'}
  use { opt = true, 'gruvbox-community/gruvbox'}
  use { opt = true, 'NLKNguyen/papercolor-theme'}
-- }}}

  --- TODO: where?
  use 'neovimhaskell/haskell-vim'
  -- use {'glacambre/firenvim', run = function()
  --       vim.fn['firenvim#install'](0) end }

-- ftplugins only {{{
  use {opt = true, 'm42e/vim-gcov-marker' --[[, ft = {'c', 'cpp'}]]  }
  use {opt = true, 'fcpg/vim-waikiki'     --[[, ft = {'markdown'}]]  }
  use {opt = true, 'LnL7/vim-nix'         --[[, ft = {'nix'     }]]  }
  use {opt = true, 'anekos/hledger-vim'   --[[, ft = {'hledger' }]]  }
-- }}}
end)
