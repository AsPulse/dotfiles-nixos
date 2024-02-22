{
  home = rec {
    username = "aspulse";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };

  programs = {
    home-manager {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    bat
    exa
    ripgrep
    fd
  ];

  imports = [
    ./home/zsh.nix
    ./home/git.nix
    ./home/neovim/neovim.nix
  ];
}
