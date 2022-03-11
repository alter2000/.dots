(import-macros {: pack
                : pack! : unpack!} :macro.pack)

(vim.cmd "packadd packer.nvim")

(local tableModeCmds
  ["TableModeToggle" "TableModeEnable" "TableModeDisable" "Tableize"
   "TableModeRealign" "TableAddFormula" "TableEvalFormulaLine" "TableSort"])

(local colorizerCmds
  ["ColorHighlight" "ColorClear" "ColorContrast" "ColorSwapFgBg"
   "ColorToggle" "RGB2Term" "Term2RGB" "HSL2RGB"])

(pack! "wbthomason/packer.nvim")
(pack! "rktjmp/hotpot.nvim")
(pack! "Olical/aniseed")
(pack! "neovim/nvim-lspconfig")
; everywhere {{{
; (pack! "neoclide/coc.nvim" {:branch "release"})
(pack! "ms-jpq/coq_nvim" {:branch "coq" :do "python -m coq deps"})
; (pack! "ms-jpq/coq.artifacts" {:branch "artifacts"})
; (pack! "ms-jpq/coq.thirdparty" {:branch "3p"})
; (pack! "ludovicchabant/vim-gutentags")

(pack! "tpope/vim-commentary")
(pack! "machakann/vim-sandwich")
(pack! "ZhiyuanLck/smart-pairs")

(pack! "mhinz/vim-startify")
(pack! "tpope/vim-fugitive")
(pack! "simnalamburt/vim-mundo" {:cmd ["MundoToggle"]})
(pack! "junegunn/goyo.vim" {:cmd ["Goyo"]})
; }}}

(pack! "chrisbra/colorizer" {:cmd colorizerCmds})
(pack!  "godlygeek/tabular"
  {:opt true :cmd ["Tabularize" "AddTabularPattern" "AddTabularPipeline"]})

; toggled by ftplugin {{{
(pack! "tpope/vim-projectionist" {:opt true})
(pack! "hkupty/iron.nvim" {:opt true})
(pack! "Olical/conjure" {:opt true})
; (pack! "urbainvaes/vim-ripple" {:opt true})

(pack! "dhruvasagar/vim-table-mode" {:opt true :cmd tableModeCmds})
(pack! "vim-pandoc/vim-pandoc" {:opt true})
(pack! "vim-pandoc/vim-pandoc-after" {:opt true})
(pack! "vim-pandoc/vim-pandoc-syntax" {:opt true})

(pack! "johngrib/vim-game-snake" {:opt true :cmd ["VimGameSnake"]})
(pack! "jamessan/vim-gnupg" {:opt true})
; }}}

; colorschemes {{{
(pack! "nerdypepper/agila.vim" {:opt true})
(pack! "ayu-theme/ayu-vim" {:opt true})
(pack! "junegunn/seoul256.vim" {:opt true})
(pack! "mkarmona/materialbox" {:opt true})
(pack! "gruvbox-community/gruvbox" {:opt true})
(pack! "NLKNguyen/papercolor-theme" {:opt true})
(pack! "savq/melange" {:opt true})
; }}}

; TODO: where?
(pack! "neovimhaskell/haskell-vim")
(pack! "mustache/vim-mustache-handlebars")

; ftplugins only {{{
(pack! "m42e/vim-gcov-marker" {:opt true}) ; :ft ["c" "cpp"]
(pack! "fcpg/vim-waikiki" {:opt true}) ; :ft ["markdown"]
(pack! "LnL7/vim-nix")
; (pack! "udalov/kotlin-vim")
(pack! "purescript-contrib/purescript-vim")

(pack! "ledger/vim-ledger" {:opt true}) ; :ft ["hledger"]
; }}}

(unpack!)
