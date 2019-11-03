self: super:

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};

  unstable = import (fetchTarball "https://github.com/nixos/nixpkgs/tarball/master") {
        config = self.config;
      };
in
{
  pyPkgs = super.pyPkgs or {} // {
    pyEnv = self.python37.withPackages (ps: with ps; [
      ipython
      ipdb
      python
      pip
      virtualenv
      requests

      yapf
      pylint
      flake8

      goobook
      mps-youtube
      subliminal
      # neovim
      # terminal_velocity
    ]);
    tim = (super.callPackage ../pkgs/tim.nix);
    mypy = self.mypy;
  };

  devPkgs = super.devPkgs or {} // {
    inherit (self)
      tig
      gitRepo
      git-lfs
      patchelf

      tcsh
      ctags

      qemu
      virtmanager

      ansible-lint
      vim-vint
      ccls
      shfmt
      shellcheck
      htmlTidy
    ;
  };

  cPkgs = super.cPkgs or {} // {
    inherit (self)
      vagrant
      platformio
      clang
      # binutils
    ;
  };

  haskellPkgs = super.haskellPkgs or {} // {
    env = self.haskellPackages.ghcWithHoogle (ps: with ps; [
      hlint
      hindent
      stylish-haskell
      ghcid

      markdown-unlit

      cabal-install
      cabal2nix
      stack
    ]);

    # Install stable HIE for GHC 8.6.4
    hie = all-hies.unstableFallback.selection { selector = p: {
      inherit (p)
        ghc844
        ghc863
        ghc864
        ghc865
        # ghc866
      ;
    }; };
  };

  rustPkgs = super.rustPkgs or {} // {
    inherit (self) rustup;
  };

  rubyPkgs = super.rubyPkgs or {} // rec {
    ruby = self.ruby_2_6;
    bundix = self.bundix.overrideAttrs (old: {
      inherit ruby;
    });
  };

  jetbrainsPkgs = super.jetbrainsPkgs or {} // {
    inherit (self)
      clion
      datagrip
      pycharm-professional
      webstorm
    ;
  };

  androidPkgs = super.androidPkgs or {} // {
    inherit (self)
      android-studio
      apktool
      genymotion
    ;
  };

  mdiPkgs = super.mdiPkgs or {} // {
    inherit (self)
      dep
      direnv
      gnumake
      # kind
      # kubernetes
      # minikube
      # vagrant
      # virtualboxHeadless
    ;
    inherit (unstable) go;
    gotools = super.lowPrio self.gotools;

    inherit (self.vimPlugins) vim-terraform;

    # kubernetes-helm = import ../pkgs/helm/default.nix;
  };
}
