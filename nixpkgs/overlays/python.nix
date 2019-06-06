self: super:

{
  pyPkgs = super.pyPkgs or {} // {
    # pefile = (import ../pkgs/pefile.nix);
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
}
