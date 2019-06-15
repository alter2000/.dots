{ config, pkgs, ... }:

{
  systemd.user = {

    services = {

      "dunst" = {
        enable = true;
        description = "dunst service";
        wantedBy = [ "default.target" ];
        partOf = [ "graphical-session.target" ];
        path = [ pkgs.dunst ];
        serviceConfig = {
          ExecStart = "${pkgs.dunst}/bin/dunst";
          Restart = "always";
          RestartSec = 1;
        };
      };

      "mpd" = {
        enable = true;
        description = "music player daemon";
        wantedBy = [ "default.target" ];
        path = [ pkgs.mpd ];
        serviceConfig = {
          ExecStart = "${pkgs.mpd}/bin/mpd --no-daemon";
          Type = "notify";
          # allow MPD to use real-time priority 50
          LimitRTPRIO = 50;
          LimitRTTIME = "infinity";

          # more paranoid security settings
          NoNewPrivileges = "yes";
          ProtectKernelTunables = "yes";
          ProtectControlGroups = "yes";
          # AF_NETLINK is required by libsmbclient, or it will exit() .. *sigh*
          RestrictAddressFamilies = "AF_INET AF_INET6 AF_UNIX AF_NETLINK";
          RestrictNamespaces = true;
        };
      };

      "compton" = {
        enable = true;
        description = "custom compton service";
        wantedBy = [ "default.target" ];
        partOf = [ "graphical-session.target" ];
        path = [ pkgs.compton ];
        serviceConfig = {
          ExecStart = "${pkgs.compton}/bin/compton";
          Restart = "always";
          RestartSec = 3;
        };
      };

      "sxhkd" = {
        enable = true;
        description = "hotkey daemon user service";
        wantedBy = [ "default.target" ];
        partOf = [ "graphical-session.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.sxhkd}/bin/sxhkd";
          ExecReload = "${pkgs.utillinux}/bin/kill -SIGUSR1 $MAINPID";
          Restart = "always";
          RestartSec = 2;
        };
      };

    };

    timers = {

      "1minute" = {
        enable = true;
        description = "1 minute timer";
        wantedBy = [ "default.target" ];
        timerConfig = {
          Persistent = true;
          OnCalendar = "";
          Unit = "offlineimap.service";
        };
        unitConfig = {
          refuseManualStart = false;
          refuseManualStop = false;
        };
      };

    };

  };
}
