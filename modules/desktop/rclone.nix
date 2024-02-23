{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    rclone
  ];

  systemd.services.aspulse_gdrive_mount =
    let mountpath = "/mnt/aspulse_gdrive"; in {
      description = "Mount ${mountpath}";
      requires = [ "network-online.target" ];
      after = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStartPre = [
          "/run/current-system/sw/bin/mkdir -p ${mountpath}"
        ];
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount aspulse_gdrive: ${mountpath} \
            --config /home/aspulse/.config/rclone/rclone.conf \
            --allow-other
        '';
        ExecStop = "/run/wrappers/bin/fusermount -u ${mountpath}";
        Type = "notify";
        Restart = "always";
        RestartSec = "100s";
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
    };
}
