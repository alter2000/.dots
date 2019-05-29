self: super:

{
  epiPackages = super.lowPrio super.epiPackages or {} // {

    binutils-unwrapped = self.hiPrio self.binutils-unwrapped;
    # gcc = self.gcc;
    clang = self.clang;

    gdb = self.gdb;
    manpages = self.manpages;
    ncurses.dev = self.ncurses.dev;
    tcsh = self.tcsh;
    ctags = self.ctags;
    valgrind = self.valgrind;
    qemu = self.qemu;

    gnumake = self.gnumake;
    icdiff = self.icdiff;
    nixops = self.nixops;
    nodejs = self.nodejs;
    usbutils = self.usbutils;
    inkscape = self.inkscape;

    ansible = self.ansible;
    sourcetrail = self.sourcetrail;
    vagrant = self.vagrant;
    virtmanager = self.virtmanager;

  };
}
