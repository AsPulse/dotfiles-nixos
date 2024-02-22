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
  ];

  imports = [
    ./home/zsh.nix
    ./home/git.nix
    ./home/neovim/neovim.nix
  ];
}
