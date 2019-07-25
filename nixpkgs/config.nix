{
  allowUnfree = true;
  allowUnfreeRedistributable = true;

  overlays = [
    ./user.nix
    ./pkgmods.nix
    ./epitech.nix
    ./devel.nix
    # ./emacs.nix  # why oh why
  ];

  # oraclejdk = { accept_license = true; pluginSupport = true; }
}
