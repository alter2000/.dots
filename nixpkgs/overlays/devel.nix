self: super:

{
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
      # neovim
      mps-youtube
      # terminal_velocity
    ]);
  };

  devPkgs = super.devPkgs or {} // {
    tig = self.tig;
    gitRepo = self.gitRepo;
    patchelf = self.patchelf;

    tcsh = self.tcsh;
    ctags = self.ctags;

    qemu = self.qemu;
    virtmanager = self.virtmanager;

    ansible-lint = self.ansible-lint;
    vim-vint = self.vim-vint;
    shfmt = self.shfmt;
    htmlTidy = self.htmlTidy;
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
