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

  multitouch.enable = true;
  multitouch.tapButtons = true;

  displayManager = {
    session = [ {
      name = "i3";
      manage = "window";
      start = ''
        exec ~/.xsession
      '';
    } ];
    lightdm = {
      enable = true;
      autoLogin = {
        enable = false;
        user = "alter2000";
      };
      greeters.mini = {
        enable = true;
        user = "alter2000";
        extraConfig = ''
          [greeter]
          password-label-text = open me up daddy

          [greeter-theme]
          background-image = ""
          font = Iosevka
        '';
      };
    };
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
