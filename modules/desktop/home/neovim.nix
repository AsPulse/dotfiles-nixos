{  pkgs, ... }: {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
  };
  home.file.".config/nvim" = {
    source = ../../../neovim;
    recursive = false;
  };
  home.file.".vim/tsnip" = {
    source = ../../../tsnip;
    recursive = false;
  };
  home.packages = with pkgs; [
    neovide
    nodePackages.typescript-language-server
  ];
}