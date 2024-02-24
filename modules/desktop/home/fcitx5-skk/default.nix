{ fcitx5-skk-qt, pkgs }: fcitx5-skk-qt.overrideAttrs(attr: {
  buildInputs = map (
    i: if i.pname == "libskk" then (pkgs.callPackage ../libskk {  }) else i
  ) attr.buildInputs;
})
