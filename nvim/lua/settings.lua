local i = (require('iron')).core
i.add_repl_definitions({
  python = {
    ipy = {
      command = {
        "ipython3"
      }
    }
  },
  haskell = {
    stack = {
      command = {
        "stack ghci"
      }
    },
    raw = {
      command = {
        "ghci"
      }
    }
  }
})
return i.set_config({
  preferred = {
    python = 'ipython',
    haskell = 'stack'
  }
})
