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
    ./home/zsh.nix
    ./home/git.nix
    ./home/node.nix
    ./home/deno.nix
    ./home/rust.nix
    ./home/neovim.nix
    ./home/hyprland.nix
    ./home/fcitx.nix
  ];
}
