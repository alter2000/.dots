# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./pkgs.nix
      ./services.nix
      ./systemd.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  # boot.loader.grub.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = [ ];

  # fileSystems = {
  #   "/".options = ["discard" "relatime" ];
  #   "/boot".options = ["discard" "relatime" ];
  #   "/home".options = ["discard" "relatime" ];
  # };

  networking = {
    hostName = "alterpad"; # Define your hostname.
    dhcpcd.enable = false;
    networkmanager.enable = true;  # Enables wireless support via wpa_supplicant.
    useDHCP = true;

    hosts = {
      "127.0.0.1" = [ "localhost" ];
      "192.168.0.1" = [ "lanlocal" ];
    };

    # Open ports in the firewall.
    firewall = {
      allowedTCPPorts = [ 25 40 80 443 4000 ];
      allowedUDPPorts = [ 25 40 80 443 4000 ];
      allowedTCPPortRanges = [ {from = 60000; to = 65535;} ];
      allowedUDPPortRanges = [ {from = 60000; to = 65535;} ];
    };
  };
  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "uk";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Tirana";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.alter2000 = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = ["alter2000" "adbusers" "ansible" "libvirtd" "networkmanager" "video" "wheel"];
    home = "/home/alter2000";
    createHome = true;
    shell = pkgs.zsh;
  };
  users.extraUsers.root.initialHashedPassword = "";
  users.defaultUserShell = pkgs.bash;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.variables = {
    PAGER = "less --raw-control-chars";
    EDITOR = "vim";
    GIO_EXTRA_MODULES = [ "${pkgs.gvfs}/lib/gio/modules" ];
  };

  programs = {
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };
    adb.enable = true;

    bash.enableCompletion = true;
    fish = {
      enable = true;
      vendor = {
        config.enable = true;
        completions.enable = true;
        functions.enable = true;
      };
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
    };
    less.enable = true;
    light.enable = true;
  };

  sound = {
    enable = true;
    mediaKeys = { enable = true; volumeStep = "3%"; };
  };
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "powersave";
    powertop.enable = true;
  };
  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
    trackpoint = {
      emulateWheel = true;
      enable = true;
      sensitivity = 130;
      speed = 120;
    };
    opengl.driSupport32Bit = true;
  };

  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;
    fonts = with pkgs; [
      noto-fonts liberation_ttf overpass
    ];

    fontconfig = {
      enable = true;
      allowBitmaps = false;
      cache32Bit = true;
      hinting.enable = true;
      # subpixel.lcdFilter = ;
      defaultFonts = {
        monospace = [
          "League Mono"
          "Hasklig"
          "IBM Plex Mono"
          "Powerline Extra Symbols"];
        sansSerif = [
          "Overpass"
          "IBM Plex Sans"
          "Noto Sans"];
        serif = [
          "CMU Serif"
          "Liberation Serif"
          "Noto Serif"];
      };
    };
  };

  virtualisation = {
  #   docker = {
  #     enable = true;
  #     autoPrune = true;
  #   };
  #   libvirtd = {
  #     enable = true;
  #   };
    virtualbox.host = {
      enable = true;
      # headless = true;
    };
  };

  security = {
    pam = { enableSSHAgentAuth = true; usb.enable = true; };
    polkit.enable = true;
    rngd.enable = true;
    rtkit.enable = true;
    sudo = {
      enable = true;
      extraConfig = ''
        Defaults	insults
        Defaults	rootpw
      '';
    };
  };

  nix = {
    allowedUsers = ["@wheel"];
    autoOptimiseStore = true;
    buildCores = 3;
    maxJobs = 3;
    gc = {
      automatic = true;
      # dates = ["wed" "sun"];
    };
    optimise = {
      automatic = true;
      # dates = ["wed" "sun"];
    };
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system = {
    nixos.tags = ["alterpad"];
    stateVersion = "18.09"; # Did you read the comment?
  };

}
