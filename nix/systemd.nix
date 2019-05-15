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
