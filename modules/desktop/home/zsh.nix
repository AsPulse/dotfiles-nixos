{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      cat = "bat";
      ls = "exa --icons --classify";
      la = "exa --all --icons --classify";
      ll = "exa --long --all --git --icons";
    };
  };
  programs.starship = {
    enable = true;
  };
}
