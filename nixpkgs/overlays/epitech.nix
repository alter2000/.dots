self: super:

{
  epiPackages = super.epiPackages or {} // {

    # binutils = self.binutils;
    gdb = self.gdb;
    manpages = self.manpages;
    tcsh = self.tcsh;
    clang = self.clang;
    ctags = self.ctags;
    valgrind = self.valgrind;

    gnumake = self.gnumake;
    icdiff = self.icdiff;
    nixops = self.nixops;
    nodejs = self.nodejs;
    usbutils = self.usbutils;

    ansible = self.ansible;
    sourcetrail = self.sourcetrail;
    vagrant = self.vagrant;
    virtmanager = self.virtmanager;

  };
}
