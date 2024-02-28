{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "AsPulse / あすぱる";
    userEmail = "contact@aspulse.dev";
    lfs.enable = true;
    extraConfig = {
      commit.gpgsign = true;
      user.signingkey = "1EDAD0C670BD062D";
      diff.external = "difft";
      core.excludesfile = "~/.gitignore_global";
    };
  };

  home.file.".gitignore_global" = {
    source = ./git/.gitignore_global;
  };


  # GitHub

  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-markdown-preview
      gh-dash
      gh-poi
    ];

    settings = {
      editor = "nvim";
    };
  };


  # Signed Commit

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";
  };

  home.packages = with pkgs; [
    lazygit
    difftastic
  ];
}
