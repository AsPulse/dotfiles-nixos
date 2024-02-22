{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "AsPulse / あすぱる";
    userEmail = "contact@aspulse.dev";
    lfs.enable = true;
    extraConfig = {
      diff.external = "difft";
    };
  };

  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-markdown-preview
      gh-dash
    ];
    settings = {
      editor = "nvim";
    };
  };

  home.packages = with pkgs; [
    lazygit
    difftastic
  ];
}
