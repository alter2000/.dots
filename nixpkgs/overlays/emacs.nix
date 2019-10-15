self: super:

{
  emacsPkgs = super.emacsPkgs or {} // rec {
    emacs = (super.emacsPackagesNg.overrideScope
        (self: super: self.melpaPackages)).emacsWithPackages (ep: with ep; [
      use-package

      # Interface
      bind-key
      company
      ivy counsel swiper
      projectile  # project management
      ripgrep  # search
      visual-fill-column
      which-key  # display keybindings after incomplete command
      winum eyebrowse # window management

      # Themes
      diminish
      spaceline # modeline beautification

      # Delimiters
      rainbow-delimiters smartparens

      # Evil
      avy
      evil
      evil-surround
      evil-indent-textobject
      evil-cleverparens
      undo-tree

      # Git
      git-auto-commit-mode
      git-timemachine
      magit

      # LaTeX
      auctex
      cdlatex
      company-math

      auto-compile
      flycheck

      markdown-mode
      super.ledger
      yaml-mode

      # Haskell
      haskell-mode
      flycheck-haskell
      company-ghci  # provide completions from inferior ghci
      dhall-mode
      hindent
      intero

      lsp-mode lsp-ui lsp-haskell lsp-java
      company-lsp
      eglot

      # Org
      org org-ref

      # Rust
      rust-mode cargo flycheck-rust

      # Mail
      notmuch messages-are-flowing

      # Nix
      nix-mode nix-buffer
      direnv

      # Maxima
      super.maxima

      # Idris
      idris-mode

      editorconfig
      fish-mode
      # w3m  # cannot build, 404?

      # Ledger
      ledger-mode flycheck-ledger evil-ledger

      groovy-mode
      scala-mode
    ]);

    autostartEmacsDaemon = super.writeTextFile {
      name = "autostart-emacs-daemon";
      destination = "/etc/xdg/autostart/emacs-daemon.desktop";
      text = ''
        [Desktop Entry]
        Name=Emacs Server
        Type=Application
        Exec=${emacs}/bin/emacs --daemon
      '';
    };
  };
}
