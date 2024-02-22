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
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    zsh = {
      enable = true;
    };
    starship = {
      enable = true;
    };
  };
}
