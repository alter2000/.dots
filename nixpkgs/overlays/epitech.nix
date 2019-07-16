self: super:

{
  epiPkgs = super.epiPkgs or {} // {

    # gcc = self.gcc;

    gdb = self.gdb;
    manpages = self.manpages;
    ncurses.dev = self.ncurses.dev;
    valgrind = self.valgrind;

    gnumake = self.gnumake;
    icdiff = self.icdiff;
    nixops = self.nixops;
    nodejs = self.nodejs;
    inkscape = self.inkscape;

    ansible = self.ansible;
    sourcetrail = self.sourcetrail;
  };
}
