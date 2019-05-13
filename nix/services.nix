{ config, pkgs, ... }:

{
  services = {
    imports = [
      ./xkb.nix
    ];
    acpid.enable = true;
    fprintd.enable = true;
    fstrim.enable = true;
    locate = {
      enable = true;
      interval = "30min";
    };
    logind = {
      lidSwitch = "suspend";
      lidSwitchDocked = "ignore";
    };
    thinkfan.enable = true;

    gpm.enable = true;
    offlineimap = {
      enable = true;
      path = [pkgs.bash pkgs.pass pkgs.python];
    };

}
