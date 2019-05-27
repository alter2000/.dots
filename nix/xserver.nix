{ pkgs }:

{
  enable = true;
  layout = "gb";
  xkbOptions = "caps:ctrl_modifier";
  autoRepeatDelay = 220;
  autoRepeatInterval = 34;

  libinput = {
    enable = true;
    scrollMethod = "twofinger";
    horizontalScrolling = true;
    scrollButton = 1;
    additionalOptions = ''
      Option "TappingDrag" "true"
    '';
  };

  multitouch = {
    enable = true;
    tapButtons = true;
  };

  displayManager = {
    auto = { enable = true; user = "alter2000"; };
  };

  desktopManager.xterm.enable = false;
  desktopManager.default = "none";

  windowManager = {
    default = "i3";

    # sway = {
    #   enable = true;
    #   package = pkgs.sway;
    #   extraPackages = with pkgs; [rofi waybar swaylock];
    # };

    i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [rofi polybar i3lock-color];
    };

  };

}
