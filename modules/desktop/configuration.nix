{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.11";
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];
  environment.variables.EDITOR = "vim";

  users.users.aspulse = {
    shell = pkgs.zsh;
    createHome = true;
    home = "/home/aspulse";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    uid = 1000;
  };
  programs.zsh.enable = true;
}
