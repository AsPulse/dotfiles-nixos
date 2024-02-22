{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji
      (nerdfonts.override {
        fonts = [ "FiraCode" ];
      })
      migu
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK JP" "Noto Color Rmoji"];
        sansSerif = ["Noto Sans CJK JP" "Noto Color Rmoji"];
	monospace = ["Fira Code Nerd Font" "Noto Color Emoji"];
	emoji = ["Noto Color Emoji"];
      };
    };
  };
}
