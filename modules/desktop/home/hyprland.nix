{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty
  ];
  home.file.".config/hypr/hyprland.conf" = {
    source = ../../../hyprland/hyprland.conf;
  };
}
