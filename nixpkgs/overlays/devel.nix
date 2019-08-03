self: super:

  let
    all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
  in
{
  pyPkgs = super.pyPkgs or {} // {
    pyEnv = self.python37.withPackages(ps: with ps; [
      ipython
      ipdb
      python
      pip
      virtualenv
      requests

      yapf

      goobook
      mps-youtube
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
    inherit (self) stack;
    ghc = self.hiPrio self.ghc;

    # Install stable HIE for GHC 8.6.4
    hie = all-hies.unstableFallback.selection { selector = p: { inherit (p) ghc864; }; };
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
}
