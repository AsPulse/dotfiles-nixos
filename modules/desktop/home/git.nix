{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "AsPulse";
    userEmail = "contact@aspulse.dev";
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
}
