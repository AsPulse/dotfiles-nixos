{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wireguard-tools
    nettools
  ];
  systemd.services.wg0 = {
    description = "Wireguard VPN for wg0";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" "nss-lookup.target" ];
    after = [ "network-online.target" "nss-lookup.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.wireguard-tools}/bin/wg-quick up wg0";
      ExecStop = "${pkgs.wireguard-tools}/bin/wg-quick down wg0";
      ExecReload = "${pkgs.bash}/bin/bash -c 'exec ${pkgs.wireguard-tools}/bin/wg syncconf wg0 <(exec ${pkgs.wireguard-tools}/bin/wg-quick strip wg0)'";
      Environment = "WG_ENDPOINT_RESOLUTION_RETRIES=infinity";
    };
  };
}
