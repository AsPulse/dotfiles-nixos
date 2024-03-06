{ pkgs, ... }: {
  home = rec {
    username = "aspulse";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    bat
    eza
    ripgrep
    fd
    xcp
    dust
    jq
    yq
    imagemagick
    neofetch
    nkf
    jellyfin-ffmpeg
    act
    google-cloud-sdk
  ];

  imports = [
    ./zsh.nix
    ./git.nix
    ./node.nix
    ./deno.nix
    ./rust.nix
    ./neovim.nix
    ./hyprland.nix
    ./fcitx.nix
  ];
}
