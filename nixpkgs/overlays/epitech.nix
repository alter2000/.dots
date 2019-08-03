self: super:

{
  epiPkgs = super.epiPkgs or {} // {
    inherit (self)
      # gcc
      gdb
      manpages
      valgrind

      gnumake
      icdiff
      nixops
      nodejs
      inkscape

      ansible
      sourcetrail
    ;
    inherit (self.ncurses) dev;
  };
}
