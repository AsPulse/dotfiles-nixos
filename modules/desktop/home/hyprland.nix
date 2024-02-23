{ pkgs, ... }: {

  imports = [
    ./hyprland/rofi.nix
    ./hyprland/vivaldi.nix
  ];

  home.packages = with pkgs; [
    kitty
    inkscape
    obs-studio
    gimp
    mongodb-compass
    discord-ptb
    keepassxc
  ];

  home.file.".config/hypr/hyprland.conf" = {
    source = ../../../hyprland/hyprland.conf;
  };
}
