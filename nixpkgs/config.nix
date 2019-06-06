{
  allowUnfree = true;
  overlays = [
    ./user.nix
    ./pkgmods.nix
    ./epitech.nix
    # ./emacs.nix  # why oh why
  ];
  permittedInsecurePackages = [
    "kiwix-0.9"
  ];
}
