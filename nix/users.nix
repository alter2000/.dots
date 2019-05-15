{ config, pkgs, ... }:

{
  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "uk";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Tirana";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      "alter2000" = {
        isNormalUser = true;
        uid = 1000;
        extraGroups = ["alter2000" "adbusers" "ansible" "libvirtd" "networkmanager" "video" "wheel"];
        home = "/home/alter2000";
        createHome = true;
        shell = pkgs.zsh;
      };
    };
    defaultUserShell = pkgs.bash;
  };

  virtualisation = {
    # docker = { enable = true; };
    # libvirtd = { enable = true; };
    # virtualbox.host = { enable = true; headless = true; };
  };

}
