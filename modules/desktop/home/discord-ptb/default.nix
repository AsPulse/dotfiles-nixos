{ discord-ptb }: discord-ptb.overrideAttrs(old: {
  installPhase = builtins.replaceStrings ["--add-flags"] ["--add-flags \"--disable-gpu\" --add-flags"] old.installPhase;
})
