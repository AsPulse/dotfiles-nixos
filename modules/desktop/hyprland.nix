{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
  ];

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services.xserver = { 
    enable = true;
    displayManager.sddm.enable = true;
    videoDrivers = ["nvidia"];
  };
  
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };
}
