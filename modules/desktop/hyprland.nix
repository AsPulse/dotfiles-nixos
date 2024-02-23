{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    pavucontrol
  ];

  # Video

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

  # Screen sharing

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };


  # Sound

  sound.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = false;
  };
  services.jack = {
    jackd.enable = true;
    alsa.enable = false;
    loopback.enable = true;
  };
  

  # Hyprland

  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };
}
