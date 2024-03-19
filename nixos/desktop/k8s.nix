{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    kubectl
    lens
    haproxy
    kubeseal
  ];
}
