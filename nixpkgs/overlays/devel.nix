self: super:

{
  pyPkgs = super.pyPkgs or {} // {
    # pefile = (import ../pkgs/pefile.nix);
    tim = super.callPackage ../pkgs/tim.nix;
    pyEnv = self.python37.withPackages(ps: with ps; [
      ipython
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

    platformio = self.platformio;
    clang = self.clang;
    binutils-unwrapped = self.hiPrio self.binutils-unwrapped;

    ghc = self.ghc;

    rustup = self.rustup;

    fatcat = super.callPackage ../pkgs/fatcat.nix {};

    tcsh = self.tcsh;
    ctags = self.ctags;
    valgrind = self.valgrind;

    qemu = self.qemu;
    vagrant = self.vagrant;
    virtmanager = self.virtmanager;

    ansible-lint = self.ansible-lint;
    vim-vint = self.vim-vint;
    shfmt = self.shfmt;
    mypy = self.mypy;
    htmlTidy = self.htmlTidy;
  };
}
