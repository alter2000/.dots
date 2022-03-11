(import-macros {: map! : buf-map!} :macro.map)
(import-macros {: let!} :macro.var)
;; COQ >>>

(let! :g.coq_settings
  {:auto_start "shut-up"
   :display.pum.fast_close false
   :display.pum.y_max_len 10
   :display.ghost_text.context [ "" "" ]
   :match.max_results 15
   :match.fuzzy_cutoff 0.7
   :keymap {:bigger_preview "<c-s-k>"
            :jump_to_mark "<c-,>"
            :pre_select true
            :recommended false
            ; :repeat "<space>."
            }
   :clients {:paths.path_seps ["/"]
             :paths.preview_lines 5
             }
   })

(map! [i :noremap :silent :expr] "<esc>"
      "pumvisible() ? \"\\<c-e><esc>\" : \"\\<esc>\""
      "wrap <esc> to cancel completion menu")
(map! [i :noremap :silent :expr] "<c-c>"
      "pumvisible() ? \"\\<c-e><c-c>\" : \"\\<c-c>\""
      "wrap <c-c> to cancel completion menu")
(map! [i :noremap :silent :expr] "<bs>"
      "pumvisible() ? \"\\<c-e><bs>\" : \"\\<bs>\""
      "wrap <bs> to cancel completion menu")
(map! [i :noremap :silent :expr] "<tab>"
      "pumvisible() ? \"\\<c-n>\" : \"\\<tab>\""
      "wrap tab to go to next completion")
(map! [i :noremap :silent :expr] "<s-tab>"
      "pumvisible() ? \"\\<c-p>\" : \"\\<s-tab>\""
      "wrap S-tab to go to previous completion")
(map! [i :noremap :silent :expr] "<cr>"
      "pumvisible() ? (complete_info().selected == -1 ? \"\\<C-e><CR>\" : \"\\<C-y>\") : \"\\<CR>\"")
(local coq (require :coq))

;; <<<
;; LSP config >>>
(local lsp (require :lspconfig))

(fn coqc [?config] (coq.lsp_ensure_capabilities (or ?config {})))

(lsp.pyright.setup (coqc))
(lsp.bashls.setup  (coqc))
(lsp.rls.setup     (coqc))
(lsp.rnix.setup    (coqc))
; (lsp.texlab.setup (coq.lsp_ensure_capabilities {}))

(lsp.hls.setup {:settings
  { :formattingProvider "stylish-haskell"
    :formatOnImportOn false
    ; :liquidOn true
    :hlintOn true
    :maxCompletions 10
    :completionSnippetsOn true
    :haddockComments.globalOn true
    :ghcide-code-actions-type-signatures.globalOn true
    :ghcide-type-lenses.globalOn true
    :display.ghost_text.enabled false
    }})

(lsp.cmake.setup (coqc))
(lsp.ccls.setup (coqc
  {:settings {:cache.directory "/home/alter2000/.cache/ccls"
               :client.snippetSupport true
               :completion.placeholder false
               }
   :init_options {:compilationDatabaseDirectory "build"
                  :index.threads 4}}))
(lsp.gopls.setup (coqc))
(lsp.html.setup (coqc))

;; <<<
;; Keybindings >>>
; TODO: XXX: WHAT: REEEE
(map! [n :noremap :silent]  "gD"         "<Cmd>lua vim.lsp.buf.declaration()<CR>")
(map! [n :noremap :silent]  "gd"         "<Cmd>lua vim.lsp.buf.definition()<CR>")
(map! [n :noremap :silent]  "K"          "<cmd>call func#show_documentation()<CR>")
(map! [n :noremap :silent]  "gi"         "<cmd>lua vim.lsp.buf.implementation()<CR>")
(map! [n :noremap :silent]  "<C-k>"      "<cmd>lua vim.lsp.buf.signature_help()<CR>")
(map! [n :noremap :silent]  "<leader>sa" "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
(map! [n :noremap :silent]  "<leader>sr" "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
(map! [n :noremap :silent]  "<leader>sl" "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
(map! [n :noremap :silent]  "<leader>D"  "<cmd>lua vim.lsp.buf.type_definition()<CR>")
(map! [n :noremap :silent]  "<leader>r"  "<cmd>lua vim.lsp.buf.rename()<CR>")
(map! [n :noremap :silent]  "gr"         "<cmd>lua vim.lsp.buf.references()<CR>")
(map! [n :noremap :silent]  "<leader>e"  "<cmd>lua vim.diagnostic.open_float()<CR>")
(map! [n :noremap :silent]  "[c"         "<cmd>lua vim.diagnostic.goto_prev()<CR>")
(map! [n :noremap :silent]  "]c"         "<cmd>lua vim.diagnostic.goto_next()<CR>")
(map! [n :noremap :silent]  "<leader>q"  "<cmd>lua vim.diagnostic.setloclist()<CR>")
(map! [n :noremap :silent]  "gD"         "<Cmd>lua vim.buf.declaration()<CR>")
(map! [n :noremap :silent]  "<leader>a"  "<cmd>lua vim.lsp.buf.code_action()<CR>")

;; <<<
;; Linting >>>
(vim.diagnostic.config {
  :underline {:severity vim.diagnostic.severity.ERROR}
  :virtual_text false
  :signs true
  :severity_sort true
})
(let [signs {:Error "●" :Warn "×"}]
  (each [type icon (pairs signs)]
    (local hl (.. "DiagnosticSign" type))
    (vim.fn.sign_define hl {:text icon :texthl hl :numhl hl})))
(vim.cmd "autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope=\"cursor\"})")
;; <<<
;; Iron.nvim >>>
(let! :g.iron_map_extended 0)

(vim.cmd "packadd iron.nvim")
(local i (. (require :iron) :core))

(i.add_repl_definitions
  [{:python  {:ipy   {:command [ "ipython3" ]}}}
   {:haskell {:stack {:command [ "stack ghci" ]
                      :open  {":{" ""}
                      :close {":}" ""}}
              :raw   {:command [ "ghci" ]
                      :open  {":{" ""}
                      :close {":}" ""}}}}
   {:clojure {:lein {:command [ "lein" "repl" ":connect" ]}}}
   ])

(i.set_config {:preferred
  {:haskell :stack
   :python :ipy
   :clojure :lein
  }})
;; <<<
;; smart-pairs >>>
(let [p (require :pairs)]
  (p:setup {:triplet true
            }))
;; <<<
;; vim: foldmarker=>>>,<<<
