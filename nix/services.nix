{ config, pkgs, ... }:

{
  services = {
    acpid.enable = true;
    fprintd.enable = true;
    fstrim.enable = true;
    gpm.enable = true;
    ntp.enable = true;

    xbanish.enable = true;

    compton = {
      enable = true;
      extraOptions = (builtins.readFile /home/alter2000/.dots/compton.conf);
    };

    locate = {
      enable = true;
      interval = "30min";
    };

    logind = {
      lidSwitch = "suspend";
      lidSwitchDocked = "ignore";
    };

    mpd = {
      enable = true;
      systemWide = false;
      user = "alter2000";
      musicDirectory = "~/lfs/music";
      playlistDirectory = "~/lfs/music/.playlists";
      dataDir = "~/.dots/mpd";
    };

    offlineimap = {
      enable = true;
      path = [pkgs.bash pkgs.pass pkgs.python];
    };

    openssh = {
      enable = true;
      startWhenNeeded = true;
      allowSFTP = true;
      ports = [40];
      gatewayPorts = "yes";
    };

    # clamav = {
    #   daemon.enable = true;
    #   updater = {
    #     enable = true;
    #     frequency = 3;
    #     interval = "daily";
    #   };
    # };

    thinkfan = {
      enable = true;
      fan = "tp_fan /proc/acpi/ibm/fan";
      levels = ''
        (0,	0,	43)
        (1,	41,	47)
        (2,	46,	52)
        (3,	51,	58)
        (4,	57,	62)
        (5,	60,	66)
        (6,	60,	66)
        (7,	63,	32767)
      '';
      sensors = ''
        hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input
        hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp2_input
        hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp3_input
      '';
      # levels = ''
      #   (0,	0,	47)
      #   (1,	46,	51)
      #   (2,	50,	55)
      #   (3,	54,	58)
      #   (4,	57,	62)
      #   (5,	60,	66)
      #   (6,	55,66)
      #   (7,	63,	32767)
      # '';
    };

    xserver = {
      enable = true;
      layout = "gb";
      xkbOptions = "caps:ctrl_modifier";
      autoRepeatDelay = 220;
      autoRepeatInterval = 34;

      # synaptics = {
      #   enable = true;
      #   twoFingerScroll = true;
      #   buttonsMap = [ 1 3 2 ]; # enables right clicking with two fingers
      #   maxSpeed = "2.0";
      #   additionalOptions = ''
      #   Option "SoftButtonAreas" "3471 5664 4057 8128 0 0 0 0"
      #   Option "ClickFinger1" "1"
      #   Option "ClickFinger2" "3"
      #   Option "ClickFinger3" "2"
      #   Option "TapButton1" "1"
      #   Option "TapButton2" "3"
      #   Option "TapButton3" "2"
      #   Option "AccelFactor" "0.015"
      #   '';
      # };

      libinput = {
        enable = true;
        scrollMethod = "twofinger";
        horizontalScrolling = true;
        scrollButton = 1;
        additionalOptions = ''
          Option "TappingDrag" "true"
        '';
      };

      multitouch = { enable = true; tapButtons = true; };

      displayManager = {
        auto = { enable = true; user = "alter2000"; };
        # lightdm = {
        #   enable = true;
        #   autoLogin = { enable = true; user = "alter2000"; };
        # };
      };
      desktopManager.xterm.enable = false;

      windowManager = {
        default = "i3";
        # default = "sway";

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

    };
  };
}
