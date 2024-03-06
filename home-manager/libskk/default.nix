{ libskk }: libskk.overrideAttrs(_old: {
  patches = [
    ./0001-fix-conflicted-keymap.patch
    ./0002-feat-rom-kana-with-z.patch
  ];
})
