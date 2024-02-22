{ pkgs, ... }: {

  imports = [
    ./hyprland/rofi.nix
  ];

  home.packages = with pkgs; [
    kitty
    inkscape
    obs-studio
    gimp
    mongodb-compass
    discord-ptb
  ];

  home.file.".config/hypr/hyprland.conf" = {
    source = ../../../hyprland/hyprland.conf;
  };
}
