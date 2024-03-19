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
      ls = "eza --icons --classify";
      la = "eza --all --icons --classify";
      ll = "eza --long --all --git --icons";
    };
    profileExtra = "export PATH=\"\${KREW_ROOT:-$HOME/.krew}/bin:$PATH";
  };
  programs.starship = {
    enable = true;
  };
}
