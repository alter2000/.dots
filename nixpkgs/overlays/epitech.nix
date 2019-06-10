self: super:

{
  epiPkgs = super.lowPrio super.epiPkgs or {} // {

    # gcc = self.gcc;

    gdb = self.gdb;
    manpages = self.manpages;
    ncurses.dev = self.ncurses.dev;

    gnumake = self.gnumake;
    icdiff = self.icdiff;
    nixops = self.nixops;
    nodejs = self.nodejs;
    usbutils = self.usbutils;
    inkscape = self.inkscape;

    ansible = self.ansible;
    sourcetrail = self.sourcetrail;
  };
}
