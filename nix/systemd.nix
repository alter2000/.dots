{ config, pkgs, ... }:

{
  systemd.user = {
    services = {
      "powertop" = {
        enable = true;
        description = "powertop autotune service";
        wantedBy = [ "multi-user.target" ];
        path = [ pkgs.powertop ];
        serviceConfig = {
          ExecStart = "${pkgs.powertop}/bin/powertop --auto-tune";
          Type = "oneshot";
        };
      };

      "dunst" = {
        enable = true;
        description = "dunst service";
        wantedBy = [ "default.target" ];
        path = [ pkgs.dunst ];
        serviceConfig = {
          ExecStart = "${pkgs.dunst}/bin/dunst";
          Restart = "always";
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
