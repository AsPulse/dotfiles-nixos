{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    pavucontrol
    gtk4 # for fcitx5
    swaynotificationcenter
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
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    VDPAU_DRIVER = "nvidia";
  };

  services.xserver = { 
    enable = true;
    displayManager.sddm.enable = true;
    videoDrivers = ["nvidia"];
  };

  # Screen sharing

  services.dbus.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };


  # Sound

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
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
