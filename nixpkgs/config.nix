{
  allowUnfree = true;
  overlays = [
    ./user.nix
    ./pkgmods.nix
    ./epitech.nix
    ./devel.nix
    # ./emacs.nix  # why oh why
  ];
  permittedInsecurePackages = [
    "kiwix-0.9"
  ];
}
