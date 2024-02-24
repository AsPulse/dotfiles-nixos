{ pkgs, ... }: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-mozc
      (pkgs.callPackage ./fcitx5-skk {  })
      fcitx5-configtool
    ];
  };
}
