(local {: format} string)

(fn fprint [str ...]
  (print (string.format str ...)))

(fn ->str [x]
  (tostring x))

(fn nil? [x]
  (= nil x))

(fn str? [x]
  (= :string (type x)))

(fn tbl? [x]
  (= :table (type x)))

(fn empty? [xs]
  (= 0 (length xs)))

(fn expand [path]
  (_G.vim.fn.expand path))

(fn glob [path]
  (_G.vim.fn.glob path true true true))

(fn exists? [path]
  (= (_G.vim.fn.filereadable path) 1))

(fn includes? [xs x]
  (accumulate [is? false
               _ v (ipairs xs)
               :until is?] (= v x)))

(fn lua-file [path]
  (_G.vim.ex.luafile path))

(fn head [xs]
  (. xs 1))

; (fn to_osc52 [s]
;   (if (os.getenv "TMUX")
;     (.. "\\ePtmux;\\e\\e]52;c;" (to_base64 s) "\\x07\\e\\\\")
;     (.. "\\e]52;c;" (to_base64 s) "\\x07")))

{: fprint
 : nil?
 : str?
 : ->str
 : tbl?
 : head
 ; : expand
 ; : glob
 ; : exists
 : lua-file
 }
