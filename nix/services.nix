{ config, pkgs, ... }:

{
  services = {
    acpid.enable = true;
    fprintd.enable = true;
    fstrim.enable = true;
    locate = { enable = true; interval = "30min"; };
    logind = { lidSwitch = "suspend"; lidSwitchDocked = "ignore"; };
    # thinkfan.enable = true;

    gpm.enable = true;
    offlineimap = { enable = true; path = [pkgs.bash pkgs.pass pkgs.python]; };

    xserver = {
      enable = true;
      layout = "gb";
      xkbOptions = "caps:ctrl_modifier";
      autoRepeatDelay = 220;
      autoRepeatInterval = 34;
      synaptics = {
        enable = true;
        twoFingerScroll = true;
        buttonsMap = [ 1 3 2 ]; # enables right clicking with two fingers
        maxSpeed = "2.0";
        additionalOptions = ''
        Option "SoftButtonAreas" "3471 5664 4057 8128 0 0 0 0"
        Option "ClickFinger1" "1"
        Option "ClickFinger2" "3"
        Option "ClickFinger3" "2"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
        Option "AccelFactor" "0.015"
        '';
      };

      # libinput = {
      #   enable = true;
      #   scrollMethod = "twofinger";
      #   horizontalScrolling = true;
      #   scrollButton = 1;
      #   additionalOptions = ''
      #     Option "TappingDrag" "true"
      #   '';};
      # multitouch = {
      #   enable = true;
      #   tapButtons = true;
      # };

      displayManager = {
        auto = { enable = true; user = "alter2000";};
        # lightdm = {
        #   enable = true;
        #   autoLogin = { enable = true; user = "alter2000"; };
        };
      desktopManager.xterm.enable = false;
      windowManager = {
        default = "i3";
        i3.enable = true;
        i3.package = pkgs.i3-gaps;
        i3.extraPackages = [pkgs.rofi pkgs.polybar pkgs.i3lock];
      };
    };
    # compton.enable = true;
    # printing.enable = true;

    openssh = {
      enable = true;
      startWhenNeeded = true;
      allowSFTP = true;
      ports = [40];
      gatewayPorts = "yes";
    };
    keybase.enable = true;

    # clamav = {
    #  daemon.enable = true;
    #  updater = {
    #    enable = true;
    #    frequency = 3;
    #    interval = "daily";
    #  };
    #};
  };
}
