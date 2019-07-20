self: super:

  let
    all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
  in
{
  devPkgs = super.devPkgs or {} // {
    tig = self.tig;
    gitRepo = self.gitRepo;
    git-lfs = self.git-lfs;
    patchelf = self.patchelf;

    tcsh = self.tcsh;
    ctags = self.ctags;

    qemu = self.qemu;
    virtmanager = self.virtmanager;

    ansible-lint = self.ansible-lint;
    vim-vint = self.vim-vint;
    ccls = self.ccls;
    shfmt = self.shfmt;
    htmlTidy = self.htmlTidy;
  };

  pyPkgs = super.pyPkgs or {} // {
    tim = super.callPackage ../pkgs/tim.nix;
    mypy = self.mypy;
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
  };

  cPkgs = super.cPkgs or {} // {
    vagrant = self.vagrant;
    platformio = self.platformio;
    clang = self.clang;
    binutils-unwrapped = self.hiPrio self.binutils-unwrapped;
  };

  haskellPkgs = super.haskellPkgs or {} // {
    ghc = self.hiPrio self.ghc;
    stack = self.stack;
    # Install stable HIE for GHC 8.6.4
    hie = all-hies.unstableFallback.selection { selector = p: { inherit (p) ghc864; }; };
  };

  rustPkgs = super.rustPkgs or {} // {
    rustup = self.rustup;
  };

  rubyPkgs = super.rubyPkgs or {} // rec {
    ruby = self.ruby_2_6;
    bundix = self.bundix.overrideAttrs (old: {
      ruby = self.ruby_2_6;
    });
  };

  jetbrainsPkgs = super.jetbrainsPkgs or {} // {
    clion = self.jetbrains.clion;
    datagrip = self.jetbrains.datagrip;
    pycharm-professional = self.jetbrains.pycharm-professional;
    webstorm = self.jetbrains.webstorm;
  };

  androidPkgs = super.androidPkgs or {} // {
    android-studio = self.android-studio;
    apktool = self.apktool;
    genymotion = self.genymotion;
  };
}
